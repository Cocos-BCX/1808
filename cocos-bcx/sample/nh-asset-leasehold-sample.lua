function init(step) 	
	assert(chainhelper:is_owner(),'chainhelper:is_owner()')
	read_list={public_data={is_init=true}}
	chainhelper:read_chain()
	assert(public_data.is_init==nil,'public_data.is_init==nil')
	public_data.is_init=true
	assert(step>0,'step>0')
	public_data.step=step
	public_data.scanned=0
	chainhelper:write_chain()
end


function rental_nh_asset(token_hash_or_id,price_amount, price_symbol)
	read_list={public_data={rental_list={[token_hash_or_id]=true}}}
	chainhelper:read_chain()
	if(public_data.rental_list == nil)then
		public_data.rental_list={}
	end
	assert(public_data.rental_list[token_hash_or_id]==nil,'public_data.rental_list[token_hash_or_id]==nil')
	chainhelper:transfer_nht_active_from_caller(contract_base_info.owner, token_hash_or_id, true)	--[[使用权]]
	chainhelper:transfer_nht_authority_from_caller(contract_base_info.owner, token_hash_or_id, true)--[[临时授权]]
	public_data.rental_list[token_hash_or_id] = {}
	public_data.rental_list[token_hash_or_id]['price_amount'] = price_amount
	public_data.rental_list[token_hash_or_id]['price_symbol'] = price_symbol
	public_data.rental_list[token_hash_or_id]['lessor'] = contract_base_info.caller
	public_data.rental_list[token_hash_or_id]['state']=false
	write_list={public_data={rental_list={[token_hash_or_id]=true}}}
	chainhelper:write_chain()
end

function leased_nh_asset(token_hash_or_id,estimated_lease_term)
	local expiration_date= chainhelper:real_time()+estimated_lease_term*1000000
	read_list={public_data={rental_list={[token_hash_or_id]=true},expiration_date_list={[expiration_date]=true}}}
	chainhelper:read_chain()
	if(public_data.expiration_date_list == nil)then
		public_data.expiration_date_list={}
	end
	assert(public_data.expiration_date_list[expiration_date]==nil,'public_data.expiration_date_list[expiration_date]==nil')
	assert(public_data.rental_list[token_hash_or_id]~=nil,'public_data.rental_list[token_hash_or_id]~=nil')
	assert(public_data.rental_list[token_hash_or_id]['state']==false,'public_data.rental_list[token_hash_or_id][state]==false')
	
	local amount=estimated_lease_term*public_data.rental_list[token_hash_or_id]['price_amount']
	chainhelper:transfer_from_caller(public_data.rental_list[token_hash_or_id]['lessor'],amount,public_data.rental_list[token_hash_or_id]['price_symbol'],true) 
	chainhelper:change_nht_active_by_owner(contract_base_info.caller, token_hash_or_id, true)
	public_data.rental_list[token_hash_or_id]['state']=true
	public_data.rental_list[token_hash_or_id]['expiration_date']=expiration_date
	public_data.expiration_date_list[expiration_date]=token_hash_or_id	
	write_list={public_data={rental_list={[token_hash_or_id]={state=true,expiration_date=true}},expiration_date_list={[expiration_date]=true}}}
	chainhelper:write_chain()
end

function cancellation_rental(token_hash_or_id)
	read_list={public_data={rental_list={[token_hash_or_id]=true}}}
	chainhelper:read_chain()
	assert(public_data.rental_list[token_hash_or_id]['state']==false,'public_data.rental_list[token_hash_or_id][state]==false')
	chainhelper:change_nht_active_by_owner(contract_base_info.caller, token_hash_or_id, true)
	chainhelper:transfer_nht_authority_from_owner(contract_base_info.caller, token_hash_or_id, true)
	write_list={public_data={rental_list={[token_hash_or_id]=false}}}
	chainhelper:write_chain()
end

function scan_expiration_date(token_hash_or_id)
	assert(chainhelper:is_owner(),'chainhelper:is_owner()')
	read_list={public_data={rental_list={[token_hash_or_id]=true}}}
	chainhelper:read_chain()
	assert(public_data.rental_list[token_hash_or_id]['state']==true,'public_data.rental_list[token_hash_or_id][state]==true')
	assert(chainhelper:real_time()>public_data.rental_list[token_hash_or_id].expiration_date,'chainhelper:real_time()>public_data.rental_list[token_hash_or_id].expiration_date')
	chainhelper:change_nht_active_by_owner(contract_base_info.owner, token_hash_or_id, true)
	public_data.rental_list[token_hash_or_id].state=false
	local expiration_date=public_data.rental_list[token_hash_or_id].expiration_date
	write_list={public_data={rental_list={[token_hash_or_id]={state=true,expiration_date=false}},expiration_date_list={[expiration_date]=false}}}
	chainhelper:write_chain()
end

function scan_expiration_date_by_crontab(is_recursive)
	if(is_recursive==false)then
		read_list={public_data={step=true,scanned=true}}	
		chainhelper:read_chain()
	end
	assert(public_data.scanned~=nil)
	assert(public_data.step~=nil)
	read_list={public_data={expiration_date_list={start=public_data.scanned,stop=public_data.scanned+public_data.step}}}
	chainhelper:read_chain()
	assert(public_data.expiration_date_list~=nil,'public_data.expiration_date_list~=nil')
	local size=0
	local is_continue=false
	if(temp==nil)then temp={} end
	for key,value in pairs(public_data.expiration_date_list)  do  
		if(temp[key]~=nil)then
			is_continue=true
		end
		if(is_continue~=true) then
			if(key>chainhelper:real_time())then
				break
			end
			size=size+1
			temp[key]=value
			scan_expiration_date(value)
		end
	end
	if( size==public_data.step )then
		public_data.scanned= public_data.scanned+size
		scan_expiration_date_by_crontab(true)
	else
		public_data.scanned=0
	end
	
	if(is_recursive==false)then
		write_list={public_data={step=true,scanned=true}}	
		chainhelper:write_chain()
	end
end

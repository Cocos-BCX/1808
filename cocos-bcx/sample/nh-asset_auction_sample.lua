function init(agency_fee)
	assert(chainhelper:is_owner(),'chainhelper:is_owner()')
	read_list={public_data={is_init=true}}
	chainhelper:read_chain()
	assert(public_data.is_init==nil,'public_data.is_init==nil')
	public_data.is_init=true
	assert(agency_fee>0,'agency_fee>0')
	public_data.agency_fee=agency_fee
	chainhelper:write_chain()
end

function set_agency_fee(agency_fee)
	assert(chainhelper:is_owner(),'chainhelper:is_owner()')
	read_list={public_data={is_init=true,agency_fee=true}}
	chainhelper:read_chain()
	assert(public_data.is_init~=nil,'public_data.is_init==nil')
	assert(public_data.agency_fee~=nil,'public_data.agency_fee~=nil')
	assert(agency_fee>0,'agency_fee>0')
	public_data.agency_fee=agency_fee
	write_list={public_data={agency_fee=true}}
	chainhelper:write_chain()
end

function auction(token_id,base_offer,limit_time)
	assert(chainhelper:is_owner()==false,'chainhelper:is_owner()==false')
	assert(type(token_id)=='string' and  base_offer>0 )
	assert(limit_time>600 and limit_time<=3600,'limit_time>600 and limit_time<=3600')
	local expiration_date=chainhelper:time()+limit_time
	read_list={public_data={auction_list={[token_id]=true},expiration_list={[expiration_date]=true},agency_fee=true}}
	chainhelper:read_chain()
	if(public_data.auction_list==nil)then
		public_data.auction_list={}	
	else
		assert(public_data.auction_list[token_id]==nil,'public_data.auction_list[token_id]==nil')
	end
	if(public_data.expiration_list==nil)then
		public_data.expiration_list={}
	else
		assert(public_data.expiration_list[expiration_date]==nil,'public_data.expiration_list[expiration_date]==nil')
	end
	chainhelper:transfer_nht_from_caller(contract_base_info.owner, token_id, true)
	chainhelper:change_nht_active_by_owner(contract_base_info.caller,token_id, true)
	chainhelper:transfer_from_caller(contract_base_info.owner,public_data.agency_fee,'BDES',true)
	public_data.auction_list[token_id]={}
	local token_ref=public_data.auction_list[token_id]
	token_ref.token_owner=contract_base_info.caller
	token_ref.base_offer=base_offer
	token_ref.expiration_date=expiration_date
	token_ref.offer_list={}
	public_data.expiration_list[expiration_date]=token_id
	write_list={public_data={auction_list={[token_id]=true},expiration_list={[expiration_date]=true}}}
	chainhelper:write_chain()
end

function auction_offer(token_id,offer)
	assert(chainhelper:is_owner()==false,'chainhelper:is_owner()==false')
	assert(type(token_id)=='string' and  offer>0)
	read_list={public_data={auction_list={[token_id]=true}}}
	chainhelper:read_chain()
	assert(public_data.auction_list[token_id]~=nil,'public_data.auction_list[token_id]~=nil')
	assert(public_data.auction_list[token_id].base_offer<offer,'public_data.auction_list[token_id].base_offer<offer')
	assert(public_data.auction_list[token_id].token_owner~=contract_base_info.caller,'public_data.auction_list[token_id].token_owner~=contract_base_info.caller')
	assert(public_data.auction_list[token_id].expiration_date>chainhelper:time(),'public_data.auction_list[token_id].expiration_date>chainhelper:time()')
	if(public_data.auction_list[token_id].max_offer==nil)then
		chainhelper:transfer_from_caller(contract_base_info.owner,offer,'BDES',true)
		chainhelper:adjust_lock_asset('BDES',offer)
		public_data.auction_list[token_id].max_offer={contract_base_info.caller,offer}
		public_data.auction_list[token_id].offer_list[contract_base_info.caller]=offer
	else
		assert(public_data.auction_list[token_id].max_offer[2]<offer,'public_data.auction_list[token_id].max_offer[2]<offer')
		chainhelper:transfer_from_owner(public_data.auction_list[token_id].max_offer[1],public_data.auction_list[token_id].max_offer[2],'BDES',true)
		chainhelper:transfer_from_caller(contract_base_info.owner,offer,'BDES',true)
		chainhelper:adjust_lock_asset('BDES',offer-public_data.auction_list[token_id].max_offer[2])
		public_data.auction_list[token_id].max_offer={contract_base_info.caller,offer}
		public_data.auction_list[token_id].offer_list[contract_base_info.caller]=offer
	end
	write_list={public_data={auction_list={[token_id]={max_offer=true,offer_list={[contract_base_info.caller]=true}}}}}
	chainhelper:write_chain()
end

function auction_end(token_id)
	read_list={public_data={auction_list={[token_id]={token_owner=true,expiration_date=true,max_offer=true}}}}
	chainhelper:read_chain()
	assert(public_data.auction_list[token_id]~=nil,'public_data.auction_list[token_id]~=nil')
	local token_ref=public_data.auction_list[token_id]
	assert(token_ref.expiration_date<=chainhelper:time(),'token_ref.expiration_date<=chainhelper:time()')
	chainhelper:change_nht_active_by_owner(contract_base_info.owner,token_id, true)	
	if(token_ref.max_offer==nil)then
		chainhelper:transfer_nht_from_owner(token_ref.token_owner,token_id,true)
		
	else
		chainhelper:transfer_nht_from_owner(token_ref.max_offer[1],token_id,true)
		chainhelper:transfer_from_owner(token_ref.token_owner,token_ref.max_offer[2],'BDES',true)
		chainhelper:adjust_lock_asset('BDES',-token_ref.max_offer[2])
	end
	
	write_list={public_data={auction_list={[token_id]=false},expiration_list={[token_ref.expiration_date]=false}}}
	chainhelper:write_chain()
end
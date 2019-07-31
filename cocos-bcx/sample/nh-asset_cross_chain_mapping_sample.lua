function create_nht_and_mapping(target_account,world,baseinfo,chain_id,token_id)
	asset_id=chainhelper:create_nh_asset(target_account,'COCOS',world,baseinfo,true)
	nht_mapping(chain_id,token_id,asset_id)
end

function nht_mapping(chain_id,token_id,nht_id)
	assert(type(chain_id)=='string' and type(token_id)=='string' and  type(nht_id)=='string',
	'type(chain_id)==string and type(token_id)==string and = type(nht_id)==string')
	assert(chain_id~='' and token_id~='','chain_id~=\"\" and token_id~=\"\"')
	assert(chainhelper:is_owner(),'chainhelper:is_owner()')
	read_list={public_data={[chain_id]={[token_id]=true}}}
	chainhelper:read_chain()
	if(public_data[chain_id]==nil) then
		public_data[chain_id]={}
	else
		assert(public_data[chain_id][token_id]==nil,'public_data[chain_id][token_id]==nil')
	end
	public_data[chain_id][token_id]=nht_id
	write_list=read_list
	chainhelper:write_chain()
	--[[chainhelper:nht_describe_change( nht_id,chain_id,token_id,true)--]] 
	chainhelper:log('mapping:'..'chain_id->'..chain_id..',token_id->'..token_id..',nht_id->'..nht_id)
end

function clear_all_mapping()
	chainhelper:write_chain()
end

function clear_mapping(chain_id,token_id,nht_id)
	assert(type(chain_id)=='string' and type(token_id)=='string',
	'type(chain_id)==string and type(token_id)==string ')
	assert(chainhelper:is_owner(),'chainhelper:is_owner()')
	read_list={public_data={[chain_id]={[token_id]=true}}}
	chainhelper:read_chain()
	assert(public_data[chain_id]~=nil,'public_data[chain_id]~=nil')
	assert(public_data[chain_id][token_id]~=nil,'public_data[chain_id][token_id]~=nil')
	write_list={public_data={[chain_id]={[token_id]=false}}}
	chainhelper:write_chain()
	--[[chainhelper:nht_describe_change( nht_id,chain_id,'',true)--]] 
end


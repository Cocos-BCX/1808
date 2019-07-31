function my_nht_describe_change( nht_hash_or_id,values_json) 
	local values=cjson.decode(values_json) 
	for key,value in pairs(values)  do  
		chainhelper:log('key:'..key..',value:'..value)   
		chainhelper:nht_describe_change( nht_hash_or_id,key,value,true)  
	end  
end

function nht_change_with_table( nht_hash_or_id,values_table) 
	for key,value in pairs(values_table)  do  
		chainhelper:log('key:'..key..',value:'..value)   
		chainhelper:nht_describe_change( nht_hash_or_id,key,value,true)  
	end  
end

function create_nht_and_mapping(target_account,world,baseinfo,chain_id,token_id)
	asset_id=chainhelper:create_nh_asset(target_account,'COCOS',world,baseinfo,true)
	chainhelper:log('new asset:'..asset_id)
end
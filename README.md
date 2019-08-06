# COCOS 1808 BCX-NHAS-1808 Standard & Worldview System v1.0  


- [Foreword](#Foreword)
  * [Introduction](#Introduction)
  * [Purpose of Writing](#Purpose-of-Writing)
  * [COCOS 1808 Standard](#COCOS-1808-Standard)
  * [Features](#Features)
    + [Universally Used Unique Value Expression](#Universally-Used-Unique-Value-Expression)
    + [Cross Use Cases without Affecting Each Other \(World Wall\)](#Cross-Use-Cases-without-Affecting-Each-Other-World-Wall)
    + [Worldview Compatible Design](#Worldview-Compatible-Design)
    + [Cross-Network and Cross-Standard Compatible Design](#Cross-Network-and-Cross-Standard-Compatible-Design)
    + [Asset Owners are Allowed to Discard Specific Zone Data](#Asset-Owners-are-Allowed-to-Discard-Specific-Zone-Data)
    + [Assets Used as an Embedded or Combined Module on the Blockchain](#Assets-Used-as-an-Embedded-or-Combined-Module-on-the-Blockchain)
    + [Support Complex Design of Circulation Model](#Support-Complex-Design-of-Circulation-Model)
  * [Comparison of Non-homogeneous Assets](#Comparison-of-Non-homogeneous-Assets)
  * [Data Structure of 1808 Standard](#Data-Structure-of-1808-Standard)
  * [Data Structure Reference of 1808 Standard](#Data-Structure-Reference-of-1808-Standard)
- [Non-Homogeneous Digital Assets Standard](#Non-Homogeneous-Digital-Assets-Standard)
  * [The Definition of  Non-Homogeneous Digital Assets](#The-Definition-of-Non-Homogeneous-Digital-Assets)
  * [The Significance of Non-Homogeneous Digital Assets to Games](#The-Significance-of-Non-Homogeneous-Digital-Assets-to-Games)
  * [The Reasons to Standardized Non-Homogeneous Assets](#The-Reasons-to-Standardized-Non-Homogeneous-Assets)
- [Worldview System](#Worldview System)
  * [Game World and the Worldview System](#Game-World-and-the-Worldview-System)
  * [Cross-World Item “Traveling”, Multiverse and Parallel World](#Cross-World-Item-Traveling-Multiverse-and-Parallel-World)
  * [Data Management in the Worldview System](#Data-Management-in-the-Worldview-System)
- [Application Examples of COCOS 1808 Standard and Worldview System](#Application-Examples-of-COCOS-1808-Standard-and-Worldview-System)
  * [Operation of Contract on COCOS 1808 Standard Digital Assets](#Operation-of-Contract-on-COCOS-1808-Standard-Digital-Assets)
    + [Transfer of Non-Homogenous Assets Ownership](#Transfer of Non-Homogenous Assets Ownership)
      - [Transfer of Non-Homogenous Assets-Caller](#Transfer-of-Non-Homogenous-Assets-Caller)
      - [Transfer of Non-Homogenous Assets-Owner](#Transfer-of-Non-Homogenous-Assets-Owner)
    + [Modify non-homogeneous Assets Data \(within a Specific Data Zone\)](#Modify-non-homogeneous-Assets-Data-within-a-Specific-Data-Zone)
      - [Transfer of Non-Homogenous Assets-Owner](#Transfer-of-Non-Homogenous-Assets--Owner)
  * [Scene Examples](#Scene-Examples)
    + [Upgrading Gear in Game(Contract)](#Upgrading-Gear-in-Game-Contract)
    + [Game Items Travelling the Game Worlds and Making a Numerical Linkage](#Game-Items-Travelling-the-Game-Worlds-and-Making-a-Numerical-Linkage)
  * [Implementation of Complex Business Model](#Implementation-of-Complex-Business-Model)
    + [Lease](#Lease)
    + [Pledge](#Pledge)
    + [Pawn](#Pawn)

# 1. Foreword
## Introduction

   BCX-NHAS-1808 Standard (hereinafter referred to as "1808 Standard") is a non-homogeneous digital assets standard that applied to decentralized distributed ledger network. As the perfect way to represent various non-fungible items, non-homogeneous digital assets can cover the field of game items, gears, characters, map data, and even expansion pack in the game industry. This manual also focus on the worldview system based on 1808 Standard, such as world traveling, multiverse, and etc.  
   
   This manual was created to help readers to understand and apply the 1808 Standard and worldview system, and please be aware of that descriptions on the manual will not always be consistent with the actual situation. Please update the manual or contact the authorities for the latest information if inconsistency happens.  
   
## Purpose of Writing

   This manual was provided for users who working on game development, assets design and distribution, and game world design and management on COCOS-BCX blockchain network. This content has been developed to provide instruction to the 1808 Standard and its usage specifications so users can design a user-friendly digital assets and game world on the BCX network.  

## COCOS 1808 Standard

   Combining the needs of gaming industry, we reviewed a number of existing non-homogeneous digital asset standards and defined BCX-NHAS-1808 to be the one to standardize all non-homogeneous digital assets that published and circulated on the BCX chain.  

### Features
#### Universally Used Unique Value Expression

  The non-homogeneous digital assets defined by the 1808 Standard support a variety of data customizing and scaling approaches. They are compatible with different asset types in various games, and can be used as a general expression for various game data.   

#### Cross Use Cases without Affecting Each Other (World Wall)

  The extended data area is combined in the unit of zone. Each zone is bound to one or several contracts that are only responsible for itself. It represents a data area that is unique to the use case (game world). The key-value pair information after the zone is unfolded represents a series of game business related data. Data between different zones can be read but not written mutually, that is, data changes in different use cases do not affect each other. The "world wall" of the game will prevent these properties from affecting other worlds, which will not result in the situation of "equipment downgraded in game A is also downgraded in game B".   

#### Worldview Compatible Design

  The non-homogeneous digital assets defined by the 1808 Standard allow digital assets under the same worldview to be used in different business scenarios. Therefore, there requires certain rules to balance the asset value (capability value) among different business entities.  
  
As for the 1808 Standard, when an asset instance is referenced in a new business scenario, a relative attribute is determined, which takes a certain other zone data as references, representing the basic value of the asset. The data can be identified in other business entities under the same worldview. When the asset instance enters different business entities, the value in the business entity is determined according to this attribute, and other attributes such as equipment skills are supplemented by the zone data form of the business entity.   

#### Cross-Network and Cross-Standard Compatible Design

  The digital assets defined in this standard are designed to be compatible with other network non-homogeneous digital asset standards, including ERC-721, ERC-1155, ERC-998, etc. For a single non-homogeneous digital asset type defined by contracts (ERC-721, etc.), the asset instance can be compatible by defining an asset type with the same custom data structure. For nested/combined asset types defined by contracts (ERC-998, etc.), compatibility can be achieved by adding portfolio relationship data to the extended data area.   

#### Asset Owners are Allowed to Discard Specific Zone Data

  The zone data of the 1808 standard digital assets will be left with a record of the game as the number of games experienced increases. When the owner no longer needs the data generated in a certain game because of props reinforcement errors, being given negative attributes or wishing to re-challenge the game, etc., the owner can choose to delete the zone data corresponding to the game, allowing the assets to reenter the game in the initial state.   
  
  The asset owner's control over the asset zone data is limited to the complete deletion of the specified zone data, rather than the change of zone data to prevent the owner from cheating. In addition, the deletion of zone data can also effectively prevent malicious contracts from writing large amounts of junk data to specific assets, resulting in data redundancy.   

#### Assets Used as an Embedded or Combined Module on the Blockchain

![P1](https://github.com/Cocos-BCX/1808/blob/master/readmeimg/1.jpg)

  Game props and equipment may be composed of multiple components and items. Therefore, the non-homogeneous digital assets of blockchain games should also be able to be nested and contained. In this case, each non-homogeneous asset can be composed of multiple non-homogeneous assets. The parent asset can contain one or more child assets, and the child assets can further contain other child assets.   
  
  For game scenarios with equipment construction or combination, the 1808 Standard provides a design that supports asset portfolios. The extended data contains the zone that records the combination relationship. The zone data records the information of the nested relationship when the asset is combined. Before the relationship is terminated, the ownership of nested child assets will not be able to be transferred.   

#### Support Complex Design of Circulation Model

  In the future, the market behavior of assets in the chain will be far beyond the traditional trading and circulation, so it is nesssary to lay a good foundation for a richer business type. Cocos-BCX refined the rights system of the assets and divided the rights of use and ownership of the assets.   
  
  ![P2](https://github.com/Cocos-BCX/1808/blob/master/readmeimg/2.jpg)
  
  1808 Standard’s design of separating the assets ownership from the right to use specifies existing permission system of the assets. The use right determines whether the user has the permission on most operations, while the ownership determines whether the user has the actual ownership and key rights to operate the assets. Certain operations are required to be co-signed by the owner and user.   
Based on BCX contract system, 1808 Standard can easily deliver the business logic unable to be implemented with traditional blockchain/contract system, such as asset lease, pledges, and pawn.   

### Comparison of Non-homogeneous Assets

  At present, ERC-721, ERC-1155, and ERC-998 of Ethereum network are the popular non-homogeneous digital asset standards, which are used in different scenarios and for different needs on the Ethereum network:  
* ERC-721  
  It is an officially accepted non-homogeneous digital asset standard defined by smart contracts in the Ethereum network. It has a customizable data zone, which makes it possible to digitize items or records.  
  Typical applications are: Crypto Kitties, Crypto Celebrities, etc   
* ERC-1155  
  It is a standard interface proposed by Enjin to define multiple non-homogenous assets in Ethereum's single smart contract, serving mainly the virtual props in blockchain games.   
  Typical application: War of Crypto.  
* ERC-998  
  It is a combination of non-homologous tokens (CNFT, Composable NFTs) defined in Ethereum's smart contracts proposed by Matt Lockyer.   
  
  ![P3](https://github.com/Cocos-BCX/1808/blob/master/readmeimg/3.png)

  The figure shows the comparison of the above three non-homogeneous asset standards with NHAS-1808, which briefly compares the essentials that may be involved in blockchain and gaming. The differences marked in red are the features of the 1808 Standard designed by COCOS-BCX for the game running on-chain. These features are related to the data structure design of the 1808 standard assets in addition to the characteristics of the BCX chain network itself.  
### Data Structure of 1808 Standard  

![P4](https://github.com/Cocos-BCX/1808/blob/master/readmeimg/4.png)

  The non-homogeneous digital assets data structure in the blockchain network is divided into fixed data zone and  extensible data area. The fixed data zone stores the basic information of non-homogeneous digital assets, including asset ID, worldview statement and basic data zone; While the extensible data area is a functional section designed for attribute extension of non-homogeneous digital assets, including zone data and combination relationship data.   
  
  The fixed data zone defines asset ID, worldview statement and other basic data. The asset ID is the unique identifier of assets instance in the distributed ledger network, and the unique credential to access, check and modify the assets. Worldview statement, including the worldview ID, the type of game in which the asset is in effect and supported, the world and the currencies supporting the circulation of assets in the network. The basic data includes the asset owner ID, producer ID, production time, basic attributes of the asset (eg, equipment descriptions, etc.)，and further consists of information including a basic description of the assets, production time, producer, owner, user, customized black & white list of use right, etc.   
  
  The extensible data area is a storage area of each business data in the world view supported by the asset, and includes a combined relation data zone and domain data, wherein the combined relation data zone includes two tables for expressing a nested combination relationship between assets; The domain data area is a dedicated data area owned by different business entities in the zone. The data areas between different business entities are isolated from each other, and the domain data is stored in the form of key identifiers of domain identifiers and data.   
  
### Data Structure Reference of 1808 Standard

  The field types and identification reference tables of the fixed data zone of non-homogeneous digital assets defined in this standard. 
  
 Name | Basic Identification  | Type
 ---- | ----- | ------  
 assets  id | nh_asset_id | asset_id_type  
 world wiew | world_view | world_view_type  
 owner | nh_asset_owner | account_id_type 
 creator | nh_asset_creator | account_id_type 
 create time | nh_asset_create_time | time_point_sec 
 asstes description | nh_asset_description | string 
 use right list | limit_list | string vector<contract_id_type>
 use rght list type | limit_type | nh_asset_lease_limit_type

  `asset_id_type`: The asset_id_type is designed to maintain the uniqueness in the network, which requires little for the ID length. However, from the perspective of multi-network compatibility, the maximum sample size of the ID should cover the maximum expected number of non-homogeneous digital asset instances in the existing decentralized distributed account-based network. For example, if the asset ID in the Ethereum network is a 40-byte hash address and the maximum number of samples that can be supported is 1.462*10^48, hash addresses or other unique identification approaches with a sample size greater than this value is considered when designing the asset ID in the network to which this standard is applied.   
  
  `world_view`: The world_view_type contains the worldview ID applied to the asset and the world currency corresponding to the worldview, where the Worldview ID is a unique identifier for the network, and the currency in circulation is the unique symbol of the currency (the network using the symbol as a unique credential) or the address (the network using the address as the unique credential).  
  
  `nh_asset_owner` and `nh_asset_creator`: The asset_owner and Asset_creator fields type is account_id_type, which should be of a unique and sufficient sample size.   
  
  `nh_asset_create_time`: The asset_create_time field type is time_point_sec, which is used to identify the date when this asset instance is created. It is determined by the timestamp of the ledger when the instantiation transaction is completed.   
  
  `nh_asset_description`: The asset_description field type is a string, which is a piece of data that can be used to express the basic attributes of an asset instance. The data can be processed in a custom parsing or encryption manner to match specific business entities and application scenarios.   
  
  `limit_list`: The limit_list field type is vector<contract_id_type>，which is a list used to controll the scope of use of the asset by being set in whitelist mode or blacklist mode according to the restriction mode specified in limit_type. The zone data of the asset can only be modified in the game added in the list in whitelist mode.  
  
 `limit_type`: The limit_type  field type is nh_asset_lease_limit_type, and is mode enumeration using the rights list mode, which includes two states: whitelist mode and blacklist mode.   
 
  The field types and identification reference tables of the extensible data zone of non-homogeneous digital assets defined in this standard.  
  
  Name | Extensible Zone Identification  | Type
 ---- | ----- | ------  
data with combination relationship | mod_data | list<parents>, list<children> 
zone data list | describe_with_contract | map<contract_id_type, Map>   
zone identification | session_key | contract_id_type 
zone data | session_data | map<string, string> 
inter-zone key | inner_key | string  
inter-zone value | inner_value| string   

  `Mod_data`: The Mod_data field type is an id list, which is a relationship table consisting of a list of identifiers of parent asset IDs and child asset IDs, which are used to describe the combination and nesting relationship of assets in different business entities.   
  
  `describe_with_contract`: The World_view field type is a map, which is a key-value pair mapping table composed of zone identifiers and zone data. The zone identifier is a type identifier of the business entity, corresponding to one or several contracts, and all data interactions of the business instance for this asset instance will be performed in this zone.   
  
  `Session_key`: The Session_key field type is contract_id_type, which is the id of one or more core contracts that the business should contain. The id should be as unique and sufficient as the other unique identifiers. 
  
`Session_data`: The session_data field type is a map, which consists of the inner_key and the inner_value. The specific data of the key and value is defined by the business entity responsible for this zone, which may include structured or encrypted strings as its data according to its needs.  

# Non-Homogeneous Digital Assets Standard
## The Definition of  Non-Homogeneous Digital Assets

  The non-homogeneous digital assets is a type of asset compared with traditional currency homogeneous assets. It applied to distributed ledger network with unique assets instance, which have different data items and contents except for the unique identifiers, and those of the same type cannot be directly combined and cannot be compartmentalized.   
  
  Taking a more realistic asset, Bitcoin, as an example, this typical homogeneous digital asset has no difference and can be replaced with each other. If an account receives a Bitcoin while transferring another one, the balance, as well as the value, will remain the same, which shows other characteristics of homogeneous assets, divisible and combinable.   
  
  In contrast, with the specific attributes at the beginning of production,non-homogeneous digital assets are unique and cannot be split or simply merged, especially for those under 1808 Standard, for having more complex designs like asset nesting, cross-world traveling and scalable data (see the description on the characteristics of 1808 standard assets).  
  
  Making an analogy between "World of Warcraft" and the blockchain, all the props of the former one can be set as non-homogeneous digital assets. When players completing the task, they shall get the legendary equipment "Blessed Blade of the Windseeker", which contains many skills and effects besides the basic values of attack, speed, weight, etc. all can be expressed in the scalable data of non-homogeneous digital assets. If obtained again, the weapons will not be merged but exist as independent asset data despite their same attributes, skills and even descriptions. In addition, the equipment can be sold, exchanged, or destroyed, while its information will always exist independently in a traceable form on the chain.  
  
  That is to say, non-homogeneous assets are a form of digital description applicable for unique items such as game props and real objects, playing a key role in the development of the blockchain game industry.   

## The Significance of Non-Homogeneous Digital Assets to Games

As shown in the Cocos-BCX whitepaper, there are four stages of blockchain gaming:   

1. ungible Token as a Settlement Measure of In-Game Economy;   
2. Free Exchange of Game Coins and Assets;   
3. Key Game Algorithms Running on Blockchain;   
4. The Game as a whole Running on the Blockchain.   

  The "props" in the second stage go beyond the props to various unique digital assets in the game. It covers items, equipment, character information, level data, etc. and can even be extended to game resources, map scenes, plot data, DLC, etc. in the third and fourth stage.  
It can be argued that a well-defined standardized non-homogeneous digital asset will be the cornerstone of the phased leap for the blockchain gaming.  

## The Reasons to Standardized Non-Homogeneous Assets

  Standardizing digital assets is a basic work, as well as the key part to the sustainable, scalable, and scientific operation of the chain network. The significance of designing standardized non-homogeneous assets includes:  
  
* Non-homogeneous asset standardization guarantees the standardization of definition, format, and structure in an asset’s life cycle. The high compatibility and interpretability between standardized digital assets enable them to provide a foundation for the exchange in the third-party non-homogeneous digital asset;  
* Standardized non-homogeneous assets can eliminate the redundant custom structure analysis, and improves the efficiency and capacity of chain network operation;  
* Standardized assets are more conducive to the design of initialization, retrieval, analysis, and other operations, saving developers the need to consuming the workload on interacting with different assets so that they can just follow the standard definitions and focus more on the design of the asset content itself.  

  Taking ERC-721 standard as an example, any non-homogeneous digital asset defined by it can be analyzed, retrieved and modified using the same mode of contract/service. When the operating different ERC-721 assets object, the developer does not even need to modify the contract/service code but to change the identification information of the incoming asset instance in the interface call to complete the full compatibility of the new asset.  

# Worldview System
## Game World and the Worldview System

  Different from the concept of the traditional game industry, BCX's blockchain games are not completely independent business scenarios. Each blockchain game can be considered a game world, and several game worlds with similar basic settings can be considered to have a common worldview.  
  
![P5](https://github.com/Cocos-BCX/1808/blob/master/readmeimg/5.jpg)  

  The concept of worldview is not created by blockchain gaming, but a feature already shared by many modern games. For example, Warcraft, World of Warcraft, Hearthstone, and The Legend of Storm share a common worldview of Blizzard universe, in which a considerable part of game props, characters, and assets are common. Although these assets have a different explanation on specific attributes, skills, etc. in each game, the design of these assets stems from the common basic rules.  
  
  The worldview of blockchain games is an identity that distinguishes between story settings and characters/items/rules settings and utility scope. Game items follow a unified specification in the worldview, and can be migrated and circulated in different game worlds under this worldview by paying the “migration fee”, which is the “travelling” of game props.  

## Cross-World Item “Traveling”, Multiverse and Parallel World

  Game items are a kind of non-homogeneous digital assets used in blockchain games. The process of items “travelling” across different worlds is that of applying and changing of a non-homogeneous digital asset in different games and services under the same worldview.  
  
  The 1808 Standard makes it possible for on-chain games to design the multiverse/parallel universe. Different game worldviews are also different game universes, which forms the multiverse of on-chain games. The game items in each universe can be freely circulated, and are written with different attributes, skills, etc. in different games. These items do not affect each other. This is what we mentioned as the item design in the "parallel world".  
  
  Scalable custom data enables game designers to create unique game assets. Non-interfering zone data allows game assets to be given new properties that are an immune while "travelling" the world and the universe, while also making it possible of data linkage between games (such as skill gain/reduction). The image below is an example of the on-chain game assets travelling across the world line/parallel world:  
  
![P6](https://github.com/Cocos-BCX/1808/blob/master/readmeimg/6.jpg)  

  According to the game operation design, the 1808 non-homogeneous assets standard support the design of paid travelling across the world line through a specific third-party. This is helpful for game operation to meet the needs of item balance and asset circulation control.  
  
## Data Management in the Worldview System

  1808 non-homogeneous digital assets standard is defined on chain initially and operated via smart contract. The complicated data structure and combination design of the 1808 Standard makes the design of asset data security more important. Therefore, COCOS-BCX analyzes the risks and potential dangers that may occur during the operation of data on chain, and starts to make improvements.  

* Separately Stored Assets and Contract Data  
  Separate data storage can ensure that the asset owner has full ownership of the asset. If the contract and the asset data are stored together, the specific contract can call the assets owned by the contract under the authority of the contract developer, which is very unsafe. In COCOS-BCX, the data of homogeneous, non-homogeneous assets and smart contracts are stored separately, which is a more data-safe design, in addition to helping to reduce data flow consumption and improve blockchain efficiency;  
  
* Contract Verification Mechanism with Identity Authentication  
  For contract functions involving sensitive operations, COCOS-BCX allows developers to define contract execution mechanisms with identity authentication. A contract function with authentication mechanism will only be executed when the caller meets the requirements, avoiding the risk of hackers maliciously executing a specific contract interface for illegal asset operations;  
  
* Control Contract Permissions by Zone Data  
  The contract is able to obtain all zone data in the 1808 Standard extended asset data, but changes to the asset data will be limited to the zone marked as current contract. That is, Game A can obtain the attribute data of the asset in Game B, but the changes to the asset will only be saved in zone A, and contract A cannot modify any data in zone B;  
  
* Assets Owner Management Mode for Zone Data  
  The zone data is continuously supplemented with the growth of games. The excessively added zone data or the invalid zone data added by the malicious contract will affect the execution efficiency of the business, resulting in asset data redundancy. To avoid this situation, the 1808 Standard allows the user to delete a specific zone in the extended asset data. However, this only gives the user the right to delete the zone data without including the right to change the zone data, in case the user cheats by changing the data.  

# Application Examples of COCOS 1808 Standard and Worldview System

  This chapter will describe the operation of contract on BCX-NHAS-1808 standard digital assets, and how the non-homogeneous assets travel and link in different worldviews in COCOS-BCX chain. For more information, please refer to the `COCOS-BCX Smart Contract User Guide`.  
  
## Operation of Contract on COCOS 1808 Standard Digital Asset 
### Transfer of Non-Homogenous Assets Ownership
#### Transfer of Non-homogenous Assets-Caller

* Original Function  
void transfer_nht_from_caller(string to, string token_hash_or_id)  
* Calling Description  
Transfer non-homogeneous assets from the contract caller to the account to  
* Parameter Description  
to：target account, token_hash_or_id: the hash value or ID number of the pointed non-homogeneous assets

#### Transfer of Non-homogenous Assets-Owner

* Original Function  
void transfer_nht_from_owner(string to, string token_hash_or_id) 
* Calling Description  
Transfer non-homogeneous assets from the contract owner to the account to  
* Parameter Description  
to：target account, token_hash_or_id: the hash value or ID number of the pointed non-homogeneous assets  

### Modify Non-Homogeneous Asset Data (within a Specific Data Zone)
#### Transfer of Non-homogenous Assets-Owner

* Original Function  
void nht_describe_change(string nht_hash_or_id, string key, string value)  
* Calling Description  
Modify the contract-related description of the non-homogeneous assets, and the modified part is the corresponding zone of the contract  
* Parameter Description  
token_hash_or_id: the hash value or ID number of the pointed non-homogeneous assets;  
Key: the index of discribed item;  
value: the corresponding description of the index  

## Scene Examples
### Upgrading Gear in Game(Contract)
 
This is to introduce an example of the contract function code that enhances the equipment attributes in a game. This function represents a hardened action on the equipment in a common RPG game. Players can choose the equipment to be upgraded and the upgraded attribute category (STR, AGI, or INT, etc.), the game will parse the domain data and calculate the target value and input into this contract function. Since the COCOS-BCX contract system supports the internal random process, the success rate of the upgrade in this scenario can be displayed in a random manner.  

```Lua
-- contract function：upgrade gear 
-- equipment_id: the ID of equipment 
-- upgrade_name: the name of the upgrading equipment 
-- target_value: the value of target 
-- success_rate: the success rate of upgrade (1-100)  
function equipment_upgrade( equipment_id, upgrade_name, target_value, success_rate)  --the determination to the name of upgrade items 
 assert(upgrade_name=='STR' or upgrade_name=='AGI' or upgrade_name=='INT', 'upgrade name error') 
 --the determination to the input of  upgrade success rate  
 assert(success_rate>=0 and success_rate<=100, 'success rate should between 0 and 100') 
  
 --upgrade success determined, obtaining random probability through internal random function 
 local success_judge=random()%100 
 if(success_judge<=success_rate)then 
  --write the target value into the zone data 
  nht_describe_change( equipment_id, upgrade_name, target_value) 
 end   
end 
```
### Game Items Travelling the Game Worlds and Making a Numerical Linkage

  This is to introduce an example of the game items travelling the game worlds. In this example scenario, the game service authorizes the player's items to travel into their own game world with a fee.After the player passes the required assets by paying a fee, the game service will allow the player's items to enter the game world (contract system).   
  
  The game service collects the required information from the zone data of the player’s items and submits it to the contract. Since there is a linkage with the previous game, the developer designs a linkage with the previous game skills (e.g. the 'eyes of hawk' shown in the following code), so that the items that travel to the game world can be equipped with the skill attributes.  
  
```lua
  --Contract function: initialize game items that travel across the game world 
  -- item_id: the ID of equipment 
  -- original_skill:the skill info of original game 
  -- add_skill: the added skill in this game 
  -- add_description: the added description in the domain data of  this game 
  function init_item_from_another_world( item_id, original_skill, add_skill, add_description)  
  --non-empty determination of information  
  assert(original_skill!=nil,'null original skill info')  
  assert(add_skill!=nil,'null add skill info')  
  assert(add_description!=nil,'null description info')   
  local add_skill_value='null'  
  --the determination of the skill info of original game and calculate the linked skill info od this game  
  local switch={   
      ['eyes of hawk']=function() add_skill_value='{"VIT_UP":25}' end   
      ['heart of lion']=function() add_skill_value='{"STR_UP":50}' end   
      ['speed of pard']=function() add_skill_value='{"AGI_UP":40}' end   
      ['wisdom of dwarf']=function() add_skill_value='{"INT_UP":30}' end  
  }   
  local res=switch[original_skill]  
  if(res)then   
      res()   
      --updated the linked skill into domain data   
      nht_describe_change( item_id, add_skill, add_skill_value)   
      nht_describe_change( item_id, 'another_world_message', add_description)  
  else   
      assert(res,'unexpected original game skill type') 
  
```

## Implementation of Complex Business Model

  The updated Cocos-BCX chain adds a variety of atomic OP and data structures to enable possible new business. With the contract system, developers can easily implement complex financial business models on the blockchain, such as asset leasing, mortgages, pawns, and so on. These new business models will greatly improve the shortcomings of the lack of liquidity in the economic model of the traditional blockchain system to further activate market behaviors. Below is a brief introduction to the design of these three business models in BCX.  
  
### Lease 

![P7](https://github.com/Cocos-BCX/1808/blob/master/readmeimg/7.jpg)  

Contract Design:  
* Define the functions for the leasing business, such as initiating leases, transferring use right, reclaiming use right, inventory status queries, and inventory updates.   
* Define a pool of assets available for lease, with information such as the price tag.  

Process:  
* The owner adds asset information to be rented through the inventory update function in the contract and specifies the rent/calculation rules;  
* The lease is established after the tenant pay the rent via the function that initiates the lease;  
* The contract defines the black & white list of asset use right by transferring the use right function and transfers the use right to the tenant. The contract then transfers the rent to the owner's account, marks the status of the inventory asset as leased, and defines a timed task—calling the use right reclaim function upon expiration;  
* When the timed task expires, the use right reclaim function of the contract is called to transfer the asset use right back to the owner.  

### Pledge

![P8](https://github.com/Cocos-BCX/1808/blob/master/readmeimg/8.jpg)  

Contract Design:  
* Define the functions of the pledging business, such as initiating pledges, transferring ownership, reclaiming use right, collateral status query, and setting up pledge-backed lists;  
* Define a collateral record structure with information on assets available for pledging and that on pledged assets.  

Process:  
* The pledgee sets the information of the items available for a pledge by setting the collateral list function, marking the pledge price or calculation rules, etc.;  
* The pledger transfers the ownership of the asset to the pledgee through the function that initiates the pledge, receives the deposit paid by the pledgee, updates the list of pledge records, and releases a timed task – the use right is transferred according to the status of redemption;  
* When the timed task expires, if the deposit payment and other conditions are not met, the contract's reclaim function is called to transfer the use right of the asset to the pledgee account through the use right change function.  

### Pawn

![P9](https://github.com/Cocos-BCX/1808/blob/master/readmeimg/9.jpg)  

Contract Design:  
* Define the functions of the pawn business, such as initiating pawn, transferring the use right, reclaiming ownership, the status query of a pawned item, and setting up a pawn list;  
* Define a pawn record structure with information for assets available for pawning and information on pawned assets.  

Process:  
* Pawnbroker sets the information of the items available for a pawn by setting the pawn list function, marking the pawn price or calculation rules, etc.;  
* The pawnor transfers the ownership of the asset to the Pawnbroker through the function that initiate the pawn, receives the deposit paid by the pawnor, updates the list of pawn records, and releases a timed task – It can be designed to return the deposit on a regular basis / pay interest on schedule / both modes as needed;  
* When the scheduled task expires, if the conditions such as the deposit payment are not met, the contract's ownership reclaim function is called to transfer the ownership of the asset to the pawnbroker's account through the ownership change OP. If the condition is met, the use right is transferred to the pawnor by the use right change OP.  

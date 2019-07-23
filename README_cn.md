# BCX-NHAS-1808 非同质数字资产标准 和世界观系统 v1.0  

1. 前言	1
1.1. 介绍	1
1.2. 编写目的	1
1.3. BCX-NHAS-1808 标准	2
1.3.1. 1808 标准的特性	2
泛用的唯一价值表达	2
跨越多个使用场景而互不影响（世界墙）	2
世界观兼容设计	2
跨网络跨标准兼容设计	2
允许资产所有者放弃特定域数据	2
在链内将资产作为镶嵌品或模块组合使用	3
1.3.2. 1808 标准与其他非同质资产标准的区别	5
1.3.3. 1808 标准数据结构	6
1.3.4. 1808 标准数据结构对照	7
2. 非同质数字资产标准	9
2.1. 何谓非同质数字资产	9
2.2. 非同质数字资产对游戏的意义	9
2.3. 为什么需要标准化的非同质资产	10
3. 世界观系统	11
3.1. 游戏世界与世界观系统	11
3.2. 世界线穿越、多元宇宙与平行世界	11
3.3. 世界观系统中的数据管控方式	12
4. 1808 标准与世界观系统应用范例	14
4.1. 合约对 1808 标准资产的操作	14
4.1.1. 非同质资产所有权转移	14
非同质资产转移 – 调用者	14
非同质资产转移 – 所有者	14
4.1.2. 修改非同质资产数据(特定数据域内)	14
非同质资产转移 – 所有者	14
I
4.2. 场景范例	15
4.2.1. 游戏(合约)内强化装备	15
4.2.2. 道具在世界中穿越并做数值联动	15
5. 常见问题 FAQ	17

- [aaa](#aaa)
  * [介绍](#介绍)
  * [编写目的](#编写目的)
  * [Easy Upgrades and Bug Recovery](#easy-upgrades-and-bug-recovery)
  * [Low Latency](#low-latency)
  * [Sequential Performance](#sequential-performance)
  * [Parallel Performance](#parallel-performance)
- [Consensus Algorithm \(BFT-DPOS\)](#consensus-algorithm-bft-dpos)
  * [Transaction Confirmation](#transaction-confirmation)
  * [Transaction as Proof of Stake \(TaPoS\)](#transaction-as-proof-of-stake-tapos)
- [Accounts](#accounts)
  * [Actions & Handlers](#actions--handlers)
  * [Role Based Permission Management](#role-based-permission-management)
    + [Named Permission Levels](#named-permission-levels)
    + [Permission Mapping](#permission-mapping)
    + [Evaluating Permissions](#evaluating-permissions)
      - [Default Permission Groups](#default-permission-groups)
      - [Parallel Evaluation of Permissions](#parallel-evaluation-of-permissions)
  * [Actions with Mandatory Delay](#actions-with-mandatory-delay)
  * [Recovery from Stolen Keys](#recovery-from-stolen-keys)
- [Deterministic Parallel Execution of Applications](#deterministic-parallel-execution-of-applications)
  * [Minimizing Communication Latency](#minimizing-communication-latency)
  * [Read-Only Action Handlers](#read-only-action-handlers)
  * [Atomic Transactions with Multiple Accounts](#atomic-transactions-with-multiple-accounts)
  * [Partial Evaluation of Blockchain State](#partial-evaluation-of-blockchain-state)
  * [Subjective Best Effort Scheduling](#subjective-best-effort-scheduling)
  * [Deferred Transactions](#deferred-transactions)
  * [Context Free Actions](#context-free-actions)
- [Token Model and Resource Usage](#token-model-and-resource-usage)
  * [Objective and Subjective Measurements](#objective-and-subjective-measurements)
  * [Receiver Pays](#receiver-pays)
  * [Delegating Capacity](#delegating-capacity)
  * [Separating Transaction costs from Token Value](#separating-transaction-costs-from-token-value)
  * [State Storage Costs](#state-storage-costs)
  * [Block Rewards](#block-rewards)
  * [Worker Proposal System](#worker-proposal-system)
- [Governance](#governance)
  * [Freezing Accounts](#freezing-accounts)
  * [Changing Account Code](#changing-account-code)
  * [Constitution](#constitution)
  * [Upgrading the Protocol & Constitution](#upgrading-the-protocol--constitution)
    + [Emergency Changes](#emergency-changes)
- [Scripts & Virtual Machines](#scripts--virtual-machines)
  * [Schema Defined Actions](#schema-defined-actions)
  * [Schema Defined Database](#schema-defined-database)
  * [Generic Multi Index Database API](#generic-multi-index-database-api)
  * [Separating Authentication from Application](#separating-authentication-from-application)
- [Inter Blockchain Communication](#inter-blockchain-communication)
  * [Merkle Proofs for Light Client Validation \(LCV\)](#merkle-proofs-for-light-client-validation-lcv)
  * [Latency of Interchain Communication](#latency-of-interchain-communication)
  * [Proof of Completeness](#proof-of-completeness)
  * [Segregated Witness](#segregated-witness)
- [Conclusion](#conclusion)



# 前言

fnuqadh


# aaa

grdg
# 1.2. 编写目的

gfedsgd

# Easy Upgrades and Bug Recovery

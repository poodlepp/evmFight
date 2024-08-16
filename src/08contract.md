[TOC]

## 合约代码

### 智能合约的字节码
- 存储位置，创建时代码，运行时代码
- 没有构造函数的合约如何运行

- 地址分类
  - EOA
  - 合约账户

字节码：构成合约逻辑的所有EVM指令存储地
字节码存储在单独的虚拟ROM（只读存储器），代码是不可改变的

合约字节码相关的操作码
- 读取目前正在执行的合约字节码
  - CODESIZE
  - CODECOPY
- 从一个合约读取复制另一个外部合约的字节码  ??
  - EXTCODESIZE
  - EXTCODECOPY

### 代码布局

合约字节码中 没有slot概念
constant immutable 可能存放在任何位置
代码总是32bytes 倍数

- 运行时字节码：
  - 三个主要部分
    - 调度器dispatcher 找到智能合约
    - 函数包装器  解包函数参数，包装返回值
    - 函数主体  solidity函数的主逻辑
  - 自由空闲指针
  - calldata 检查
  - 合约元数据
  - solc - bin-runtime Ownable.sol 生成运行时字节码
- 调度器
  - 检查selector是否有匹配的
  - 检查fallback    receive??
  - revert
  - 整体类似switch
- 存储位置
  - 账户状态 （保存codehash；nonce,balance,storageRoot，codehash洗牌时不需要处理全量字节码）
  - 合约字节码 底层数据库，key相同还可以复用,节省空间
  - 合约存储
- 代码分类
  - 创建代码
    - 包含constructor,可以生成运行时字节码
  - 运行时代码
  - 字节码大小
    - 创建字节码更大，因为包含了：构造函数，运行时字节码
    - 如果没有构造函数，大小差别会缩小，比如状态变量也会初始化
  - 影响因素
    - solc版本
    - 优化器开关
    - RUNS配置
    - 构造函数参数




### 判断addr是否为合约
openzeppelin isContract
1 extcodesize  openzeppelin 截至4.4.2
2 account.code.length > 0 openzeppelin 4.5.0之后
> 总结：代码存储不为0，该地址是一个合约，相反则并不能确定；
> 特殊情况1 在构造函数中调用的，此时确实还没有代码
> 特殊情况2 被检查的地址已经被预定，还没有被部署

### 访问合约代码
- 地址类型的成员，从区块链中读取的属性
  - addr.codehash
  - addr.code
- 合约类型的成员
  - type(contractName).creationCode
  - type(contractName).runtimeCode
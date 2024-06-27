## Where the data is stored in the EVM

> 本学习笔记来自登链社区EVM专栏-STORAGE

### 简介
- storage
  + SSTORE  SLOAD
- memory
  + MSTORE / MLOAD / MSTORE8
  + 每一个消息调用都是新的内存实例
  + 从一个合约变成另一个合约， 白板被清除
  + 几个CALL操作码在evm中消耗其参数
- calldata
  + CALLDATALOAD / CALLDATASIZE / CALLDATACOPY
- stack
  + PUSH  POP SWAP DUP 等
- code
  + CODESIZE / CODECOPY / EXTCODESIZE / EXTCODECOPY



> CALLDATA  CODE 是只读的

### 数据位置
- 变量的默认位置
  + constant  默认与合约一起存放 
  + 状态变量  storage
  + 本地变量  memory
  + 大多数时候会默认分配类型
- 参考类型
  + 函数参数的注意
    - external  public  参数不能为storage
    - 其他都可以
  + 函数体内的规则
    - 引用类型之间的赋值限制
      + storage 只能来源于storage，无论是直接还是间接
      + memory 可以来源于任何类型
      + calldata 只能来源于calldata
  + 返回值
    - 总是内存类型
- 行为
  + 读写storage 如何判断是否使用指针
  + 读写memory
- 映射的边缘情况
  + 映射不能动态创建，只能定义在函数体内
  + 只能是storage
  + 所有key都有默认值
- 其他
  + calldata是被推荐的
  + 安全问题举例
    - memory storage混用，更新storage后又使用旧的memory导致漏洞
    - https://mudit.blog/cover-protocol-hack-analysis-tokens-minted-exploit/

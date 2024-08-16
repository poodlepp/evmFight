[TOC]

### calldata
#### 布局
 - 布局方式类型内存
 - 一次加载32bytes
    - mload
    - calldataload
 - 能读取，不能写入
 - 其余字节对应输出参数，每个参数都是32字节
#### 基础
 - calldata  memory
    - calldata 是调用者分配的
    - memory是被调用者分配的
 - 特征
    - 不可修改
    - 读取时复制到堆栈
    - 大小几乎无限
    - 内存是有边界的uint64
    - 另外一个角度  calldata会被区块的 gas limit 约束
    - calldata 分配更多字节的成本是线性的，memory是平方增长
    - 分配,读取都很便宜
    - 零字节 4gas
    - 非零字节 16gas
    - CALLDATALOAD  读取32bytes  加载到堆栈 3gas
    - 非持久性
    - 用于交易和合约调用
    - 不是合约创建交易
 - 信息
    - msg.sender
    - msg.data[4:]
    - msg.value
    - msg.sig
    - msg.data
    - 整个calldata
    - gasleft()
 - 操作码
    - CALLDATALOAD
    - CALLDATASIZE
    - CALLDATACOPY
#### 组装calldata
 - 合约间调用
 - data + selector
 - 各种encode方法都可以
 - address().call(calldatapayload)
#### 分片
 - msg.data[start:end]
#### 注意
 - memory作为入参的方法  可以传入calldata
    - 方法1
    - calldataload 
    - mstore
    - 方法2
    - calldatacopy
    - 都是创建副本
 - calldata作为入参的方法  不可以传入memory
    - calldata是没有写入操作码的
    - 内部函数是不能使用calldata作为入参的
 - 构造函数中，calldata不能作为一个参数使用
    - 构造函数运行时，合约地址下没有字节码
    - data字段用于消息调用，合约中没没有代码是不能进行调用的
    - 构造函数中的 msg.sig  msg.data 都是0
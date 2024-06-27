## DEEP INTO MEMORY

### 概述
- EVM是一个堆栈机器，在32bytes上运行
  + 如果遇到大于32bytes的数据，就需要用到memory处理
- 内存特点
  + 省gas
  + 可变
  + 来自于函数调用或者构造函数
  + 不持久
    - 跨合约时会获得新的内存实例
  + 字节寻址空间
  + 一次读取32bytes，称为一个字


### 详述

- 保留空间
  + 第一二个字   临时空间
  + 第三四个字   空闲内存指针
  + 第五个字   零位插槽，永久为0，用作动态内存数组的初始值
- 最大限制
  + geth中限制了最大uint64
- 基本原理
  + 只能在函数内部指定
  + 复杂类型默认都是用内存
- 交互
  + MLOAD 
  + MSTORE
  + MSTORE8
  + MSIZE 当前执行环境中最高字节偏移   总是字的倍数
    - free memory pointer + 32
    - 内存每次扩展 32bytes
- calldata 如何转移至memory
  + JUMPDEST 开始
  + load offset (calldata offset )
  + load length 
  + allocate space(memory)
  + write the string in memory 
  + 此时内存是如何分布的？？？
  + calldata 数据是否需要转移，存在原来的合约中？
- 指针
  + memory 赋值给memory  实际是复制了指针
- 内存扩展成本
  + 前724字节 线性
  + 此后二次方增加
  + mload 读取更高的偏移量时，成本也会增加
- 合约调用之间的内存
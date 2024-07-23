[TOC]

## STACK

### 简介
- VM是本地操作系统之上的一个高级抽象，在多种硬件架构上运行同一个平台
- 主要分类
  - 基于寄存器 
  - 基于堆栈
- 架构区别
  - 虚拟机如何存储，检索，使用参数
  - 数据存储结构不同
- 基于寄存器
  - 字典形式
  - 使用注册表存储参数，参数数值用地址“显示lexpicitly”
  - Erlang, Lua, Dalvik VM
- 基于堆栈
  - PUSH  POP  LIFO
  - jvm .net

### EVM
- 所有计算在 stack frame 的数据区进行，使用256位“字”的机器
- 堆栈与solidity
  - 最便宜的使用数据位置
  - 堆栈只在函范围内使用
- 操作堆栈
  - PUSH POP SWAP DUP
  - 总是取堆栈顶层项目
  - storage, memory, calldata  各自有相关的操作码
- 堆栈框架只在函数范围内可用 
- 操作码
  - POP
  - PUSH1 - 32
  - DUP   N(1 - 16)
  - SWAP  N(1 - 16)
- 堆栈布局
  - 元素 256bit 一个字长；大端位于左侧
  - 栈大小  最多1024元素
  - 只有最上面16个项目可以被访问；这16个貌似是不包含top 1
    - 想要突破这个限制，只能使用变通的方式
- 分类
  - 直接变量  指针类型
  - 堆栈是一个被填充的数据位置
    - bytesN 向右填充
    - address  uintN 向左填充
    - 外部函数是例外，占两个槽位
      - 20字节的地址，底部字中，左边置0
      - 4字节的选择器，顶部字中，左边置0
- 堆栈平衡
  - 每个函数结束时，堆栈根据需要弹出尽可能多的元素，最终堆栈上不再有任何项目
- 块作用域
  - 块结束 局部变量也会弹出，尽早清理无用的元素
  - 使得其他变量更容易被访问
- 调用栈
  - stack 栈  EVM栈
  - call stack 调用栈   合约调用顺序栈
- 栈与内联汇编
  - assembly 结束，其中定义的变量也都会弹出
- 避免堆栈过深  stack too deep
  - 减少变量个数
  - internal 分解
  - 块作用域
  - 预防：
  - 避免创建大量参数的函数
  - return不要命名
  - 避免abi.encode 太多参数
  - 避免太多局部变量





- stack too deep ?
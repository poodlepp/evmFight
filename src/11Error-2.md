[TOC]
## 运行时错误
 - Error(string)
 - Panic(uint256)
 -  - 正常代码不可能输出panic，一定要修复
 -  - 使用工具来检查
 -  -  - slither
 -  -  - mythx
 - custom error
 -  - 减小合约字节码大小
 -  - 允许传递动态数据
 -  - @dev  @param  描述错误，参数
 -  - 是abi的一部分
 -  - 内联汇编中无法访问 custom error
 -  - solc  --hashes 可以列出custom error
 - invalid
 -  - 内联汇编中使用
 -  -  - assembly
 -  - 回退交易，消耗所有的gas
 - 未来的错误类型
 - selector
    - 每个类别都是不同的，尤其是custom error
    - 操作码 REVERT 之前，有一个 4 字节的值被推入堆栈，就是selector
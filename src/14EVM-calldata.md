[TOC]
## calldata
 - 介绍
    - 发送给函数的编码参数
    - 静态/动态
 - 编码
    - abi.encodeWithSelector
    - decode
 - 静态变量
    - selector
    - data
 - 动态变量
    - bytes string  <T>[]   <T>[N]
    - selector
    - 偏移量
    - 长度&数据是连在一起，在后方
       - 长度
       - bytes从左边开始
 - multicall
    - 第一个数组
       - selector
       - offset
       - length
       - item里面存的是每个call的数据开始offset
    - item1
       - 会用到00000 作为item的间隔
       - length
          - 单位不统一，有的byte有的是32bytes
       - selector
       - params
       
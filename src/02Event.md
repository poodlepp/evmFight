## Event optimization


- 可以在合约，库，接口中定义；也可以在文件级别定义
- 可以访问其他合约中的event 通过import
- 触发事件的函数 不应为 pure view
- 事件签名 和函数一样
- 事件主题hash
  - bytes32 aaa = ABCEvent.selector;
  - 日志中的index0
  - 可以帮助进行事件索引，匿名事件是无法索引的
- 参数类型
  - 接受任何类型参数
  - 包含external函数
  - 不包含internal函数
  - 最多三个indexed参数
    + 如果是anonymous event,最多4个indexed
  - 事件参数的复杂类型会转换为ABI关联值类型
- 匿名事件 anonymous 
  - 不能通过名称进行过滤，不能直接监听
  - 可以通过合约地址进行监听
  - event ABCEvent() anonymous;
  - 合约部署更加便宜，触发时也更便宜
  - 假设合约中只有一个事件，那么定义为匿名，既可以省gas，也可以明确的知晓发生的event，也可以定义4th indexed
  - 匿名事件没有bytes32 主题hash，不支持.selector
- LOG操作码 记录日志/事件
  - 可以控制topic的个数
  - logn(p,s,t1,t2...tn)
    + p 开始获取数据的内存位置
    + s 从p开始的字节数
    + t1 t2  可索引事件参数
- gas
  - 一般来说一个indexed 375gas
  - 没有index 就算375gas
  - 一个byte 8gas
- 检查-事件-交互 模式
  - remix静态分析工具
  - Slither 检测
  - 可能发生事件顺序  调用顺序不一致
    + 如果先远程调用，再发出事件
  - 何时使用事件
    + 重要的变更时
- 进一步探索&安全问题
  - 略了，回头看吧

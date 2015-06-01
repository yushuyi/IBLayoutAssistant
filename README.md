# IBLayoutAssistant
IBLayoutAssistant 是一个服务于IB 在使用Auto Layout 时 便捷 设置 常量值的助理
如果你是一个经常用IB进行界面布局的开发者，那么在使用Auto Layout时 根据业务情况或者时屏幕适配情况
需要在代码里面对某一根约束的常量值进行修改，我们通常的做法是，将约束也建立一个IBOutlet。 然后对其修改。
IBLayoutAssistant 想解决的问题就是  无法创建 IBOutlet  也可以达到随心所欲的修改。

# 实现原理
我们都知道，每一根约束实际上都寄生在相应的View或者Superview当中，为了找到正确的所需要修改的约束，内部逻辑则是去寻找。
找到那根我们需要修改的约束

# 使用
IBLayoutAssistant 采用Swift 进行编写，有如下几种API：


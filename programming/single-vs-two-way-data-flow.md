### 单向数据流与双向数据流

#### 单向数据流
数据的流向是单一的，对于复杂应用来说这是实施统一的状态管理(如Flux)的前提，当出现问题的时候，可以较好地追踪源头，缺点就是要使UI发生变化，需要创建一系列的action来维护对应的state。这对于使用过双向绑定的人来说，一开始是比较不适应的。  

#### 一次单向数据流(Flux)
> 用户访问View -> View发出Action -> Dispatcher收到Action，要求Store进行相应的更新 -> Store更新后，放出一个“change”事件 -> View收到“change”事件后，自动更新页面

#### 双向数据流
数据是双向流动的，值与UI双绑定，在一些需要实时反应用户输入的场合会非常方便(比如多级联动菜单)，通常认为复杂应用中这种便利比不上引入状态管理带来的优势。即各种数据相互依赖相互绑定，导致数据问题的源头难以被跟踪到，数据状态不好管理。

#### 笔记参考资料
> 贺师俊的知乎回答[单向数据绑定和双向数据绑定的优缺点，适合什么场景？](https://www.zhihu.com/question/49964363)  
> 阮一峰的[Flux 架构入门教程](http://www.ruanyifeng.com/blog/2016/01/flux.html)
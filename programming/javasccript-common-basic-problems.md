### JavaScript常见基础问题

#### 1、JS的基本数据类型是哪些？
> Undefined、Null、Boolean、Number、String
> Object是引用数据类型

#### 2、typeof 操作符返回值有哪些？
> undefined、object、boolean、number、string

#### 3、JS有哪些内置对象？
> Object是JavaScript中所有对象的父对象  
> 数据封装类对象：Object、Array、Boolean、Number、String  
> 其他对象：Function、Argument、Math、Date、RegExp、Error

#### 4、window下有哪些对象
> document、frames、history、location、navigator、screen

#### 5、检测浏览器版本有哪些方式？
> userAgent(navigator.userAgent)、HTML中的注释方法(适用于IE)

#### 6、事件处理机制有哪两种？
> 冒泡事件(IE)、捕获事件

#### 7、如何阻止冒泡事件？
> 非IE：event.stopPropagation();   
> IE：event.cancelBubble = true;

#### 8、如何阻止默认事件？
> 非IE：event.preventDefault();  
> IE：event.returnValue = false;

#### 9、JavaScript中，有一个函数，执行对象查找时，永远不会去查找原型，这个函数是哪个？
> hasOwnProperty

#### 10、new 操作符具体干了什么呢?
> 1、创建一个空对象，并且this变量引用该对象，同时还继承了该函数的原型  
> 2、属性和方法被加入到this引用的对象中  
> 3、新创建的对象由this所引用，并且最后隐式的返回this  
> 相当于：  
> var obj = {};  
> obj.\_\_proto\_\_ = Baes.prototype;  
> Base.call(obj);  

#### 11、什么是闭包？
> 闭包是指有权访问另一个函数作用域中变量的函数，创建闭包的最常见的方式就是在一个函数内创建另一个函数，通过另一个函数访问这个函数的局部变量，利用闭包可以突破作用链域，将函数内部的变量和方法传递到外部。  
> 闭包特性：  
> 1、函数内再嵌套函数  
> 2、内部函数可以引用外层的参数和变量  
> 3、参数和变量不会被垃圾回收机制回收






















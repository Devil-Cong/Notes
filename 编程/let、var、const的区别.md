### let、var、const的区别

#### 写在最前
在ES6之前，是没有块级作用域这一说，而ES6开始就有了块级作用域，即{}包裹的，我们称之为块。
另外使用let或者const时，必须声明'use strict',否则浏览器不能显示结果

#### 区别：
1.	let、const具有块级作用域，var没有
2.	let、const不会变量提升，var会
3.	let不能定义在块中已有标识符同名的变量，var可以
4.	let声明的变量并不是全局对象的属性，这就意味着不可以通过window.变量名的方式访问这些变量，而var声明的全局变量这可以
5.	const是用来定义常量的，即不可修改的

#### 笔记参考资料：
麻辣小隔壁的[var、let、const 区别？](http://www.jianshu.com/p/4e9cd99ecbf5)
cookfront的[每天学点ES6－let和const](http://cookfront.github.io/2015/05/28/es6-let-const)
### 原生Javascript进行Ajax请求过程
---
#### 1.	创建Ajax对象
``` javascript
// 创建ajax对象
var xhr = null;
if(window.XMLHttpRequest){
    xhr = new XMLHttpRequest();
} else {
    //为了兼容IE6
    xhr = new ActiveXObject('Microsoft.XMLHTTP');
}
```
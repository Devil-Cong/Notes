### 原生JavaScript进行Ajax请求过程

#### 1、创建Ajax对象
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

#### 2、连接服务器
``` javascript
// 连接服务器open(方法GET/POST，请求地址， 异步传输)
xhr.open('GET',  'data.txt',  true);
```

#### 3、发送请求
``` javascript
// 发送请求
xhr.send();
```

#### 4、接收返回数据
``` javascript
// 处理返回数据
/*
** 每当readyState改变时，就会触发onreadystatechange事件
** readyState属性存储有XMLHttpRequest的状态信息
** 0 ：请求未初始化
** 1 ：服务器连接已建立
** 2 ：请求已接受
** 3 : 请求处理中
** 4 ：请求已完成，且相应就绪
*/
xhr.onreadystatechange = function(){
    if(xhr.readyState == 4){
        /*
        ** Http状态码
        ** 1xx ：信息展示
        ** 2xx ：成功
        ** 3xx ：重定向
        ** 4xx : 客户端错误
        ** 5xx ：服务器端错误
        */
        if(xhr.status == 200){
            success(xhr.responseText);
        } else {
            if(failed){
                failed(xhr.status);
            }
        }
    }
}
```

#### Ajax封装函数：
``` javascript
function Ajax(type, url, data, success, failed){
    // 创建ajax对象
    var xhr = null;
    if(window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
 
    var type = type.toUpperCase();
    // 用于清除缓存
    var random = Math.random();
 
    if(typeof data == 'object'){
        var str = '';
        for(var key in data){
            str += key+'='+data[key]+'&';
        }
        data = str.replace(/&$/, '');
    }
 
    if(type == 'GET'){
        if(data){
            xhr.open('GET', url + '?' + data, true);
        } else {
            xhr.open('GET', url + '?t=' + random, true);
        }
        xhr.send();
 
    } else if(type == 'POST'){
        xhr.open('POST', url, true);
        // 如果需要像 html 表单那样 POST 数据，请使用 setRequestHeader() 来添加 http 头。
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(data);
    }
 
    // 处理返回数据
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4){
            if(xhr.status == 200){
                success(xhr.responseText);
            } else {
                if(failed){
                    failed(xhr.status);
                }
            }
        }
    }
}
 
// 测试调用
var sendData = {name:'asher',sex:'male'};
Ajax('get', 'data/data.html', sendData, function(data){
    console.log(data);
}, function(error){
    console.log(error);
});
```

#### 原文来自
蓝克比尔的[原生JavaScript封装Ajax](http://www.cnblogs.com/Webcom/p/3415295.html)





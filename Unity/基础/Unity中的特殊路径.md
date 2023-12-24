# Unity中的特殊路径

## Application.dataPath
```csharp
print(Application.dataPath);
```
* 输出打印后可以获取当前工程的路径,(只限于编辑器模式获取,打包后这个路径就没有意义了) 
* 得到的路径是属于Assets文件夹下

## Resources
```csharp
print(Application.dataPath + "/Resources");
```
* 手动创建
* 只读,只能通过Resources相关API加载
* 打包时该文件夹下的所有资源都会被打包出去
* 打包时Unity会对其压缩加密

## StreamingAssets 
```csharp
print(Application.streamingAssetsPath);
```
* 手动创建
* 打包出去不会被压缩加密，可以任由我们摆布
* 移动平台只读，PC平台可读可写
* 可以放入一些需要自定义动态加载的初始资源(热更新相关)

## persistentDataPath
```csharp
print(Application.persistentDataPath);
```
* 可读可写,一般进行游戏数据持久化,存储游戏相关的数据可以放入这个路径
* 不同平台,路径不同,没有固定的位置  

&rArr; 未完待续...  
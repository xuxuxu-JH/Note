# AssetBundle
AssetBundle就简称为AB包,是一个资产文件的压缩包,有点类似于压缩文件,AB包是可以进行动态加载的,我们可以将游戏中的资源打包成AB包的形式,当我们需要的某个资源的时候从AB包当中获取,节约了空间,也进一步的减少了游戏包体的大小,因此AB包也可以用作游戏中的热更新,当游戏需要发布新的内容是直接加载新的AB即可,而不需要重新发布整个游戏
## AB包的作用
1. 提到AB包就不得不想到Resources,AB包相比Resources有更多的优势
	* Resources目录下的文件在打包时会统一打包所有,且这个目录是只读的,无法修改
	* AB包的存储位置可以自定义,压缩方式可以自定义,后期可以修改(用于热更新)
2. 减少包体大小,压缩资源,减少初始包的大小(比如,一个游戏下载下来可能要2个G,比较耗费流量,当如果通过AB包的形式,将部分资源作为AB包,初始包大小就可能只有几百M,后续进入游戏的时候再联网下载
3. 资源热更新,脚本热更新

## 使用Unity官方打包工具AssetBundle Browser进行打包
* 为什么不能打包C#脚本资源?
	* 首先,C#是一种编译性语言,在运行C#代码逻辑前需要通过编译器翻译为机器语言,C#编译后生成的程序是不能在运行时修改的，只能在重新编译后才能生效
	
	* 而Lua是一种解释性语言,可以在运行时动态的修改代码,不需要进行重新编译,由于Lua不需要进行编译,所以当有新的游戏逻辑时,只需要替换相应的Lua脚本文件或更新Lua代码即可
	
	  ![{484E44E8-D20C-4501-8549-C6C49FA7D085}](D:\BaiduSyncdisk\Note\Unity\Lua热更新\{484E44E8-D20C-4501-8549-C6C49FA7D085}.png)

* Build参数解释
  ![{A18F8ED7-4F04-426b-8FDC-DA3B84880064}](D:\BaiduSyncdisk\Note\Unity\Lua热更新\{A18F8ED7-4F04-426b-8FDC-DA3B84880064}.png)

![image-20231123184117686](D:\BaiduSyncdisk\Note\Unity\Lua热更新\image-20231123184117686.png)

* 打包后的AB包文件都包含什么?
  * ![{0601B770-C5BE-42c0-A87B-D4A17436DFF8}](D:\BaiduSyncdisk\Note\Unity\Lua热更新\{0601B770-C5BE-42c0-A87B-D4A17436DFF8}.png)

## AssetBundle的加载

拷贝StreamingAsset文件夹下,因为不同平台的输出路径不同,流文件夹可读且路径是默认统一的

加载主包,加载AB包前先加载主包

### 加载的流程

* 同步加载AB包
	* 加载ab包
   ```csharp
   AssetBundle ab = AssetBundle.LoadFromFile(填写ab包路径)
   ```
	* 加载ab包中的资源,最好使用泛型,避免出现加载同名不同类型资源时的冲突
   ```csharp
   ab.LoadAsset<GameObject>("Cube");
   ```
* 注意:AB包不能重复加载,否则会报错
* 异步加载AB包
	* 异步加载 &rArr; 协程
	```csharp
	StartCoroutine(LoadABRes("ui", "Bonus_02"));
	```
	```csharp
	IEnumerator LoadABRes(string ABName, string resName)//AB包名 资源名
    {
        //第一步 异步加载AB包
        AssetBundleCreateRequest UI = AssetBundle.LoadFromFileAsync(Application.streamingAssetsPath + "/" + ABName);
        yield return UI;
        //第二步 异步加载资源
        AssetBundleRequest cursor =                             UI.assetBundle.LoadAssetAsync(resName, typeof(Sprite));
        yield return cursor;
        img.sprite = (Sprite)cursor.asset;
    }
	```
* 卸载AB包
	
	* false代表只卸载未加载的ab包,true代表卸载所有(包含场景中对象已经加载过)
	
	```csharp
	AssetBundle.UnloadAllAssetBundles(false);
	```
	* 卸载单个ab包 就自己卸载自己就好了
	```csharp
	AssetBundle ab = AssetBundle.LoadFromFile(填写ab包路径)
	ab.Unload(false);
	```
#### AB包的依赖
* 什么是AB包的依赖?
	一个资源如果用到的别的AB包资源,这个时候,如果只加载自己的AB包.那么通过这个包创建的对象会出现资源丢失的情况,因为他们并不属于同一个包,只需要将依赖包一起加载了,就会显示正常
	
* 所以,如果两个包之间存在依赖关系,就需要加载两个包(本身和依赖包都需要加载)

* 如何加载依赖包
	* 利用主包获取依赖关系,主包就是和输出路径同名的ab包,主包中记录了所有包中的依赖信息
	1. 加载主包
	```csharp
	AssetBundle abMain = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + "AB_Path");
	```
	2. 加载固定配置文件(mainfest) 固定写法,直接记忆
	```csharp
	AssetBundleManifest abMainfest = abMain.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
	```
	3. 从固定配置文件中获取到指定包的依赖包信息,然后将这些依赖包都加载出来,就不会出现资源空引用
	通过GetAllDependencies(),返回指定包的所有依赖包信息,包含的是这些依赖包的包名string字符串
	```csharp
	string[] strs = abMainfest.GetAllDependencies("model");
	```
	通过主包返回的依赖包名,将这些依赖包全部加载出来
	```csharp
	for (int i = 0; i < strs.Length; i++)
        {
            AssetBundle ab2 = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + strs[i]);
        }
	```
	AB包管理器
	[AB_Manager](D:\Unity.Project\AB_Base\Assets\Scripts\AB_Manager.cs)


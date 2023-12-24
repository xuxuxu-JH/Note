# Resources资源动态加载
## Resources资源动态加载的作用
* 手动创建该文件夹,将需要动态加载的资源放入该文件夹下,通过代码直接加载路径下的资源,无需手动拖拽
* 常用于加载的资源类型
    * 预设体对象——GameObject
    * 音效文件——AudioClip
    * 文本文件——TextAsset
    * 图片文件——Texture
## Resrources相关API及用法
1. 资源同步加载
   ```csharp
   Resources.Load();
   ```
    * 注意,这种方式加载出的文件都是Obj类型,需要手动转为制定类型
    * 比如加载一个文件
   ```csharp
   TextAsset ta = Resources.Load("Txt/Test") as TextAsset; 
   ```
	* 加载同名文件不同类型时怎么办?
	使用typeof指定类型
	```csharp
   Resources.Load("Txt/Test", typeof(TextAsset)) as TextAsset;
   ```
   也可以通过下方的泛型方法来解决
   
   * 加载指定名字的所有资源
   ```csharp
   Object[] objs = Resources.LoadAll("Tex/TestJPG");
   ```
   
   * 泛型方法
   ```csharp
   TextAsset ta2 = Resources.Load<TextAsset>("Tex/TestJPG");
   ```
   
2. 资源异步加载
	* 所谓异步加载就是新开一个线程进行资源加载,主线程可以继续跑
	* 异步加载相比于同步加载,同步加载是在主线程中进行的,比如:当我们加载一个大型资源文件是,如果同步加载可能就会进行等待,耗时,主线程后续的逻辑必须等待资源加载完成后才能继续,给玩家造成的体验就是卡顿,使用异步加载让主线程继续执行它负责的代码逻辑,让别的线程负责加载资源
	* 注意:打个比方,如果在资源加载的代码后面的代码中,需要使用到加载出的资源,同步加载的方式是一定可以拿得到的,<font color = red>异步加载的话需要等待另外的线程加载完后才能获取到,所以最少都要等待一帧</font>
	这段代码可以理解为Unity会在内部新开一线程进行资源加载
	```csharp
	Resources.LoadAsync<Texture>("Tex/TestJPG");
	```
	* 同时,我们也可以监听这个异步加载事件,便于及时获取到资源
	* 当异步加载完后,这个comleted事件在内部会等异步加载完毕后会自动调用LoadOver
	```csharp
	ResourceRequest rq = Resources.LoadAsync<Texture>("Tex/TestJPG");
	rq.completed += LoadOver;
	```
	另外,异步加载可以搭配协程一起使用,进行协程异步加载,可以在协程中处理复杂的逻辑,比如同时加载多个资源等,使得之执行起来效率更高,性能更好
	
3. 资源卸载
	当我们通过Resources加载一次资源过后,该资源就回在内存中作为缓存,便于第二次加载的时候直接从内存中得,而不需要再次重新加载一次,所以使用Resource重复加载资源是不会浪费内存的,但是如果这个资源后续不用了,我们就有必要卸载这个资源,避免浪费内存,一直占用着内存空间
	* 卸载指定的资源
		* 注意,卸载指定的资源不能卸载GameObject类型的对象,卸载的是不需要进行实例化的内容,比如Image,Audio,Text	  
	```csharp
	Resources.UnloadAsset()
	```
	* 卸载未使用的资源
	```csharp
	Resources.UnloadUnusedAssets();
	```
	​		

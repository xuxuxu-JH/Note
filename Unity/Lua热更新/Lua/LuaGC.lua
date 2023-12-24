-->Lua中的垃圾回收
-->关键字collectgarbage

--获取当前lua占用字节数 返回值*1024
collectgarbage("count")

--进行一次垃圾回收
collectgarbage("collect")

--lua中有自动定时进行GC的方法
--自动耗性能,最好进行手动GC

print("**********协程**********")

print("**********协程的创建**********")
fun = function()
    print(123)
end
--常用创建协程的两种方式:

-->方式_1 创建一个函数,传入create()
co = coroutine.create(fun) --返回的是一个thread线程类型
--打印出协程类型,是thread
-->因此,协程的本质是一个thead线程对象
print(type(co))

-->方式_2
co2 = coroutine.wrap(fun)
print(type(co2)) --这种方式 返回的是一个function函数类型

print("**********协程运行**********")
-->协程的执行 resume
-->第一种方式(对应方式1) 如果是通过creat创建的协程 就用这种方式来
--传入co的线程类型对象
coroutine.resume(co)
-->第二种方式(对应方式2) 因为第二种方式返回的类型是funciton 所有可以直接用函数的方式来执行调用
co2()

print("**********协程挂起**********")
fun2 = function()
    local i = 1
    while true do
        print(i)
        i = i + 1
        --print(coroutine.status(self))
        coroutine.yield() --刚C#中的语法糖yiled return 类型,记住这句话即可
    end
end
--创建协程
co3 = coroutine.create(fun2)
-->这一段代码只会执行一次,就不执行了,因为lua是从上到下一次执行的;相当于这里只会执行一次协程里面的函数
coroutine.resume(co3) --因为不是循环 所以这里执行协程只会执行一次就被挂起 i不会增加1

--通过死循环 体现这个协程
-- while true do
--     coroutine.resume(co3)
-- end

--resume的返回值
isOk, temp1 = coroutine.resume(co3)
print(isOk)        --返回的是ture,代表的是协程是否启动成功
--如果用两个变量来接收
print(isOk, temp1) --第一个返回值返回的时候被执行,第二个返回值返回的是协程函数内的内容

--warp的返回值
--只有一个返回值 就是协程的内容 没有boolean(true或false)

print("**********协程的状态**********")
--corotine.status(协程对象)
--dead 结束
--suspended 暂停
--running 进行中
print(coroutine.status(co))  --内部没有yield 就是结束的状态
print(coroutine.status(co3)) --co3是处于暂停状态 只要挂起了 就是暂停
--协程running的状态在外部没法得到 可以在协程函数内部得到

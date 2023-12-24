--函数
--funciton 函数名()
--end
print("**********无参无返回值函数**********")
--无参无返回值 两中声明方法
function Fun1()
    print("调用了F1函数")
end

-->Lua中没有面相对象,是面相过程的语言,代码从上到下一次执行
-->所以函数必须在声明之后才能调用
Fun1()

-->类似C#中的委托和事件的写法 因为在lua中函数也是一种变量类型
--这种写法是不能够有名字的,相当于F2装载了这个函数,但是由于这种写法不能有函数名,因此调用时直接调用F2
F2 = function()
    print("调用了F2函数")
end

F2()

print("**********有参数的函数**********")
--有参数,但函数的形参不需要定义指定的类型,因为Lua中变量不需要指定类型
--此时a可以是任何类型参数,
--因此F3函数可以传入任何参数
function F3(a)
    print(a)
end

F3("1")
F3()        --如果不传参数,也不会报错,Lua默认会认为参数是nil
F3(1, 3, 4) --如果传入的参数过多,也不会报错,Lua默认丢弃

print("**********有返回值函数**********")
--有返回值 只需要return即可
function F4(a)
    return a
end

--有多个返回值
function F5(a)
    return a, "123", true
end

-->如果有多个返回值 那么函数中有多少个返回值 就用多少个变量来接收即可
-->即使接收的变量不够也不会报错 只是有多少接多少而已
temp1, temp2, temp3 = F5("多个返回值")
print(temp1)
print(temp2)
print(temp3)

print("**********有返回值函数**********")
--函数的类型
--函数类型 就地funtion类型
F_Fun = function()
    print("funciton类型")
end
print(type(F_Fun)) --输出类型 就是funtion类型

print("**********函数的类型**********")
F11 = function()
    print("F11函数")
end
--函数的类型就是function 函数本身就是一种变量类型
print(type(F11))

print("**********函数的重载**********")
--函数的重载
-->lua中函数不支持重载 默认调用最后一个声明的函数
--即使存在同名函数 也不会报错 Lua中只会认为你改变了这个原有的函数

print("**********变长参数**********")
--变长参数
--... 三个点就是变长参数
--变长参数就代表函数的参数可以放入多个
function F7(...)
    --用一个表存起来
    arg = { ... }
    for i = 1, #arg do
        print(arg[i])
    end
end

print("**********函数嵌套**********")
--函数嵌套
--函数里面装了一个函数 返回一个函数
function F8()
    F9 = function()
        print("嵌套函数")
    end
    return F9
end

--也可以简写 不用函数名
function F10()
    return function()
        print("嵌套2")
    end
end

F10()

FF8 = F8()
FF8()

-->闭包
function F11(x)
    --改变了函数参数的生命周期
    return function(y)
        return x + y
    end
end

f10 = F11(10) -- x = 10 因为内部还有一个函数 引用了x 此时x还是存在的
print(f10(5))

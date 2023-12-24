print("**********复杂数据类型_table2**********")

print("**********字典**********")
-->table实现字典
print("**********字典的声明**********")
--lua中的字典依然是由键值对构成的
a = { ["name"] = "Jason", ['age'] = 20, ['2'] = 4 }
--访问方式和C#一致
print(a["name"])
print(a["age"])
--还可以通过 a. 的方式得到值 类似于对象访问变量的形式
print(a.name)
print(a.age)
--通过.的方式得到值,只限于key不是数字的形式,如果key是数字,就报错
--print(a.2)
--修改
print("**********修改值**********")
a["name"] = "xuxuxu"
print(a.name)
-->新增一个键值对,直接通过括号给一个新的键,赋值即可
a["hobby"] = "Play"
print(a.hobby)
a["hobby"] = nil --滞空
print(a.hobby)
print("**********字典的遍历**********")
-->遍历字典 一定用pairs ipairs是一定用不了的 只能遍历连续的数字索引
for key, value in pairs(a) do
    --可以传多个参数 一样可以打印出来
    print(key, value)
end
--只遍历值(只输出值) 其实不是只遍历了值 字典的特征必须得到键才能得到值
--这里其实是得到了值的 只是没有输出而已
for key, value in pairs(a) do
    print(value)
end

print("**********类和结构体**********")
--lua中是默认没有面向对象的 需要我们自己来实现
--表现类的形式
Student =
{
    --表中的变量都是全局变量
    age = 1,
    sex = "男",
    Fun = function(t)
        print("Student类函数")
        print(t.name)
        -->由于表中声明的全局变量 因此 在表内函数不能够直接访问到age 得到的不是同一个age
        -->如果想要得到表本身的age 必须指定是那个表 表名.变量
        print(age)
    end

}
--lua中可以在表外,添加并初始化一个成员(可以使任何类型的成员,包括函数)
Student.name = "Jason"
-->C#要是使用类 需要实例化对象new
-->但这lua中不需要实例化 这里更像是一种静态的表现 都是通过 类. 出来其中的成员的

print("**********点和冒号**********")
-->Lua的冒号和.的区别
Student.Fun(Student) --点号就是直接通过表来调用函数 传入一个参数 冒号无非是将self作为参数传入而已
-->冒号 默认将调用者本身 作为函数的参数
Student:Fun()
--以上两种方式的结果和逻辑是一致的 只是表达的方式不同


-->在表外声明函数的两种方式
-->1.
Student.speak = function()
    print("表外函数1")
end
-->2.使用冒汗声明的函数,默认的第一个参数是本身,使用:冒号才能在函数的内部使用self关键字
function Student:speak2()
    print("表外函数2")
end

Student.speak()
Student.speak2()

Student.speak3 = function(t)
    -->lua中的关键字slef表示默认传入的第一个参数
    print(self.name)
end


print("**********表的公共操作**********")
--表中 table提供的一些公共方法

--表中 存放了两张表
t1 = { { age = 1, name = "123" }, { age = 2, name = "456" } }
t2 = { { name = "Jason" }, { sex = true } }

--观察插入前和插入后 表t1的长度
print(#t1)
--将t3插入到t1表当中
--lua提供的公共类的函数
table.insert(t1, t2) -->将t2插入到t1当中
--插入后的长度
print(#t1)
--此时t2已经插入到t1当中了,通过t1打印出插入后t2的name
print(t1[3][1].name)

--删除指定元素
--穿一个参数 传一个表进去 就会移除这个表索引当中最后一个索引的元素
table.remove(t1) --将t2移除了
print(#t1)
--这里就得不到t2的内容 会报错
--print(t1[3][1].name)

--传二个参数 删除指定表中的指定索引
table.remove(t1, 1) --删除t1中的第一张表
print(#t1)          --打印就只剩下1张表

table.remove(t1)
print(#t1) --删完

print("**********排序**********")
-->排序函数依然是table公共表提供的
t3 = { 7, 5, 6, 4, 1, 2, 3 }
--传入一个参数,需要被排序的表 进行升序排序
table.sort(t3)
for key, value in pairs(t3) do
    print(value)
end

--传入两个参数,第二参数是自定义排序规则的函数 当进行排序时,会执行函数里面的规则
table.sort(t3, function(a, b)
    if a > b then
        return true
    end
end)
--输出降序
for k, v in pairs(t3) do
    print(v)
end


print("**********拼接**********")
tb = { "123", "456", "789", "13213213213" }

str = table.concat(tb, "*") --在表中的每个元素后插入一个*
print(str)

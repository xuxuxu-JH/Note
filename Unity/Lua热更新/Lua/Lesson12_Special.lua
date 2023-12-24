print("**********特殊用法**********")


print("**********多变量赋值**********")
--多变量 依次赋值
a, b, c = 1, 2, "123"

--多变量赋值 如果后面的值不够 会自动补空
--a, b, c = 1, 2
--由于c没有被赋值,所以直接得到的就是空
--print(c)

--多变量赋值 如果后面的值多了 会自动省略
-- a, b, c = 1, 23, 6, 7, 87, 9
-- print(a)
-- print(b)
-- print(c)

print("**********多返回值**********")
--函数多返回值
--用几个变量装 就有几个值 如果变量少了 就少接几个 如果多了 就自动补空
local function ff1()
    return 1, 3, 5, 7, 9
end
q, w, e, r = ff1()
print(q, w, e, r)

print("**********and or**********")
--逻辑与和逻辑或 运算符
--and or 他们不仅可以连接 boolean 任何东西都可以进行连接
--在lua中 只有nill 和 false 才会认为是假
--"短路"  对于and来说 有假则假 只要有一个是假的 那后续的逻辑都不执行了
--对于or来说 有真则真

print(true and true and 1)  --因为前面都是真的 所有一直到最后 1都会被打印出来
print(true and false and 1) --因为第二个就是false 所以在false这里就停止计算了 1不会被打印出来
--or 同理
print(true or false or 1)
print(false or true or 1) --还是会输出true  or是由真则真,只要由一个是真的就行,满足其中的一个条件就会成立

-->Lua中不支持三目运算符

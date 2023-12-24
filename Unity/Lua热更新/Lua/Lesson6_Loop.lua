print("**********循环语句**********")

print("**********while循环语句**********")
num = 0
-->while循环 while...do
--当条件符合 就do
-- while num<5 do
--     print("循环dosomething")
-- end

print("**********do while循环语句**********")
-->do...while
num = 6
repeat
    print("do while to do ")
until num > 5 --退出条件,当num > 5退出循环
--和C#不一样 C#中的do while中的do是进入条件 而Lua中的repeat until 是退出条件

print("**********for循环语句**********")
--这里就会打印出1-10 也就是i的范围
--i会默认自增 lua中会自增
for i = 1, 10 do --第二是结束条件 当i = 10就结束
    print(i)     -->不需要填写自增量 默认自增+1
end

--修改自增量,增加第三个逗号,这里每次自增2
for i = 1, 10, 2 do
    print(i)
end

--递减 -2
for i = 1, 10, -2 do
    print(i)
end
--递减 -1
print("递减")
for i = 10, 1, -1 do
    print(i)
end

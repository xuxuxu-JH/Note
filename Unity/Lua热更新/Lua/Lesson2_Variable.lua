print("=============变量=============")
-- >lua当中的基本变量类型
-- > nil number string boolean function table
-- >其他的复杂数据类型都是基于以上基本类型来实现的
-- lua中所有的变量声明,都不需要定义变量类型,它会自动判断类型
-- 类似C#中的 var
--
print(b)

-- 通过type函数可以得到变量类型 这个函数返回值是string

-- nil 类似C#中的null
-- >lua中未赋值的变量默认是nil,nil本身就是一种数据类型,它不仅仅是表达为空
print("=========nil=========")
a = nil
print(a)

-- number 所有的数值类型都是number
print("=========number=========")
a = 1
print(a)
print(type(a))
-- 字符串的声明 是用单引号或者双引号 不存在char类型
print("=========string=========")
a = "string"
print(a)

-- boolean类型
print("=========boolean=========")
a = true
print(a)
a = false
print(a)

-- >lua当中的复杂数据类型
--[[
>funciton类型
>table 表
userdata 数据结构
thread 协同程序
]]

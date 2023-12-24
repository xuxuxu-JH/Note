print("*******字符串********")
str = "双引号字符串"
str2 = '单引号字符串'

print("*******字符串长度********")
-- 获取字符串的长度
s = "abcdefg字符串"
print(#s)
-- >从这里可以看出,中文字符一个汉字,在Lua中占三个长度
-- 英文字符只占一个长度

print("*******字符串多行打印********")
-- 使用转译字符换行,进行多行打印
print("123\n123")

-- 字符串中的多行打印,方括号不加减号
s = [["乌
啦
啦
啦"]]
print(s)

print("*******字符串的拼接********")
-- 字符串拼接
-- >通过 .. 来拼接
print("123" .. "456")
-- 只要是用.. 都是表示 用字符串的类型去拼接 无论是什么变量类型

-- >用string.format函数拼接
-- %d 与数字拼接
-- %a 与任何字符拼接
print(string.format("我是Jason,I gonna be like %d and ", 111))

-- tostring 别的类型转字符串
a = 521124
print(type(tostring(a)))

-- 字符串提供的公共方法
str = "abcdefg"
-- 小写转大写
print(string.upper(str))

-- 大写转小写
print(string.lower(str))

-- 翻转字符串
print(string.reverse(str))

-- >字符串索引查找 该函数有两个返回值 返回的一个是指定字符的起始位置 一个是结束位置
-- >lua中字符的索引是从1开始 区别于C#是从0开始的
print(string.find(str, "b"))

-- 截取字符串 该函数有重载 如果是一个参数 就是截取指定位置的字符 如果会死两个参数 就截取这两个索引之间的所有字符
print(string.sub(str, 3, 4))

-- 字符串修改 将指定的字符串改为某个另外的字符串
print(string.gsub(str, "cd", "dc"))

-- 字符串 转ASCII码
a = string.byte("Lua", 1)
print(a)
-- ASCII码转字符
print(string.char(a))

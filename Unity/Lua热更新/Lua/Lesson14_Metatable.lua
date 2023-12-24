print("**********元表概念************")
--任何表变量都可以作为另一个表变量的元表
--任何表变量都可以有自己的元表（爸爸）
--当我们子表中进行一些特定操作时
--会执行元表中的内容
print("**********设置元表************")
meta = {}
myTable = {}
--设置元表函数
--第一个参数 子表
--第二个参数 元表
-->将meta表作为myTable的元表
setmetatable(myTable, meta)

print("**********特定操作-__tostring************")
meta2 = {
	--当子表要被当做字符串使用时 会默认调用这个元表中的tostring方法
	__tostring = function(t)
		return t.name
	end
}
myTable2 = {
	name = "唐老狮2"
}

setmetatable(myTable2, meta2)
--这里就会直接调用它元表中的toString的函数
print(myTable2)

print("**********特定操作-__call************")
meta3 =
{
	__tostring = function(t)
		return t.name
	end,

	--当子表被当做一个函数来使用时 会默认调用这个__call中的内容
	--当希望传参数时 一定要记住 默认第一个参数 是调用者自己
	__call = function(a, b)
		print(type(a)) -->a代表的是myTable本身,如果想要得到传入的参数,就必须再声明一个变量
		print("传入的参数" .. b)
		print("唐老狮好爱你")
	end
}
myTable3 =
{
	name = "唐老狮2"
}

setmetatable(myTable3, meta3)
--把子表当做函数使用 就会调用元表的 __call方法
myTable3(1) --当希望传参数时 一定要记住 默认第一个参数 是调用者自己
--所以这里在打印的时候 会先把myTable3自己表中的成员先作为参数先打印出来

print("**********特定操作-运算符重载************")
--当子表要进行特殊的操作的时候 会调用父表中的function
meta4 = {
	--相当于运算符重载 当子表使用+运算符时 会调用该方法
	--运算符+
	__add = function(t1, t2)
		return t1.age + t2.age
	end,
	--运算符-
	__sub = function(t1, t2)
		return t1.age - t2.age
	end,
	--运算符*
	__mul = function(t1, t2)
		return 1
	end,
	--运算符/
	__div = function(t1, t2)
		return 2
	end,
	--运算符%
	__mod = function(t1, t2)
		return 3
	end,
	--运算符^
	__pow = function(t1, t2)
		return 4
	end,
	--运算符==
	__eq = function(t1, t2)
		return true
	end,
	--运算符<
	__lt = function(t1, t2)
		return true
	end,
	--运算符<=
	__le = function(t1, t2)
		return false
	end,
	--运算符..
	__concat = function(t1, t2)
		return "567"
	end

}
myTable4 = { age = 1 }
setmetatable(myTable4, meta4)
myTable5 = { age = 2 }
setmetatable(myTable5, meta4)
-->将4和5 都作为meta4的子表,由于子表中进行了运算符的重载,这样就实现了子表和子表间使用运算符直接运算
print(myTable4 + myTable5)
print(myTable4 - myTable5)
print(myTable4 * myTable5)
print(myTable4 / myTable5)
print(myTable4 % myTable5)
print(myTable4 ^ myTable5)

--如果要用条件运算符 来比较两个对象
-->这两个对象的元表一定要一致 才能准确调用方法 就是这两个表必须是同一个元表 才能进行条件运算
print(myTable4 == myTable5)
print(myTable4 > myTable5)
print(myTable4 <= myTable5)

print(myTable4 .. myTable5)

print("**********特定操作-__index和__newIndex************")

meta6 =
{
	name = "Jason"
}
-->将__index指向自己本身
--__index的指向这句代码最好写在表的外部,写在表的内部得不到
meta6.__index = meta6
myTable6 = {}
setmetatable(myTable6, meta6)

--> __index Get重定向
-->当在子表中,找不到某一个属性的时候,会元表中__index指定的表中去找索引
--由于myTable中没有name这个属性,去到他的元表meta6中找,而meta6中的__index指向的表是本身,就得了meta6自己的name
print(myTable6.name)

--> __newindex Set重定向
-->当给子表赋值时,如果赋值一个不存在的索引,那么会把这个值赋值到元表中__newindex所指向的表中去
meta9 = {}
meta9.__newindex = meta9
myTable9 = {}
setmetatable(myTable9, meta9)
--mytable9中不包含age这个属性,因此会到元表中指向的__newindex中去找
myTable9.age = 21
print(meta9.age)

-->一些相关函数
--得到自己的元表是谁,忽略掉index
print(getmetatable(myTable9))
-->和index有关 Get
--得到自身的变量
rawget(myTable6, "age")
-->和newindex有关 Set
--给自身添加一个变量,忽略掉newindex
rawset(myTable9, "age", 33)
print(myTable9.age)

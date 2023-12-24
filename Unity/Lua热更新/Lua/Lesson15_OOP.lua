print("**********面相对象**********")
-->Lua实现面向对象
print("**********封装**********")
--Lua中的类的概念都是通过table来实现的
Object =
{
    id = 1,
}
-->为Object类添加一个New的构造函数
function Object:new()
    --声明一个空表,作为Object的子表 并返回
    local obj = {}
    --将Object的Get重定向为指向自己
    --self代表的是默认传入的第一个参数,因为是使用冒号来添加的这个函数,因此这里slef就代表了Object本身
    self.__index = self
    setmetatable(obj, self)
    return obj
end

--返回的是一个空表,并且这个空表是作为Object的子表,当我们通过obj得值的时候,会从元表中得,Object已经设置了Get重定向作为本身,进而得到的是obj的元表Object的id 实现了对象访问自己类当中的成员
local obj = Object:new()
print(obj.id)

print("**********继承**********")
--C#中的继承 类名:基类
-->通过函数实现继承
function Object:subClass(className) --_G表是以键值对的方式存储的,因此传入的变量类型得是string
    --使用_G表,声明了一个全局的空表,空表的名字 = className
    _G[className] = {}
    local obj = _G[className]
    self.__index = self
    -->为子类添加一个属性,代表的就是父类
    obj.base = self
    setmetatable(obj, self)
end

Object:subClass("Student")
print(Student.id)

print("**********多态**********")
--相同的行为,不同的表现就是多态
--相同的方法,不同的表现就是多态
Object:subClass("GameObject")
--为GameObject单独添加两个变量
GameObject.posX = 0
GameObject.posY = 0;
function GameObject:Speak()
    self.posX = self.posX + 1
    self.poxY = self.posY + 1
    print(self.posX)
    print(self.posY)
end

GameObject:subClass("Player")
--添加一个同名的函数 相当于重写了这个方法 类似C#多态
function Player:Move()
    self.base.Move()
end

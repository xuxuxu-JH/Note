-->Lua实现面向对象
--构建一个最终基类Object
Object = {}
-->构造函数
function Object:new()
    local obj = {}
    self.__index = self
    setmetatable(obj, self)
    return obj
end

-->继承
function Object:subClass(className)
    _G[className] = {}
    local obj = _G[className]
    --添加一个属性,指向父类
    obj.base = self
    self.__index = self
    setmetatable(obj, self)
end

Object:subClass("GameObject")
--为GameObject添加自己的成员属性和方法
GameObject.posX = 0
GameObject.posY = 0
function GameObject:Move()
    self.posX = self.posX + 1
    self.posY = self.posY + 1
end

local obj = GameObject:new()
print(obj.posX)
obj:Move()
print(obj.posX)

-->多态是一种行为表现
GameObject:subClass("Player")
-->重写Move方法,就是添加一个同名的函数,就不会重定向
function Player:Move()
    --base调用父类方法
    self.base.Move(self)
    print("Player当中的Move方法")
end

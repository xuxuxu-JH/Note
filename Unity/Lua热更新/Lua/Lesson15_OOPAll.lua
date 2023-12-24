-->Luaʵ���������
--����һ�����ջ���Object
Object = {}
-->���캯��
function Object:new()
    local obj = {}
    self.__index = self
    setmetatable(obj, self)
    return obj
end

-->�̳�
function Object:subClass(className)
    _G[className] = {}
    local obj = _G[className]
    --���һ������,ָ����
    obj.base = self
    self.__index = self
    setmetatable(obj, self)
end

Object:subClass("GameObject")
--ΪGameObject����Լ��ĳ�Ա���Ժͷ���
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

-->��̬��һ����Ϊ����
GameObject:subClass("Player")
-->��дMove����,�������һ��ͬ���ĺ���,�Ͳ����ض���
function Player:Move()
    --base���ø��෽��
    self.base.Move(self)
    print("Player���е�Move����")
end

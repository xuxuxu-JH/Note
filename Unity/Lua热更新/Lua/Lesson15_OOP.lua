print("**********�������**********")
-->Luaʵ���������
print("**********��װ**********")
--Lua�е���ĸ����ͨ��table��ʵ�ֵ�
Object =
{
    id = 1,
}
-->ΪObject�����һ��New�Ĺ��캯��
function Object:new()
    --����һ���ձ�,��ΪObject���ӱ� ������
    local obj = {}
    --��Object��Get�ض���Ϊָ���Լ�
    --self�������Ĭ�ϴ���ĵ�һ������,��Ϊ��ʹ��ð������ӵ��������,�������slef�ʹ�����Object����
    self.__index = self
    setmetatable(obj, self)
    return obj
end

--���ص���һ���ձ�,��������ձ�����ΪObject���ӱ�,������ͨ��obj��ֵ��ʱ��,���Ԫ���е�,Object�Ѿ�������Get�ض�����Ϊ����,�����õ�����obj��Ԫ��Object��id ʵ���˶�������Լ��൱�еĳ�Ա
local obj = Object:new()
print(obj.id)

print("**********�̳�**********")
--C#�еļ̳� ����:����
-->ͨ������ʵ�ּ̳�
function Object:subClass(className) --_G�����Լ�ֵ�Եķ�ʽ�洢��,��˴���ı������͵���string
    --ʹ��_G��,������һ��ȫ�ֵĿձ�,�ձ������ = className
    _G[className] = {}
    local obj = _G[className]
    self.__index = self
    -->Ϊ�������һ������,����ľ��Ǹ���
    obj.base = self
    setmetatable(obj, self)
end

Object:subClass("Student")
print(Student.id)

print("**********��̬**********")
--��ͬ����Ϊ,��ͬ�ı��־��Ƕ�̬
--��ͬ�ķ���,��ͬ�ı��־��Ƕ�̬
Object:subClass("GameObject")
--ΪGameObject���������������
GameObject.posX = 0
GameObject.posY = 0;
function GameObject:Speak()
    self.posX = self.posX + 1
    self.poxY = self.posY + 1
    print(self.posX)
    print(self.posY)
end

GameObject:subClass("Player")
--���һ��ͬ���ĺ��� �൱����д��������� ����C#��̬
function Player:Move()
    self.base.Move()
end

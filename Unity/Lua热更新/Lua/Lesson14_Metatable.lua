print("**********Ԫ�����************")
--�κα������������Ϊ��һ���������Ԫ��
--�κα�������������Լ���Ԫ���ְ֣�
--�������ӱ��н���һЩ�ض�����ʱ
--��ִ��Ԫ���е�����
print("**********����Ԫ��************")
meta = {}
myTable = {}
--����Ԫ����
--��һ������ �ӱ�
--�ڶ������� Ԫ��
-->��meta����ΪmyTable��Ԫ��
setmetatable(myTable, meta)

print("**********�ض�����-__tostring************")
meta2 = {
	--���ӱ�Ҫ�������ַ���ʹ��ʱ ��Ĭ�ϵ������Ԫ���е�tostring����
	__tostring = function(t)
		return t.name
	end
}
myTable2 = {
	name = "����ʨ2"
}

setmetatable(myTable2, meta2)
--����ͻ�ֱ�ӵ�����Ԫ���е�toString�ĺ���
print(myTable2)

print("**********�ض�����-__call************")
meta3 =
{
	__tostring = function(t)
		return t.name
	end,

	--���ӱ�����һ��������ʹ��ʱ ��Ĭ�ϵ������__call�е�����
	--��ϣ��������ʱ һ��Ҫ��ס Ĭ�ϵ�һ������ �ǵ������Լ�
	__call = function(a, b)
		print(type(a)) -->a�������myTable����,�����Ҫ�õ�����Ĳ���,�ͱ���������һ������
		print("����Ĳ���" .. b)
		print("����ʨ�ð���")
	end
}
myTable3 =
{
	name = "����ʨ2"
}

setmetatable(myTable3, meta3)
--���ӱ�������ʹ�� �ͻ����Ԫ��� __call����
myTable3(1) --��ϣ��������ʱ һ��Ҫ��ס Ĭ�ϵ�һ������ �ǵ������Լ�
--���������ڴ�ӡ��ʱ�� ���Ȱ�myTable3�Լ����еĳ�Ա����Ϊ�����ȴ�ӡ����

print("**********�ض�����-���������************")
--���ӱ�Ҫ��������Ĳ�����ʱ�� ����ø����е�function
meta4 = {
	--�൱����������� ���ӱ�ʹ��+�����ʱ ����ø÷���
	--�����+
	__add = function(t1, t2)
		return t1.age + t2.age
	end,
	--�����-
	__sub = function(t1, t2)
		return t1.age - t2.age
	end,
	--�����*
	__mul = function(t1, t2)
		return 1
	end,
	--�����/
	__div = function(t1, t2)
		return 2
	end,
	--�����%
	__mod = function(t1, t2)
		return 3
	end,
	--�����^
	__pow = function(t1, t2)
		return 4
	end,
	--�����==
	__eq = function(t1, t2)
		return true
	end,
	--�����<
	__lt = function(t1, t2)
		return true
	end,
	--�����<=
	__le = function(t1, t2)
		return false
	end,
	--�����..
	__concat = function(t1, t2)
		return "567"
	end

}
myTable4 = { age = 1 }
setmetatable(myTable4, meta4)
myTable5 = { age = 2 }
setmetatable(myTable5, meta4)
-->��4��5 ����Ϊmeta4���ӱ�,�����ӱ��н����������������,������ʵ�����ӱ���ӱ��ʹ�������ֱ������
print(myTable4 + myTable5)
print(myTable4 - myTable5)
print(myTable4 * myTable5)
print(myTable4 / myTable5)
print(myTable4 % myTable5)
print(myTable4 ^ myTable5)

--���Ҫ����������� ���Ƚ���������
-->�����������Ԫ��һ��Ҫһ�� ����׼ȷ���÷��� �����������������ͬһ��Ԫ�� ���ܽ�����������
print(myTable4 == myTable5)
print(myTable4 > myTable5)
print(myTable4 <= myTable5)

print(myTable4 .. myTable5)

print("**********�ض�����-__index��__newIndex************")

meta6 =
{
	name = "Jason"
}
-->��__indexָ���Լ�����
--__index��ָ�����������д�ڱ���ⲿ,д�ڱ���ڲ��ò���
meta6.__index = meta6
myTable6 = {}
setmetatable(myTable6, meta6)

--> __index Get�ض���
-->�����ӱ���,�Ҳ���ĳһ�����Ե�ʱ��,��Ԫ����__indexָ���ı���ȥ������
--����myTable��û��name�������,ȥ������Ԫ��meta6����,��meta6�е�__indexָ��ı��Ǳ���,�͵���meta6�Լ���name
print(myTable6.name)

--> __newindex Set�ض���
-->�����ӱ�ֵʱ,�����ֵһ�������ڵ�����,��ô������ֵ��ֵ��Ԫ����__newindex��ָ��ı���ȥ
meta9 = {}
meta9.__newindex = meta9
myTable9 = {}
setmetatable(myTable9, meta9)
--mytable9�в�����age�������,��˻ᵽԪ����ָ���__newindex��ȥ��
myTable9.age = 21
print(meta9.age)

-->һЩ��غ���
--�õ��Լ���Ԫ����˭,���Ե�index
print(getmetatable(myTable9))
-->��index�й� Get
--�õ�����ı���
rawget(myTable6, "age")
-->��newindex�й� Set
--���������һ������,���Ե�newindex
rawset(myTable9, "age", 33)
print(myTable9.age)

print("**********ѭ�����**********")

print("**********whileѭ�����**********")
num = 0
-->whileѭ�� while...do
--���������� ��do
-- while num<5 do
--     print("ѭ��dosomething")
-- end

print("**********do whileѭ�����**********")
-->do...while
num = 6
repeat
    print("do while to do ")
until num > 5 --�˳�����,��num > 5�˳�ѭ��
--��C#��һ�� C#�е�do while�е�do�ǽ������� ��Lua�е�repeat until ���˳�����

print("**********forѭ�����**********")
--����ͻ��ӡ��1-10 Ҳ����i�ķ�Χ
--i��Ĭ������ lua�л�����
for i = 1, 10 do --�ڶ��ǽ������� ��i = 10�ͽ���
    print(i)     -->����Ҫ��д������ Ĭ������+1
end

--�޸�������,���ӵ���������,����ÿ������2
for i = 1, 10, 2 do
    print(i)
end

--�ݼ� -2
for i = 1, 10, -2 do
    print(i)
end
--�ݼ� -1
print("�ݼ�")
for i = 10, 1, -1 do
    print(i)
end

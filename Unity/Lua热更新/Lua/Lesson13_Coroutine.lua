print("**********Э��**********")

print("**********Э�̵Ĵ���**********")
fun = function()
    print(123)
end
--���ô���Э�̵����ַ�ʽ:

-->��ʽ_1 ����һ������,����create()
co = coroutine.create(fun) --���ص���һ��thread�߳�����
--��ӡ��Э������,��thread
-->���,Э�̵ı�����һ��thead�̶߳���
print(type(co))

-->��ʽ_2
co2 = coroutine.wrap(fun)
print(type(co2)) --���ַ�ʽ ���ص���һ��function��������

print("**********Э������**********")
-->Э�̵�ִ�� resume
-->��һ�ַ�ʽ(��Ӧ��ʽ1) �����ͨ��creat������Э�� �������ַ�ʽ��
--����co���߳����Ͷ���
coroutine.resume(co)
-->�ڶ��ַ�ʽ(��Ӧ��ʽ2) ��Ϊ�ڶ��ַ�ʽ���ص�������funciton ���п���ֱ���ú����ķ�ʽ��ִ�е���
co2()

print("**********Э�̹���**********")
fun2 = function()
    local i = 1
    while true do
        print(i)
        i = i + 1
        --print(coroutine.status(self))
        coroutine.yield() --��C#�е��﷨��yiled return ����,��ס��仰����
    end
end
--����Э��
co3 = coroutine.create(fun2)
-->��һ�δ���ֻ��ִ��һ��,�Ͳ�ִ����,��Ϊlua�Ǵ��ϵ���һ��ִ�е�;�൱������ֻ��ִ��һ��Э������ĺ���
coroutine.resume(co3) --��Ϊ����ѭ�� ��������ִ��Э��ֻ��ִ��һ�ξͱ����� i��������1

--ͨ����ѭ�� �������Э��
-- while true do
--     coroutine.resume(co3)
-- end

--resume�ķ���ֵ
isOk, temp1 = coroutine.resume(co3)
print(isOk)        --���ص���ture,�������Э���Ƿ������ɹ�
--�������������������
print(isOk, temp1) --��һ������ֵ���ص�ʱ��ִ��,�ڶ�������ֵ���ص���Э�̺����ڵ�����

--warp�ķ���ֵ
--ֻ��һ������ֵ ����Э�̵����� û��boolean(true��false)

print("**********Э�̵�״̬**********")
--corotine.status(Э�̶���)
--dead ����
--suspended ��ͣ
--running ������
print(coroutine.status(co))  --�ڲ�û��yield ���ǽ�����״̬
print(coroutine.status(co3)) --co3�Ǵ�����ͣ״̬ ֻҪ������ ������ͣ
--Э��running��״̬���ⲿû���õ� ������Э�̺����ڲ��õ�

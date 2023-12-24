print("**********复杂数据类型 table**********")
--所有的复杂类型都是基于table来实现的(包括function)

print("**********数组**********")
a = { 1, 2, 3, 4, "321", false, nill }
-->lua中的索引都是从1开始的
print(a[1])
-->数组的长度通过 # 来获取
print(#a)
-->如果数组中半路出现nil空,就会认为数组到这里就停止了,会影响到数组的长度和遍历的结果
a = { 1, 3, 5, nil, 6 }

print("**********数组的遍历**********")
--但是这种遍历方式不是很可靠,如果数组中半路出现nil空
for i = 1, #a do
    print(a[i])
end

print("**********二维数组**********")
a = { { 123, 333, 444, 55 }, { 7, 8, 9, 32, 4 } }
print(a[2][1])

print("**********二维数组的遍历**********")
--循环嵌套遍历二维数组
for i = 1, #a do
    b = a[i]
    for j = 1, #b do
        print(b[j])
    end
end

print("**********自定义索引**********")
aa = { [0] = 1, 2, 3, [-1] = 4, 5 }
print(aa[0])
print(aa[-1])
--如果自定义了这样的索引来获取数组长度的话 数组的长度就会发生变化
--得到的长度是3,忽略掉这些不符合,规则的索引
print(#aa)

--用Lua写一个冒泡排序
print("**********冒泡排序**********")
a = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
function BubbleSort(array)
    for i = 1, #array do
        for j = 1, #array - i do
            if array[j] > array[j + 1] then
                array[j] = array[j] + array[j + 1]
                array[j + 1] = array[j] - array[j + 1]
                array[j] = array[j] - array[j + 1]
            end
        end
    end
end

print("**********迭代器遍历**********")
--迭代器遍历 主要是用来遍历table的
-->#得到的索引必须是连续的，如果遍历的时候遇到有nil,那么就会停止遍历

print("**********ipairs迭代器遍历**********")
a = { [0] = 1, 3, 4, 5, [-1] = 3, [6] = 9, nil, 8 }
--ipairs
for i, k in ipairs(a) do
    -->i就对应了index
    print("ipairs遍历的键值__" .. i .. "__" .. k)
end
-->由此可以看出 ipairs还是从1开始遍历的 小于1的自定义键值是不会遍历的
-->ipairs只会遍历连续的索引 中间索引跳跃中断的不会遍历
-->ipairs遇到nil就会停止遍历

print("**********pairs迭代器遍历**********")
--paris能够把所有的键都找到(包括小于1,以及自定义索引) 从而找到所有的值
for i, v in pairs(a) do
    print("ipairs遍历的键值__" .. i .. "__" .. v)
end

print("**********pairs遍历键**********")

for key, value in pairs(a) do
    print("pairs遍历的键__" .. key)
end

print("**********pairs遍历值**********")

for key, value in pairs(a) do
    print("pairs遍历的值__" .. value)
end

-->总结
-->lua中使用for和ipairs都只能遍历连索引连续数组
-->最好使用pairs去遍历,它能够得到所有的值和不规则的索引

--lua中ipairs和pairs的区别?

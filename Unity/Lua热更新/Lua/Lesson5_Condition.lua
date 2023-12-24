print("**********条件分支语句**********")
-->lua中的条件语句只有if
-->不支持Switch 不支持三目运算符

--语法格式
--if 条件 then
--   内容
--end

a = 9
--单分支
if a > 5 then
    print("if里面的内容") --内容
end

--双分支
if a < 5 then
    print("小于5")
else
    print("不小于5")
end

--多分支
if a < 5 then
    print("123")
elseif a == 6 then
    print("123")
elseif a == 7 then
    print("333")
end

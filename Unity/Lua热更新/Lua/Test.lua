print("访问测试脚本")
testA = "123"
local testB = "456" --这个本地变量在外部得不到

--但是本地变量,可以通过return 返出去
function Get_B()
    return testB
end

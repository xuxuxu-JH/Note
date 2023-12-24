print("**********全局变量和本地变量**********")
--这样声明的变量都是全局变量 全局变量,在外部的脚本中可以获取到,但是是占内存的
a = 1
b = "123"

--加了local关键字 就是本地局部变量
local c = 2

print("**********多脚本执行**********")
--通过require可以执行别的脚本 require只会加载执行一次该脚本
--关键字 require("脚本名")
require("Test") --执行了测试脚本的打印
print(testA)    --通过多脚本执行 执行了Test脚本 那么就能得到这个脚本中的全局变量
print(testB)    --Test中的本地变量访问不到
print(Get_B())  --通过封装的函数 Return得到了本地变量

print("**********脚本卸载**********")
--通过return 得到了本地局部变量
require("Test") --再次通过require执行Test 就不会执行了 该脚本已经被加载
--package.loaded["脚本名"]
--检测该脚本是否被执行过 返回值是boolean
print(package.loaded["Test"]) --这里会返回true 说明改脚本是被加载过的

--卸载已经通过require加载过的脚本
--直接滞空即可
package.loaded["Test"] = nil
--已经滞空 那么就可以通过require再次访问到
require("Test")


print("**********大G表**********")
-- _G
-- _G是一个总表 本质也是一个table 它将我们声明的所有[全局变量]都存储在其中 以键值对的形式 存储所有的全局变量
-- _G表只存全局变量 不存local变量

for index, value in pairs(_G) do
    print(index, valuel)
end

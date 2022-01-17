LuaJava文件夹将存放包括LuaJava.dex在内的所有LuaJava使用实例
如果有你有任何疑问，可联系我
如果对你造成了侵权，请联系我
如果你发现了可优化的代码问题，可联系我
如果你需要封装这里没有的函数，可准备上源码或者不准备，联系我后我可以尝试帮助，因为我才学Java没多久

2022.1.17上传了LuaJavaLib.smali文件，该文件内容用于替换原luajava.dex内的LuaJavaLib类，本次更新内容如下:
luajava.instanceOf --两个参数，均可以传入类实例（LuaUserdata）或类全名（LuaString类型）,其使用的是isAssignableFrom，但也实现了instanceof的功能。
返回参数两个，当传入参数A、B中的第一个参数的类型为第二个参数类型的父类时，返回true及“A是B的父类”的文字描述，B是A的父类返回true及继承关系描述，其他情况为false。
需要注意的是继承于luaj.Varargs的LuaTable等类在脚本内使用instanceOf只会得到Class.class的判别


print(luajava.instanceOf("android.ext.FloatPanel","android.fix.LinearLayout"))
--true 	class android.fix.LinearLayout是class android.ext.FloatPanel的父类

print(luajava.instanceOf("android.fix.LinearLayout","android.ext.FloatPanel"))
--true 	class android.fix.LinearLayout是class android.ext.FloatPanel的父类

local LuaTable = luajava.new(luajava.bindClass("luaj.LuaTable"))
--print(LuaTable)
--{}
print(luajava.instanceOf(LuaTable,"luaj.Varargs"))
--false 	class luaj.Varargs与class java.lang.Class没有继承与被继承关系

print(luajava.instanceOf("luaj.LuaTable","luaj.Varargs"))
--true 	class luaj.Varargs是class luaj.LuaTable的父类

context = luajava.bindClass("android.ext.Tools"):getContext()
MsContext = luajava.bindClass("android.ext.MainService").context
print(luajava.instanceOf(context,MsContext))
--true 	class android.ext.ServiceContext是class android.ext.ServiceContext的父类(本体)

luajava.castOf为类型强制转换，也是两个参数，可传userdata或者string
返回内容为强制转换的结果或nil

Tools = luajava.bindClass("android.ext.Tools")
--GameGuardian的工具类
context = Tools:getContext()
cache = Tools:getCacheDir():getAbsolutePath()
dexpath = "/storage/emulated/0/MT2/apks/LuaArray.dex"
LoadDex = luajava.loadDex(dexpath,cache,context)
LuaArray = LoadDex:loadClass("luaj.lib.LuaArray")
print(LuaArray)
--class luaj.lib.LuaArray
str = {"QQgroup","1038927421"}
StringArray = LuaArray:stringArray(str)
print(StringArray)
--[Ljava.lang.String;@59cb632
print(luajava.astable(StringArray)) --array to table
--{ -- table(d37d409)
--	[1] = QQgroup,
--	[2] = 1038927421,
--}
print(luajava.toArray(str,"string")) --table to array
--[Ljava.lang.String;@da76680
--第二个参数为需要转换的类型
--char short byte int long double float boolean string object
--其余情况默认为LuaValue类型
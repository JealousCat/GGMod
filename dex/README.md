#dex文件夹中的所有dex均为拓展包，支持使用luajava.loadDex直接加载使用

#加载方法大概如下

path = "/storage/emulated/0/Notes/ToolsLib.dex"
dir = "/sdcard/Notes/"
Tools = luajava.bindClass("android.ext.Tools")
--loadDex有三个参数，分别是dex的路径、dex加载缓存路径、以及GG的Context
dex = luajava.loadDex(path,dir,Tools:getContext())
tools = dex:loadClass("luaj.lib.ToolsLib")
_G.tools = tools:call()
print(tools.getCacheDirHidden())

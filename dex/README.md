#dex文件夹中的所有dex均为拓展包，支持使用luajava.loadDex直接加载使用

#加载方法大概如下

<p>path = "/storage/emulated/0/Notes/ToolsLib.dex"</p>
<p>dir = "/sdcard/Notes/"</p>
<p>Tools = luajava.bindClass("android.ext.Tools")</p>
<p>--loadDex有三个参数，分别是dex的路径、dex加载缓存路径、以及GG的Context</p>
<p>dex = luajava.loadDex(path,dir,Tools:getContext())</p>
<p>tools = dex:loadClass("luaj.lib.ToolsLib")</p>
<p>_G.tools = tools:call()</p>
<p>print(tools.getCacheDirHidden())</p>

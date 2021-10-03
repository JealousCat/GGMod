#dex文件夹中的所有dex均为拓展包，支持使用luajava.loadDex直接加载使用

# 加载方法

<p>path = "/storage/emulated/0/Notes/ToolsLib.dex"</p>
<p>dir = "/sdcard/Notes/"</p>
<p>Tools = luajava.bindClass("android.ext.Tools")</p>
<p>--loadDex有三个参数，分别是dex的路径、dex加载缓存路径、以及GG的Context</p>
<p>dex = luajava.loadDex(path,dir,Tools:getContext())</p>
<p>tools = dex:loadClass("luaj.lib.ToolsLib")</p>
<p>_G.tools = tools:call()</p>
<p>print(tools.getCacheDirHidden())</p>


# apksigner.dex
<p>apksigner.Signer类</p>
<p>sign方法，两个参数。两个参数时，均为String类型，分别是apk路径和输出路径</p>
<p>loadKeys方法，一个参数时为keys的文件名。两个参数时分别为keys的绝对父路径，第二个为文件名。keys文件名不加.pk8、.x509.pem、.sbt，只使用如testkeys等名字</p>
<p></P>

# SmaliManager.dex
<p>brut.androlib.src.SmaliDecoder</p>
<p>五个参数:apk路径(File类型)，解压输出路径(File类型)，apk包内dex的全名（如classes.dex，String类型），是否为调试模式（boolean类型），API级别（如29，int类型）</p>
<p>brut.directory.ExtFile将String类型的path或者File类型实例化为ExtFile</p>
<p>brut.androlib.src.SmaliBuilder</p>
<p>三个参数：由brut.directory.ExtFile实例化的File文件，编译后的新dex存放的文件(File类型)，API级别
<p></p>

# res.dex
<p>arsc、AndroidManifest.xml文件的反编译https://github.com/JealousCat/GGMod/blob/main/dex/res.dex</p>
用法这里就不细说

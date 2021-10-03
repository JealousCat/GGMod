# GGMod
提供GameGuardian的MOD教程和代码，如luajava库、修复os.execute函数、完善String库、添加Canvas等。

2021.10.01开始不定时更新

# 手机端工具
<p>MT文件管理器.apk</p>
<p>AIDE.apk</p>
<p>GameGuardian.apk</p>

# 语言
主要涉及以下语言
<p>Lua</p>
<p>LuaJ</p>
<p>LuaJava</p>
<p>Java</p>

# 模板
<p>由于luajava没法提供方便的String类都交互，所以我们需要对String类中的一些方法进行封装，并将它加入_G全局表中的string库里</p>
<p>StringLib.java类为luaj原String库编写方式的模板（不是我封装好的那个StringLib的源码），参考该编写方式可有效学习函数封装方法</p>
<p>https://github.com/JealousCat/GGMod/blob/main/Function/StringLib.java</p>

# 美化教程
注：指对非函数库类功能或UI界面等进行更改，使得修改器使用体验更好，界面更美观

<p><a href="https://alywp.net/35mDO4">一、更改安装包包名，同时可以起到去除随机安装的作用</a></p>
<p><a href="https://alywp.net/5bzBxRoW">二、更换修改器图标</a></p>
<p><a href="https://alywp.net/VYt9B">三、桌面图标两个变一个</a></p>
<p><a href="https://alywp.net/2i2gJg">四、通过arsc文件精简安装包大小</a></p>
<p><a href="https://alywp.net/3olKpw">五、通过res文件精简安装包大小</a></p>
<p><a href="https://alywp.net/46L2QB">六、通过dex文件精简安装包大小</a></p>
<p><a href="https://alywp.net/3FI6PT">七、去除脚本执行结束时的“脚本已结束：”字样，方便复制结束内容</a></p>
<p><a href="https://alywp.net/3mSuk5">八、UI图标美化</a></p>
<p><a href="https://alywp.net/6XmSy4">九、设置彩色描边透明背景弹窗</a></p>
<a href="https://github.com/JealousCat/GGMod/blob/main/beautify/Alert.smali">弹窗美化教程中的Alert.smali下载</a>
<p><a href="https://alywp.net/2EKe3V">十、去除搜索列表、保存列表的说明文字</a></p>



# 函数添加教程
注：指将编译好的函数文件添加到GG修改器的函数库中
<p><a href="https://github.com/JealousCat/GGMod/blob/main/LuaJava/Luajava.dex">luajava.dex文件下载</a></p>
LuaJava库将原官方的Loadlib更换为LoadDex，新增luajava.astable、luajava.toArray、luajava.methods。具体用法在后续教程中体现，或使用jadx查看java代码
<p><a href="https://alywp.net/2KzA5a">一、添加luajava库，用于lua与java交互，并可使用java方法</a></p>
<p><a href="https://alywp.net/7I7PeA">二、添加String库，在原有基础上完善</a></p>
<p><a href="https://alywp.net/3uFJjb">三、在string和math库添加单个新函数</a></p>
新增加了两个函数，其添加教程都可以使用如上教程
<p><a href="https://github.com/JealousCat/GGMod/blob/main/Function/StringLib%24similarity.dex">string.similarity字符串相似度</a></p>
<p><a href="https://github.com/JealousCat/GGMod/blob/main/Function/MathLib%24gcd.dex">math.gcd最大公约数计算</a></p>
<p><a href="https://github.com/JealousCat/GGMod/blob/main/dex/ToolsLib.dex">四、脱胎与GG原生类的工具函数库ToolsLib.dex</a></p>
整理了GG原来的所有类中的方法，将可以直接访问的静态方法，且有一定脚本内使用价值的方法均封装成了ToolsLib
<p><a href="https://github.com/JealousCat/GGMod/blob/main/dex/ToolsLib.dex"></a>ToolsLib.dex作为全新编译的拓展库，它可以像StringLib等库一样在Script类中实例化并加载进全局环境中，也可以使用luajava.loadDex进行非合并的本地加载</p>
<p>tools.removeNewLinesChars、tools.getCacheDir、tools.getHiddenDir、tools.getRamSizeKb、tools.isRootMode、tools.tryRoot、tools.toString64、tools.getLogcatFilename、tools.openAppInfo、tools.chmod、tools.executeScript、tools.isScreenOn、tools.getCacheDirHidden、tools.isPackageInsta、tools.alertBigText、tools.getNativePath、tools.exec、tools.prefixLongHex、tools.getFilesDir、tools.sendRestartIntent、tools.dump、tools.compare、tools.getStubLib、tools.hash、tools.crc32、tools.isLandscape、tools.ToHexString、tools.getScreenSize、tools.isX86、tools.trimDirPath、tools.doubleToTime、tools.allowExecute、tools.getSdcardPath、tools.prefix、tools.formatFileSize、tools.dp2px、tools.copyFile、tools.restartApp、tools.longToTime、tools.getDaemonDir、tools.getDaemonPath、tools.getFilesDirHidden、tools.parseTime、tools.getFreeMem、tools.getDataDirSafe</p>
有机会再详细说明各个函数的用法

<p>五、dex修改</p>
<p>这个dex文件使用内容大概如后文，你可以luajava库来访问它</p>
<p>dex转samli件https://github.com/JealousCat/GGMod/blob/main/dex/SmaliManager.dex</p>
brut.androlib.src.SmaliDecoder
<p>五个参数:</p>
<p>apk路径(File类型)，解压输出路径(File类型)，apk包内dex的全名（如classes.dex，String类型），是否为调试模式（boolean类型），API级别（如29，int类型）</p>
<p>brut.directory.ExtFile将String类型的path或者File类型实例化为ExtFile</p>
brut.androlib.src.SmaliBuilder
<p>三个参数：</p>
由brut.directory.ExtFile实例化的File文件，编译后的新dex存放的文件(File类型)，API级别
<p></p>
<p>arsc、AndroidManifest.xml文件的反编译https://github.com/JealousCat/GGMod/blob/main/dex/res.dex</p>
用法这里就不细说
<p>六、apk签名</p>
<p>签名开发包，https://github.com/JealousCat/GGMod/blob/main/dex/apksigner.dex</p>
<p>apksigner.Signer类</p>
sign方法，两个参数。
<p>两个参数时，均为String类型，分别是apk路径和输出路径</p>

<p>loadKeys方法，一个参数时为keys的文件名</p>
<p>两个参数时分别为keys的绝对父路径，第二个为文件名。</p>

keys文件名不加.pk8、.x509.pem、.sbt，只使用如testkeys等名字
<p></P>
# 函数编写教程
注：指函数源码编写过程，可学习LuaJ和luajava的API
<p><a href="https://alywp.net/19f22g">一、安装手机端AIDE</a></p>
<p><a href="https://alywp.net/6sngOO">二、编写一个StringUtils调试luajava库</a></p>
三、String库的完善与相关函数编写
<p><a href="https://alywp.net/4woqss">①主要讲解LuaValue.valueOf的使用</a></p>
<p><a href="https://alywp.net/6DceDH">②展示一些函数的编写过程</a></p>
<p><a href="https://alywp.net/7I7PeA">③教学封装StringLib的函数如何与原库合并</a></p>
新增内容如下：
<p></p>string.compare、string.endsWith、string.equals、string.hashCode、string.intern、string.startsWith、string.split、string.toCharArray、string.trim、string.delet、string.insert、string.setCharAt、string.newString、string.isLetter、string.isDigit、string.isUpper、string.isLower、string.toUpper、string.toLower<p></p>
用法可参考Java原方法，或者查看StringLib.dex的源码来学习函数用法

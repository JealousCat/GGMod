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
<p>StringLib.java类为luaj原String库编写方式的模板，参考该编写方式可有效学习函数封装方法</p>
<p>https://github.com/JealousCat/GGMod/blob/main/StringLib.java</p>

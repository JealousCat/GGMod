Alert = luajava.bindClass("android.ext.LogAlert")
Log = luajava.bindClass("android.ext.LogPrint")
Alert:clear()
Log:invoke()
Alert:update("start")

for n=1,100 do
 gg.sleep(20)
 Alert:update(n)
 Log:invoke()
end

Alert:update("end")
gg.sleep(50)
Log:invoke()


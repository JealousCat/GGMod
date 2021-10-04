.method public yield(Lluaj/Varargs;)Lluaj/Varargs;
    .registers 4

    iget-object v0, p0, Lluaj/Globals;->running:Lluaj/LuaThread;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lluaj/Globals;->running:Lluaj/LuaThread;

    invoke-virtual {v0}, Lluaj/LuaThread;->isMainThread()Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_c
    new-instance v0, Lluaj/LuaError;

    const-string v1, "cannot yield main thread"

    invoke-direct {v0, v1}, Lluaj/LuaError;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    iget-object v0, p0, Lluaj/Globals;->running:Lluaj/LuaThread;

    iget-object v0, v0, Lluaj/LuaThread;->state:Lluaj/LuaThread$State;

    invoke-virtual {v0, p1}, Lluaj/LuaThread$State;->lua_yield(Lluaj/Varargs;)Lluaj/Varargs;

    move-result-object v0

    return-object v0
.end method

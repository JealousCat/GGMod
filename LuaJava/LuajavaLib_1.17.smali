.class public Lluaj/lib/jse/LuajavaLib;
.super Lluaj/lib/VarArgFunction;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lluaj/lib/jse/LuajavaLib$ProxyInvocationHandler;
    }
.end annotation


# static fields
.field static final ASTABLE:I = 0x6

.field static final BINDCLASS:I = 0x1

.field static final CASTOF:I = 0xa

.field static final CREATEPROXY:I = 0x4

.field static final INIT:I = 0x0

.field static final INSTANCEOF:I = 0x9

.field static final LOADDEX:I = 0x5

.field static final METHODS:I = 0x8

.field static final METHOD_MODIFIERS_VARARGS:I = 0x80

.field static final NAMES:[Ljava/lang/String;

.field static final NEW:I = 0x3

.field static final NEWINSTANCE:I = 0x2

.field static final TOARRAY:I = 0x7


# direct methods
.method static final constructor <clinit>()V
    .registers 3

    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "bindClass"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "newInstance"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "new"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "createProxy"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "loadDex"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "astable"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "toArray"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "methods"

    aput-object v2, v0, v1

    const v1, 0x8

    const-string v2, "instanceOf"

    aput-object v2, v0, v1

    const v1, 0x9

    const-string v2, "castOf"

    aput-object v2, v0, v1

    sput-object v0, Lluaj/lib/jse/LuajavaLib;->NAMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lluaj/lib/VarArgFunction;-><init>()V

    return-void
.end method

.method public static VgetClass(Lluaj/Varargs;I)Ljava/lang/Class;
    .registers 4

    :try_start_0
    const-string v0, "java.lang.Class"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_5} :catch_15

    move-result-object v0

    invoke-virtual {p0, p1}, Lluaj/Varargs;->isuserdata(I)Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-virtual {p0, p1}, Lluaj/Varargs;->checkuserdata(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :cond_14
    :goto_14
    return-object v0

    :catch_15
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_20
    invoke-virtual {p0, p1}, Lluaj/Varargs;->isstring(I)Z

    move-result v1

    if-eqz v1, :cond_14

    :try_start_26
    invoke-virtual {p0, p1}, Lluaj/Varargs;->checkjstring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_2d} :catch_2f

    move-result-object v0

    goto :goto_14

    :catch_2f
    move-exception v1

    goto :goto_14
.end method

.method static synthetic access$Lorg$luaj$vm2$lib$LibFunction$1(Lluaj/lib/jse/LuajavaLib;)I
    .registers 2

    iget v0, p0, Lluaj/lib/LibFunction;->opcode:I

    return v0
.end method

.method static synthetic access$Sorg$luaj$vm2$lib$LibFunction$1(Lluaj/lib/jse/LuajavaLib;I)V
    .registers 2

    iput p1, p0, Lluaj/lib/LibFunction;->opcode:I

    return-void
.end method

.method public static castOf(Lluaj/Varargs;)Lluaj/Varargs;
    .registers 3

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lluaj/lib/jse/LuajavaLib;->VgetClass(Lluaj/Varargs;I)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {p0, v1}, Lluaj/lib/jse/LuajavaLib;->VgetClass(Lluaj/Varargs;I)Ljava/lang/Class;

    move-result-object v1

    :try_start_a
    invoke-virtual {v0, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_11} :catch_13

    move-result-object v0

    :goto_12
    return-object v0

    :catch_13
    move-exception v0

    sget-object v0, Lluaj/LuaValue;->NIL:Lluaj/LuaValue;

    goto :goto_12
.end method

.method public static instanceOf(Lluaj/Varargs;)Lluaj/Varargs;
    .registers 7

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lluaj/lib/jse/LuajavaLib;->VgetClass(Lluaj/Varargs;I)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {p0, v1}, Lluaj/lib/jse/LuajavaLib;->VgetClass(Lluaj/Varargs;I)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_ae

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_62

    invoke-static {v2}, Lluaj/LuaValue;->valueOf(Z)Lluaj/LuaBoolean;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v5, "是"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "的父类"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lluaj/LuaValue;->valueOf(Ljava/lang/String;)Lluaj/LuaString;

    move-result-object v0

    invoke-static {v2, v0}, Lluaj/LuaValue;->varargsOf(Lluaj/LuaValue;Lluaj/Varargs;)Lluaj/Varargs;

    move-result-object v0

    :goto_61
    return-object v0

    :cond_62
    invoke-static {v2}, Lluaj/LuaValue;->valueOf(Z)Lluaj/LuaBoolean;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v5, "与"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "没有继承与被继承关系"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lluaj/LuaValue;->valueOf(Ljava/lang/String;)Lluaj/LuaString;

    move-result-object v0

    invoke-static {v2, v0}, Lluaj/LuaValue;->varargsOf(Lluaj/LuaValue;Lluaj/Varargs;)Lluaj/Varargs;

    move-result-object v0

    goto :goto_61

    :cond_ae
    invoke-static {v2}, Lluaj/LuaValue;->valueOf(Z)Lluaj/LuaBoolean;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v5, "是"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "的父类"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lluaj/LuaValue;->valueOf(Ljava/lang/String;)Lluaj/LuaString;

    move-result-object v0

    invoke-static {v2, v0}, Lluaj/LuaValue;->varargsOf(Lluaj/LuaValue;Lluaj/Varargs;)Lluaj/Varargs;

    move-result-object v0

    goto/16 :goto_61
.end method

.method public static toArray(Lluaj/LuaTable;Ljava/lang/String;)Lluaj/LuaValue;
    .registers 8

    const/4 v0, 0x0

    invoke-virtual {p0}, Lluaj/LuaTable;->length()I

    move-result v1

    const-string v2, "int"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    new-array v2, v1, [I

    :goto_f
    if-lt v0, v1, :cond_16

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    :goto_15
    return-object v0

    :cond_16
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checkint()I

    move-result v3

    aput v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_25
    const-string v2, "boolean"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_45

    new-array v2, v1, [Z

    :goto_2f
    if-lt v0, v1, :cond_36

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto :goto_15

    :cond_36
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checkboolean()Z

    move-result v3

    aput-boolean v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2f

    :cond_45
    const-string v2, "long"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_65

    new-array v2, v1, [J

    :goto_4f
    if-lt v0, v1, :cond_56

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto :goto_15

    :cond_56
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checklong()J

    move-result-wide v4

    aput-wide v4, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_4f

    :cond_65
    const-string v2, "double"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_85

    new-array v2, v1, [D

    :goto_6f
    if-lt v0, v1, :cond_76

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto :goto_15

    :cond_76
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checkdouble()D

    move-result-wide v4

    aput-wide v4, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_6f

    :cond_85
    const-string v2, "float"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a6

    new-array v2, v1, [F

    :goto_8f
    if-lt v0, v1, :cond_96

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto :goto_15

    :cond_96
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checkdouble()D

    move-result-wide v4

    double-to-float v3, v4

    aput v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_8f

    :cond_a6
    const-string v2, "char"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c8

    new-array v2, v1, [C

    :goto_b0
    if-lt v0, v1, :cond_b8

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto/16 :goto_15

    :cond_b8
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checkint()I

    move-result v3

    int-to-char v3, v3

    aput-char v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_b0

    :cond_c8
    const-string v2, "byte"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ea

    new-array v2, v1, [B

    :goto_d2
    if-lt v0, v1, :cond_da

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto/16 :goto_15

    :cond_da
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checkint()I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_d2

    :cond_ea
    const-string v2, "string"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10b

    new-array v2, v1, [Ljava/lang/String;

    :goto_f4
    if-lt v0, v1, :cond_fc

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto/16 :goto_15

    :cond_fc
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checkjstring()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_f4

    :cond_10b
    const-string v2, "short"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12d

    new-array v2, v1, [S

    :goto_115
    if-lt v0, v1, :cond_11d

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto/16 :goto_15

    :cond_11d
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checkint()I

    move-result v3

    int-to-short v3, v3

    aput-short v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_115

    :cond_12d
    const-string v2, "object"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14e

    new-array v2, v1, [Ljava/lang/Object;

    :goto_137
    if-lt v0, v1, :cond_13f

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto/16 :goto_15

    :cond_13f
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    invoke-virtual {v3}, Lluaj/LuaValue;->checkuserdata()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_137

    :cond_14e
    new-array v2, v1, [Lluaj/LuaValue;

    :goto_150
    if-lt v0, v1, :cond_158

    invoke-static {v2}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;

    move-result-object v0

    goto/16 :goto_15

    :cond_158
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Lluaj/LuaTable;->get(I)Lluaj/LuaValue;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lluaj/LuaValue;->checkvalue(I)Lluaj/LuaValue;

    move-result-object v3

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_150
.end method


# virtual methods
.method protected classForName(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public invoke(Lluaj/Varargs;)Lluaj/Varargs;
    .registers 7

    const/4 v1, 0x0

    const/4 v2, 0x2

    :try_start_2
    iget v0, p0, Lluaj/lib/LibFunction;->opcode:I

    packed-switch v0, :pswitch_data_174

    new-instance v0, Lluaj/LuaError;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "not yet supported: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lluaj/LuaError;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_20
    .catch Lluaj/LuaError; {:try_start_2 .. :try_end_20} :catch_20
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_20} :catch_a2

    :catch_20
    move-exception v0

    throw v0

    :pswitch_22  #0x0
    const/4 v0, 0x2

    :try_start_23
    invoke-virtual {p1, v0}, Lluaj/Varargs;->arg(I)Lluaj/LuaValue;

    move-result-object v1

    new-instance v0, Lluaj/LuaTable;

    invoke-direct {v0}, Lluaj/LuaTable;-><init>()V

    invoke-virtual {p0}, Lluaj/lib/jse/LuajavaLib;->getClass()Ljava/lang/Class;

    move-result-object v2

    sget-object v3, Lluaj/lib/jse/LuajavaLib;->NAMES:[Ljava/lang/String;

    const/4 v4, 0x1

    invoke-virtual {p0, v0, v2, v3, v4}, Lluaj/lib/jse/LuajavaLib;->bind(Lluaj/LuaValue;Ljava/lang/Class;[Ljava/lang/String;I)V

    const-string v2, "luajava"

    invoke-virtual {v1, v2, v0}, Lluaj/LuaValue;->set(Ljava/lang/String;Lluaj/LuaValue;)V

    const-string v2, "package"

    invoke-virtual {v1, v2}, Lluaj/LuaValue;->get(Ljava/lang/String;)Lluaj/LuaValue;

    move-result-object v2

    invoke-virtual {v2}, Lluaj/LuaValue;->isnil()Z

    move-result v2

    if-nez v2, :cond_58

    const-string v2, "package"

    invoke-virtual {v1, v2}, Lluaj/LuaValue;->get(Ljava/lang/String;)Lluaj/LuaValue;

    move-result-object v1

    const-string v2, "loaded"

    invoke-virtual {v1, v2}, Lluaj/LuaValue;->get(Ljava/lang/String;)Lluaj/LuaValue;

    move-result-object v1

    const-string v2, "luajava"

    invoke-virtual {v1, v2, v0}, Lluaj/LuaValue;->set(Ljava/lang/String;Lluaj/LuaValue;)V

    :cond_58
    :goto_58
    return-object v0

    :pswitch_59  #0x1
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lluaj/Varargs;->checkjstring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lluaj/lib/jse/LuajavaLib;->classForName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lluaj/lib/jse/JavaClass;->forClass(Ljava/lang/Class;)Lluaj/lib/jse/JavaClass;

    move-result-object v0

    goto :goto_58

    :pswitch_67  #0x2, 0x3
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lluaj/Varargs;->checkvalue(I)Lluaj/LuaValue;

    move-result-object v0

    iget v1, p0, Lluaj/lib/LibFunction;->opcode:I

    if-ne v1, v2, :cond_8a

    invoke-virtual {v0}, Lluaj/LuaValue;->tojstring()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lluaj/lib/jse/LuajavaLib;->classForName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    :goto_78
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Lluaj/Varargs;->subargs(I)Lluaj/Varargs;

    move-result-object v1

    invoke-static {v0}, Lluaj/lib/jse/JavaClass;->forClass(Ljava/lang/Class;)Lluaj/lib/jse/JavaClass;

    move-result-object v0

    invoke-virtual {v0}, Lluaj/lib/jse/JavaClass;->getConstructor()Lluaj/LuaValue;

    move-result-object v0

    invoke-virtual {v0, v1}, Lluaj/LuaValue;->invoke(Lluaj/Varargs;)Lluaj/Varargs;
    :try_end_88
    .catch Lluaj/LuaError; {:try_start_23 .. :try_end_88} :catch_20
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_88} :catch_a2

    move-result-object v0

    goto :goto_58

    :cond_8a
    :try_start_8a
    const-string v1, "java.lang.Class"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_8f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_8a .. :try_end_8f} :catch_97
    .catch Lluaj/LuaError; {:try_start_8a .. :try_end_8f} :catch_20
    .catch Ljava/lang/Exception; {:try_start_8a .. :try_end_8f} :catch_a2

    move-result-object v1

    :try_start_90
    invoke-virtual {v0, v1}, Lluaj/LuaValue;->checkuserdata(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    goto :goto_78

    :catch_97
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_a2
    .catch Lluaj/LuaError; {:try_start_90 .. :try_end_a2} :catch_20
    .catch Ljava/lang/Exception; {:try_start_90 .. :try_end_a2} :catch_a2

    :catch_a2
    move-exception v0

    new-instance v1, Lluaj/LuaError;

    invoke-direct {v1, v0}, Lluaj/LuaError;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :pswitch_a9  #0x4
    :try_start_a9
    invoke-virtual {p1}, Lluaj/Varargs;->narg()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-gtz v0, :cond_b9

    new-instance v0, Lluaj/LuaError;

    const-string v1, "no interfaces"

    invoke-direct {v0, v1}, Lluaj/LuaError;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b9
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Lluaj/Varargs;->checktable(I)Lluaj/LuaTable;

    move-result-object v2

    new-array v3, v0, [Ljava/lang/Class;

    :goto_c1
    if-lt v1, v0, :cond_d9

    new-instance v0, Lluaj/lib/jse/LuajavaLib$ProxyInvocationHandler;

    invoke-direct {v0, v2}, Lluaj/lib/jse/LuajavaLib$ProxyInvocationHandler;-><init>(Lluaj/LuaValue;)V

    invoke-virtual {p0}, Lluaj/lib/jse/LuajavaLib;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {v1, v3, v0}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lluaj/LuaValue;->userdataOf(Ljava/lang/Object;)Lluaj/LuaUserdata;

    move-result-object v0

    goto :goto_58

    :cond_d9
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Lluaj/Varargs;->checkjstring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lluaj/lib/jse/LuajavaLib;->classForName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_c1

    :pswitch_e8  #0x5
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lluaj/Varargs;->checkjstring(I)Ljava/lang/String;

    move-result-object v2

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lluaj/Varargs;->checkjstring(I)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lluaj/Varargs;->checkuserdata(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;
    :try_end_f9
    .catch Lluaj/LuaError; {:try_start_a9 .. :try_end_f9} :catch_20
    .catch Ljava/lang/Exception; {:try_start_a9 .. :try_end_f9} :catch_a2

    :try_start_f9
    new-instance v4, Ldalvik/system/DexClassLoader;

    const/4 v1, 0x0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-direct {v4, v2, v3, v1, v0}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    invoke-static {v4}, Lluaj/lib/jse/CoerceJavaToLua;->coerce(Ljava/lang/Object;)Lluaj/LuaValue;
    :try_end_108
    .catch Ljava/lang/Exception; {:try_start_f9 .. :try_end_108} :catch_10b
    .catch Lluaj/LuaError; {:try_start_f9 .. :try_end_108} :catch_20

    move-result-object v0

    goto/16 :goto_58

    :catch_10b
    move-exception v0

    :try_start_10c
    sget-object v0, Lluaj/LuaValue;->NIL:Lluaj/LuaValue;

    goto/16 :goto_58

    :pswitch_110  #0x6
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lluaj/Varargs;->checkuserdata(I)Ljava/lang/Object;

    move-result-object v2

    new-instance v0, Lluaj/LuaTable;

    invoke-direct {v0}, Lluaj/LuaTable;-><init>()V

    :goto_11a
    invoke-static {v2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v3

    if-ge v1, v3, :cond_58

    add-int/lit8 v3, v1, 0x1

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lluaj/LuaValue;->userdataOf(Ljava/lang/Object;)Lluaj/LuaUserdata;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lluaj/LuaTable;->rawset(ILluaj/LuaValue;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_11a

    :pswitch_130  #0x7
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lluaj/Varargs;->checktable(I)Lluaj/LuaTable;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Lluaj/Varargs;->checkjstring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lluaj/lib/jse/LuajavaLib;->toArray(Lluaj/LuaTable;Ljava/lang/String;)Lluaj/LuaValue;

    move-result-object v0

    goto/16 :goto_58

    :pswitch_140  #0x9
    invoke-static {p1}, Lluaj/lib/jse/LuajavaLib;->instanceOf(Lluaj/Varargs;)Lluaj/Varargs;

    move-result-object v0

    goto/16 :goto_58

    :pswitch_146  #0xa
    invoke-static {p1}, Lluaj/lib/jse/LuajavaLib;->castOf(Lluaj/Varargs;)Lluaj/Varargs;

    move-result-object v0

    goto/16 :goto_58

    :pswitch_14c  #0x8
    new-instance v0, Lluaj/LuaTable;

    invoke-direct {v0}, Lluaj/LuaTable;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lluaj/Varargs;->checkjstring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    :goto_15e
    array-length v3, v2

    if-ge v1, v3, :cond_58

    add-int/lit8 v3, v1, 0x1

    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lluaj/LuaValue;->valueOf(Ljava/lang/String;)Lluaj/LuaString;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lluaj/LuaTable;->rawset(ILluaj/LuaValue;)V
    :try_end_170
    .catch Lluaj/LuaError; {:try_start_10c .. :try_end_170} :catch_20
    .catch Ljava/lang/Exception; {:try_start_10c .. :try_end_170} :catch_a2

    add-int/lit8 v1, v1, 0x1

    goto :goto_15e

    nop

    :pswitch_data_174
    .packed-switch 0x0
        :pswitch_22  #00000000
        :pswitch_59  #00000001
        :pswitch_67  #00000002
        :pswitch_67  #00000003
        :pswitch_a9  #00000004
        :pswitch_e8  #00000005
        :pswitch_110  #00000006
        :pswitch_130  #00000007
        :pswitch_14c  #00000008
        :pswitch_140  #00000009
        :pswitch_146  #0000000a
    .end packed-switch
.end method

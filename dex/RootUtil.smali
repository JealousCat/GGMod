.class public Lluaj/RootUtil;
.super Ljava/lang/Object;


# static fields
.field private static final TAG:Ljava/lang/String; = "linin.root"

.field private static mHaveRoot:Z


# direct methods
.method static final constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    sput-boolean v0, Lluaj/RootUtil;->mHaveRoot:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static execRootCmd(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    const/4 v1, 0x0

    const-string v5, ""

    move-object v0, v1

    check-cast v0, Ljava/io/DataOutputStream;

    check-cast v1, Ljava/io/DataInputStream;

    :try_start_8
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const-string v3, "su"

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    new-instance v4, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1b} :catch_86
    .catchall {:try_start_8 .. :try_end_1b} :catchall_8d

    :try_start_1b
    new-instance v3, Ljava/io/DataInputStream;

    invoke-virtual {v2}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_24} :catch_ba
    .catchall {:try_start_1b .. :try_end_24} :catchall_af

    :try_start_24
    const-string v0, "linin.root"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->flush()V

    const-string v0, "exit\n"

    invoke-virtual {v4, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->flush()V

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    :goto_4d
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readLine()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_61

    invoke-virtual {v2}, Ljava/lang/Process;->waitFor()I
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_56} :catch_bd
    .catchall {:try_start_24 .. :try_end_56} :catchall_b3

    :goto_56
    if-eqz v4, :cond_5b

    :try_start_58
    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_5b} :catch_a5

    :cond_5b
    :goto_5b
    if-eqz v3, :cond_60

    :try_start_5d
    invoke-virtual {v3}, Ljava/io/DataInputStream;->close()V
    :try_end_60
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_60} :catch_aa

    :cond_60
    :goto_60
    return-object v5

    :cond_61
    :try_start_61
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v6, "\n"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_84
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_84} :catch_bd
    .catchall {:try_start_61 .. :try_end_84} :catchall_b3

    move-result-object v5

    goto :goto_4d

    :catch_86
    move-exception v2

    move-object v4, v0

    :goto_88
    :try_start_88
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_8b
    .catchall {:try_start_88 .. :try_end_8b} :catchall_b6

    move-object v3, v1

    goto :goto_56

    :catchall_8d
    move-exception v2

    move-object v3, v1

    move-object v4, v0

    :goto_90
    if-eqz v4, :cond_95

    :try_start_92
    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V
    :try_end_95
    .catch Ljava/io/IOException; {:try_start_92 .. :try_end_95} :catch_9b

    :cond_95
    :goto_95
    if-eqz v3, :cond_9a

    :try_start_97
    invoke-virtual {v3}, Ljava/io/DataInputStream;->close()V
    :try_end_9a
    .catch Ljava/io/IOException; {:try_start_97 .. :try_end_9a} :catch_a0

    :cond_9a
    :goto_9a
    throw v2

    :catch_9b
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_95

    :catch_a0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9a

    :catch_a5
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5b

    :catch_aa
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_60

    :catchall_af
    move-exception v0

    move-object v2, v0

    move-object v3, v1

    goto :goto_90

    :catchall_b3
    move-exception v0

    move-object v2, v0

    goto :goto_90

    :catchall_b6
    move-exception v0

    move-object v2, v0

    move-object v3, v1

    goto :goto_90

    :catch_ba
    move-exception v0

    move-object v2, v0

    goto :goto_88

    :catch_bd
    move-exception v0

    move-object v2, v0

    move-object v1, v3

    goto :goto_88
.end method

.method public static execRootCmdSilent(Ljava/lang/String;)I
    .registers 6

    const/4 v3, -0x1

    const/4 v0, 0x0

    check-cast v0, Ljava/io/DataOutputStream;

    :try_start_4
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    const-string v2, "su"

    invoke-virtual {v1, v2}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    new-instance v2, Ljava/io/DataOutputStream;

    invoke-virtual {v1}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_17} :catch_4a
    .catchall {:try_start_4 .. :try_end_17} :catchall_51

    :try_start_17
    const-string v0, "linin.root"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v4, "\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V

    const-string v0, "exit\n"

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V

    invoke-virtual {v1}, Ljava/lang/Process;->waitFor()I

    invoke-virtual {v1}, Ljava/lang/Process;->exitValue()I
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_43} :catch_66
    .catchall {:try_start_17 .. :try_end_43} :catchall_63

    move-result v0

    :goto_44
    if-eqz v2, :cond_49

    :try_start_46
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_49} :catch_5e

    :cond_49
    :goto_49
    return v0

    :catch_4a
    move-exception v1

    move-object v2, v0

    :goto_4c
    :try_start_4c
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_63

    move v0, v3

    goto :goto_44

    :catchall_51
    move-exception v1

    move-object v2, v0

    :goto_53
    if-eqz v2, :cond_58

    :try_start_55
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_58} :catch_59

    :cond_58
    :goto_58
    throw v1

    :catch_59
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_58

    :catch_5e
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_49

    :catchall_63
    move-exception v0

    move-object v1, v0

    goto :goto_53

    :catch_66
    move-exception v0

    move-object v1, v0

    goto :goto_4c
.end method

.method public static haveRoot()Z
    .registers 2

    sget-boolean v0, Lluaj/RootUtil;->mHaveRoot:Z

    if-nez v0, :cond_22

    const-string v0, "echo test"

    invoke-static {v0}, Lluaj/RootUtil;->execRootCmdSilent(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1a

    const-string v0, "linin.root"

    const-string v1, "have root!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    sput-boolean v0, Lluaj/RootUtil;->mHaveRoot:Z

    :goto_17
    sget-boolean v0, Lluaj/RootUtil;->mHaveRoot:Z

    return v0

    :cond_1a
    const-string v0, "linin.root"

    const-string v1, "not root!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_17

    :cond_22
    const-string v0, "linin.root"

    const-string v1, "mHaveRoot = true, have root!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_17
.end method

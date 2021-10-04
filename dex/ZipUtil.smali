.class public Lluaj/ZipUtil;
.super Ljava/lang/Object;


# static fields
.field private static final BUFFER:[B

.field private static final logger:Ljava/util/logging/Logger;


# direct methods
.method static final constructor <clinit>()V
    .registers 2

    :try_start_0
    const-string v0, "cloud.lib.ZipUtil"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_5} :catch_17

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    const/16 v0, 0x1000

    new-array v0, v0, [B

    sput-object v0, Lluaj/ZipUtil;->BUFFER:[B

    return-void

    :catch_17
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static append(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V^",
            "Ljava/lang/Exception;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v1, Ljava/util/zip/ZipFile;

    invoke-direct {v1, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/zip/ZipOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v0}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v1}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v3

    :goto_13
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-nez v0, :cond_54

    new-instance v0, Ljava/util/zip/ZipEntry;

    invoke-direct {v0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "append: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    new-instance v0, Ljava/io/FileInputStream;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v0, v2}, Lluaj/ZipUtil;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v2}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    invoke-virtual {v1}, Ljava/util/zip/ZipFile;->close()V

    invoke-virtual {v2}, Ljava/util/zip/ZipOutputStream;->close()V

    return-void

    :cond_54
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/zip/ZipEntry;

    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "copy: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_86

    invoke-virtual {v1, v0}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, v2}, Lluaj/ZipUtil;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    :cond_86
    invoke-virtual {v2}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    goto :goto_13
.end method

.method private static compress(Ljava/io/File;Ljava/util/zip/ZipOutputStream;Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/zip/ZipOutputStream;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_6f

    move-object v0, v1

    check-cast v0, Ljava/io/FileInputStream;

    check-cast v1, Ljava/io/BufferedInputStream;

    :try_start_d
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    new-instance v2, Ljava/io/BufferedInputStream;

    sget-object v3, Lluaj/ZipUtil;->BUFFER:[B

    array-length v3, v3

    invoke-direct {v2, v0, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_1a
    .catch Ljava/io/FileNotFoundException; {:try_start_d .. :try_end_1a} :catch_91
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_1a} :catch_58
    .catchall {:try_start_d .. :try_end_1a} :catchall_89

    :try_start_1a
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    new-instance v1, Ljava/util/zip/ZipEntry;

    invoke-direct {v1, v0}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    :goto_37
    sget-object v0, Lluaj/ZipUtil;->BUFFER:[B

    const/4 v1, 0x0

    sget-object v3, Lluaj/ZipUtil;->BUFFER:[B

    array-length v3, v3

    invoke-virtual {v2, v0, v1, v3}, Ljava/io/BufferedInputStream;->read([BII)I
    :try_end_40
    .catch Ljava/io/FileNotFoundException; {:try_start_1a .. :try_end_40} :catch_51
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_40} :catch_8f
    .catchall {:try_start_1a .. :try_end_40} :catchall_5e

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_4a

    :goto_44
    if-eqz v2, :cond_49

    :try_start_46
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_49} :catch_6a

    :cond_49
    :goto_49
    return-void

    :cond_4a
    :try_start_4a
    sget-object v1, Lluaj/ZipUtil;->BUFFER:[B

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3, v0}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_50
    .catch Ljava/io/FileNotFoundException; {:try_start_4a .. :try_end_50} :catch_51
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_50} :catch_8f
    .catchall {:try_start_4a .. :try_end_50} :catchall_5e

    goto :goto_37

    :catch_51
    move-exception v0

    move-object v1, v2

    :goto_53
    :try_start_53
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_8c

    move-object v2, v1

    goto :goto_44

    :catch_58
    move-exception v0

    move-object v2, v1

    :goto_5a
    :try_start_5a
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5d
    .catchall {:try_start_5a .. :try_end_5d} :catchall_5e

    goto :goto_44

    :catchall_5e
    move-exception v0

    :goto_5f
    if-eqz v2, :cond_64

    :try_start_61
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_64} :catch_65

    :cond_64
    :goto_64
    throw v0

    :catch_65
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_64

    :catch_6a
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_49

    :cond_6f
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_49

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_49

    array-length v2, v1

    if-lez v2, :cond_49

    :goto_7e
    array-length v2, v1

    if-ge v0, v2, :cond_49

    aget-object v2, v1, v0

    invoke-static {v2, p1, p2}, Lluaj/ZipUtil;->compress(Ljava/io/File;Ljava/util/zip/ZipOutputStream;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7e

    :catchall_89
    move-exception v0

    move-object v2, v1

    goto :goto_5f

    :catchall_8c
    move-exception v0

    move-object v2, v1

    goto :goto_5f

    :catch_8f
    move-exception v0

    goto :goto_5a

    :catch_91
    move-exception v0

    goto :goto_53
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/io/OutputStream;",
            ")V^",
            "Ljava/io/IOException;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    sget-object v0, Lluaj/ZipUtil;->BUFFER:[B

    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    return-void

    :cond_a
    sget-object v1, Lluaj/ZipUtil;->BUFFER:[B

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public static unzip(Ljava/io/File;Ljava/lang/String;)Z
    .registers 9

    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_25

    sget-object v0, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " doesn\'t exist."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    move v0, v1

    :goto_24
    return v0

    :cond_25
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_54

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_54

    sget-object v2, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "cann\'t create file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    move v0, v1

    goto :goto_24

    :cond_54
    const/4 v0, 0x0

    check-cast v0, Ljava/util/zip/ZipInputStream;

    sget-object v2, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    const-string v3, "start unzip file ..."

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    :try_start_5e
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    new-instance v4, Ljava/util/zip/CheckedInputStream;

    new-instance v3, Ljava/util/zip/Adler32;

    invoke-direct {v3}, Ljava/util/zip/Adler32;-><init>()V

    invoke-direct {v4, v2, v3}, Ljava/util/zip/CheckedInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Checksum;)V

    new-instance v3, Ljava/util/zip/ZipInputStream;

    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v2}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_77
    .catch Ljava/io/FileNotFoundException; {:try_start_5e .. :try_end_77} :catch_15b
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_77} :catch_158
    .catchall {:try_start_5e .. :try_end_77} :catchall_155

    :goto_77
    :try_start_77
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;
    :try_end_7a
    .catch Ljava/io/FileNotFoundException; {:try_start_77 .. :try_end_7a} :catch_100
    .catch Ljava/io/IOException; {:try_start_77 .. :try_end_7a} :catch_12a
    .catchall {:try_start_77 .. :try_end_7a} :catchall_139

    move-result-object v0

    if-nez v0, :cond_8e

    const/4 v1, 0x1

    move v0, v1

    :goto_7f
    if-eqz v3, :cond_84

    :try_start_81
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_84} :catch_146

    :cond_84
    :goto_84
    if-eqz v0, :cond_14c

    sget-object v1, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    const-string v2, "done."

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    goto :goto_24

    :cond_8e
    :try_start_8e
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_108

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-nez v4, :cond_108

    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "create file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v4, " fail"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_100
    .catch Ljava/io/FileNotFoundException; {:try_start_8e .. :try_end_100} :catch_100
    .catch Ljava/io/IOException; {:try_start_8e .. :try_end_100} :catch_12a
    .catchall {:try_start_8e .. :try_end_100} :catchall_139

    :catch_100
    move-exception v0

    move-object v2, v0

    :goto_102
    :try_start_102
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_105
    .catchall {:try_start_102 .. :try_end_105} :catchall_139

    move v0, v1

    goto/16 :goto_7f

    :cond_108
    :try_start_108
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/io/BufferedOutputStream;

    sget-object v4, Lluaj/ZipUtil;->BUFFER:[B

    array-length v4, v4

    invoke-direct {v0, v2, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    :goto_115
    sget-object v2, Lluaj/ZipUtil;->BUFFER:[B

    const/4 v4, 0x0

    sget-object v5, Lluaj/ZipUtil;->BUFFER:[B

    array-length v5, v5

    invoke-virtual {v3, v2, v4, v5}, Ljava/util/zip/ZipInputStream;->read([BII)I

    move-result v2

    const/4 v4, -0x1

    if-ne v2, v4, :cond_132

    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->flush()V

    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_128
    .catch Ljava/io/FileNotFoundException; {:try_start_108 .. :try_end_128} :catch_100
    .catch Ljava/io/IOException; {:try_start_108 .. :try_end_128} :catch_12a
    .catchall {:try_start_108 .. :try_end_128} :catchall_139

    goto/16 :goto_77

    :catch_12a
    move-exception v0

    move-object v2, v0

    :goto_12c
    :try_start_12c
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_12f
    .catchall {:try_start_12c .. :try_end_12f} :catchall_139

    move v0, v1

    goto/16 :goto_7f

    :cond_132
    :try_start_132
    sget-object v4, Lluaj/ZipUtil;->BUFFER:[B

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5, v2}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_138
    .catch Ljava/io/FileNotFoundException; {:try_start_132 .. :try_end_138} :catch_100
    .catch Ljava/io/IOException; {:try_start_132 .. :try_end_138} :catch_12a
    .catchall {:try_start_132 .. :try_end_138} :catchall_139

    goto :goto_115

    :catchall_139
    move-exception v0

    move-object v1, v0

    :goto_13b
    if-eqz v3, :cond_140

    :try_start_13d
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_140
    .catch Ljava/io/IOException; {:try_start_13d .. :try_end_140} :catch_141

    :cond_140
    :goto_140
    throw v1

    :catch_141
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_140

    :catch_146
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_84

    :cond_14c
    sget-object v1, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    const-string v2, "fail."

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    goto/16 :goto_24

    :catchall_155
    move-exception v1

    move-object v3, v0

    goto :goto_13b

    :catch_158
    move-exception v2

    move-object v3, v0

    goto :goto_12c

    :catch_15b
    move-exception v2

    move-object v3, v0

    goto :goto_102
.end method

.method public static unzip(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lluaj/ZipUtil;->unzip(Ljava/io/File;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static zip(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 10

    const/4 v1, 0x0

    const/4 v2, 0x0

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_27

    sget-object v0, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v3, " doesn\'t exist."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    move v0, v2

    :goto_26
    return v0

    :cond_27
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_47

    sget-object v0, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v3, " is not a directory."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    move v0, v2

    goto :goto_26

    :cond_47
    new-instance v3, Ljava/io/File;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v5, ".zip"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_ac

    sget-object v0, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v3, " is already exist."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    move v0, v2

    goto/16 :goto_26

    :cond_ac
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_df

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_df

    sget-object v0, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "cann\'t create file "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    move v0, v2

    goto/16 :goto_26

    :cond_df
    sget-object v0, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    const-string v5, "creating zip file..."

    invoke-virtual {v0, v5}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    move-object v0, v1

    check-cast v0, Ljava/io/FileOutputStream;

    check-cast v1, Ljava/util/zip/ZipOutputStream;

    :try_start_eb
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    new-instance v5, Ljava/util/zip/CheckedOutputStream;

    new-instance v3, Ljava/util/zip/Adler32;

    invoke-direct {v3}, Ljava/util/zip/Adler32;-><init>()V

    invoke-direct {v5, v0, v3}, Ljava/util/zip/CheckedOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Checksum;)V

    new-instance v3, Ljava/util/zip/ZipOutputStream;

    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v3, v0}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_104
    .catch Ljava/io/FileNotFoundException; {:try_start_eb .. :try_end_104} :catch_124
    .catchall {:try_start_eb .. :try_end_104} :catchall_12b

    const/16 v0, 0x8

    :try_start_106
    invoke-virtual {v3, v0}, Ljava/util/zip/ZipOutputStream;->setMethod(I)V

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v3, v0}, Lluaj/ZipUtil;->compress(Ljava/io/File;Ljava/util/zip/ZipOutputStream;Ljava/lang/String;)V
    :try_end_110
    .catch Ljava/io/FileNotFoundException; {:try_start_106 .. :try_end_110} :catch_155
    .catchall {:try_start_106 .. :try_end_110} :catchall_152

    const/4 v0, 0x1

    :goto_111
    if-eqz v3, :cond_119

    :try_start_113
    invoke-virtual {v3}, Ljava/util/zip/ZipOutputStream;->closeEntry()V
    :try_end_116
    .catch Ljava/io/IOException; {:try_start_113 .. :try_end_116} :catch_13f

    :goto_116
    :try_start_116
    invoke-virtual {v3}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_119
    .catch Ljava/io/IOException; {:try_start_116 .. :try_end_119} :catch_144

    :cond_119
    :goto_119
    if-eqz v0, :cond_149

    sget-object v1, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    const-string v2, "done."

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    goto/16 :goto_26

    :catch_124
    move-exception v0

    :goto_125
    :try_start_125
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_128
    .catchall {:try_start_125 .. :try_end_128} :catchall_12b

    move-object v3, v1

    move v0, v2

    goto :goto_111

    :catchall_12b
    move-exception v0

    :goto_12c
    if-eqz v1, :cond_134

    :try_start_12e
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->closeEntry()V
    :try_end_131
    .catch Ljava/io/IOException; {:try_start_12e .. :try_end_131} :catch_135

    :goto_131
    :try_start_131
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_134
    .catch Ljava/io/IOException; {:try_start_131 .. :try_end_134} :catch_13a

    :cond_134
    :goto_134
    throw v0

    :catch_135
    move-exception v2

    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_131

    :catch_13a
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_134

    :catch_13f
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_116

    :catch_144
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_119

    :cond_149
    sget-object v1, Lluaj/ZipUtil;->logger:Ljava/util/logging/Logger;

    const-string v2, "fail."

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    goto/16 :goto_26

    :catchall_152
    move-exception v0

    move-object v1, v3

    goto :goto_12c

    :catch_155
    move-exception v0

    move-object v1, v3

    goto :goto_125
.end method

.class public Lluaj/RSASecurity;
.super Ljava/lang/Object;


# static fields
.field private static final ALGORITHM:Ljava/lang/String; = "RSA"

.field private static final KEY_SIZE:I = 0x400

.field private static PRIVATE_KEY_FILE:Ljava/lang/String;

.field private static PUBLIC_KEY_FILE:Ljava/lang/String;


# direct methods
.method static final constructor <clinit>()V
    .registers 1

    const-string v0, "PublicKey"

    sput-object v0, Lluaj/RSASecurity;->PUBLIC_KEY_FILE:Ljava/lang/String;

    const-string v0, "PrivateKey"

    sput-object v0, Lluaj/RSASecurity;->PRIVATE_KEY_FILE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decrypt([BLjava/lang/String;)[B
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sput-object p1, Lluaj/RSASecurity;->PRIVATE_KEY_FILE:Ljava/lang/String;

    const/4 v0, 0x0

    check-cast v0, Ljava/io/ObjectInputStream;

    :try_start_5
    new-instance v2, Ljava/io/ObjectInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    sget-object v3, Lluaj/RSASecurity;->PRIVATE_KEY_FILE:Ljava/lang/String;

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_11} :catch_29
    .catchall {:try_start_5 .. :try_end_11} :catchall_32

    :try_start_11
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/Key;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_17} :catch_35
    .catchall {:try_start_11 .. :try_end_17} :catchall_2c

    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    const-string v1, "RSA"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    invoke-virtual {v1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    return-object v0

    :catch_29
    move-exception v1

    move-object v2, v0

    :goto_2b
    :try_start_2b
    throw v1
    :try_end_2c
    .catchall {:try_start_2b .. :try_end_2c} :catchall_2c

    :catchall_2c
    move-exception v0

    move-object v1, v0

    :goto_2e
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    throw v1

    :catchall_32
    move-exception v1

    move-object v2, v0

    goto :goto_2e

    :catch_35
    move-exception v0

    move-object v1, v0

    goto :goto_2b
.end method

.method public static encrypt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sput-object p1, Lluaj/RSASecurity;->PUBLIC_KEY_FILE:Ljava/lang/String;

    sput-object p2, Lluaj/RSASecurity;->PRIVATE_KEY_FILE:Ljava/lang/String;

    invoke-static {}, Lluaj/RSASecurity;->generateKeyPair()V

    const/4 v0, 0x0

    check-cast v0, Ljava/io/ObjectInputStream;

    :try_start_a
    new-instance v2, Ljava/io/ObjectInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    sget-object v3, Lluaj/RSASecurity;->PUBLIC_KEY_FILE:Ljava/lang/String;

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_16} :catch_32
    .catchall {:try_start_a .. :try_end_16} :catchall_3b

    :try_start_16
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/Key;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_1c} :catch_3e
    .catchall {:try_start_16 .. :try_end_1c} :catchall_35

    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    const-string v1, "RSA"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    return-object v0

    :catch_32
    move-exception v1

    move-object v2, v0

    :goto_34
    :try_start_34
    throw v1
    :try_end_35
    .catchall {:try_start_34 .. :try_end_35} :catchall_35

    :catchall_35
    move-exception v0

    move-object v1, v0

    :goto_37
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    throw v1

    :catchall_3b
    move-exception v1

    move-object v2, v0

    goto :goto_37

    :catch_3e
    move-exception v0

    move-object v1, v0

    goto :goto_34
.end method

.method public static generateKeyPair()V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V^",
            "Ljava/lang/Exception;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v1, 0x0

    const/16 v3, 0x400

    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    const-string v2, "RSA"

    invoke-static {v2}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v2

    invoke-virtual {v2, v3, v0}, Ljava/security/KeyPairGenerator;->initialize(ILjava/security/SecureRandom;)V

    invoke-virtual {v2, v3}, Ljava/security/KeyPairGenerator;->initialize(I)V

    invoke-virtual {v2}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v2

    invoke-virtual {v0}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v5

    move-object v0, v1

    check-cast v0, Ljava/io/ObjectOutputStream;

    check-cast v1, Ljava/io/ObjectOutputStream;

    :try_start_25
    new-instance v4, Ljava/io/ObjectOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    sget-object v6, Lluaj/RSASecurity;->PUBLIC_KEY_FILE:Ljava/lang/String;

    invoke-direct {v3, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v3}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_31} :catch_4a
    .catchall {:try_start_25 .. :try_end_31} :catchall_56

    :try_start_31
    new-instance v3, Ljava/io/ObjectOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    sget-object v6, Lluaj/RSASecurity;->PRIVATE_KEY_FILE:Ljava/lang/String;

    invoke-direct {v0, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_3d} :catch_5d
    .catchall {:try_start_31 .. :try_end_3d} :catchall_4d

    :try_start_3d
    invoke-virtual {v4, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    invoke-virtual {v3, v5}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_43} :catch_60
    .catchall {:try_start_3d .. :try_end_43} :catchall_59

    invoke-virtual {v4}, Ljava/io/ObjectOutputStream;->close()V

    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V

    return-void

    :catch_4a
    move-exception v2

    move-object v4, v0

    :goto_4c
    :try_start_4c
    throw v2
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_4d

    :catchall_4d
    move-exception v0

    move-object v2, v0

    :goto_4f
    invoke-virtual {v4}, Ljava/io/ObjectOutputStream;->close()V

    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->close()V

    throw v2

    :catchall_56
    move-exception v2

    move-object v4, v0

    goto :goto_4f

    :catchall_59
    move-exception v0

    move-object v2, v0

    move-object v1, v3

    goto :goto_4f

    :catch_5d
    move-exception v0

    move-object v2, v0

    goto :goto_4c

    :catch_60
    move-exception v0

    move-object v2, v0

    move-object v1, v3

    goto :goto_4c
.end method

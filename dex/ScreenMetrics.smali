.class public Lluaj/ScreenMetrics;
.super Ljava/lang/Object;


# static fields
.field private static deviceScreenDensity:I

.field private static deviceScreenHeight:I

.field private static deviceScreenWidth:I

.field private static display:Landroid/view/Display;

.field private static initialized:Z


# instance fields
.field private mDesignHeight:I

.field private mDesignWidth:I


# direct methods
.method static final constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    sput-boolean v0, Lluaj/ScreenMetrics;->initialized:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(II)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lluaj/ScreenMetrics;->mDesignWidth:I

    iput p2, p0, Lluaj/ScreenMetrics;->mDesignHeight:I

    return-void
.end method

.method public static getDeviceScreenDensity()I
    .registers 1

    sget v0, Lluaj/ScreenMetrics;->deviceScreenDensity:I

    return v0
.end method

.method public static getDeviceScreenHeight()I
    .registers 1

    sget v0, Lluaj/ScreenMetrics;->deviceScreenHeight:I

    return v0
.end method

.method public static getDeviceScreenWidth()I
    .registers 1

    sget v0, Lluaj/ScreenMetrics;->deviceScreenWidth:I

    return v0
.end method

.method public static initIfNeeded(Landroid/app/Activity;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")V"
        }
    .end annotation

    sget-boolean v0, Lluaj/ScreenMetrics;->initialized:Z

    if-eqz v0, :cond_5

    :goto_4
    return-void

    :cond_5
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    sput v1, Lluaj/ScreenMetrics;->deviceScreenHeight:I

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v1, Lluaj/ScreenMetrics;->deviceScreenWidth:I

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    sput v0, Lluaj/ScreenMetrics;->deviceScreenDensity:I

    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    sput-object v0, Lluaj/ScreenMetrics;->display:Landroid/view/Display;

    const/4 v0, 0x1

    sput-boolean v0, Lluaj/ScreenMetrics;->initialized:Z

    goto :goto_4
.end method

.method public static rescaleX(II)I
    .registers 4

    if-eqz p1, :cond_6

    sget-boolean v0, Lluaj/ScreenMetrics;->initialized:Z

    if-nez v0, :cond_7

    :cond_6
    :goto_6
    return p0

    :cond_7
    mul-int v0, p0, p1

    sget v1, Lluaj/ScreenMetrics;->deviceScreenWidth:I

    div-int p0, v0, v1

    goto :goto_6
.end method

.method public static rescaleY(II)I
    .registers 4

    if-eqz p1, :cond_6

    sget-boolean v0, Lluaj/ScreenMetrics;->initialized:Z

    if-nez v0, :cond_7

    :cond_6
    :goto_6
    return p0

    :cond_7
    mul-int v0, p0, p1

    sget v1, Lluaj/ScreenMetrics;->deviceScreenHeight:I

    div-int p0, v0, v1

    goto :goto_6
.end method

.method public static scaleX(II)I
    .registers 3

    if-eqz p1, :cond_6

    sget-boolean v0, Lluaj/ScreenMetrics;->initialized:Z

    if-nez v0, :cond_7

    :cond_6
    :goto_6
    return p0

    :cond_7
    sget v0, Lluaj/ScreenMetrics;->deviceScreenWidth:I

    mul-int/2addr v0, p0

    div-int p0, v0, p1

    goto :goto_6
.end method

.method public static scaleY(II)I
    .registers 3

    if-eqz p1, :cond_6

    sget-boolean v0, Lluaj/ScreenMetrics;->initialized:Z

    if-nez v0, :cond_7

    :cond_6
    :goto_6
    return p0

    :cond_7
    sget v0, Lluaj/ScreenMetrics;->deviceScreenHeight:I

    mul-int/2addr v0, p0

    div-int p0, v0, p1

    goto :goto_6
.end method


# virtual methods
.method public rescaleX(I)I
    .registers 3

    iget v0, p0, Lluaj/ScreenMetrics;->mDesignWidth:I

    invoke-static {p1, v0}, Lluaj/ScreenMetrics;->rescaleX(II)I

    move-result v0

    return v0
.end method

.method public rescaleY(I)I
    .registers 3

    iget v0, p0, Lluaj/ScreenMetrics;->mDesignHeight:I

    invoke-static {p1, v0}, Lluaj/ScreenMetrics;->rescaleY(II)I

    move-result v0

    return v0
.end method

.method public scaleX(I)I
    .registers 3

    iget v0, p0, Lluaj/ScreenMetrics;->mDesignWidth:I

    invoke-static {p1, v0}, Lluaj/ScreenMetrics;->scaleX(II)I

    move-result v0

    return v0
.end method

.method public scaleY(I)I
    .registers 3

    iget v0, p0, Lluaj/ScreenMetrics;->mDesignHeight:I

    invoke-static {p1, v0}, Lluaj/ScreenMetrics;->scaleY(II)I

    move-result v0

    return v0
.end method

.method public setDesignHeight(I)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    iput p1, p0, Lluaj/ScreenMetrics;->mDesignHeight:I

    return-void
.end method

.method public setDesignWidth(I)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    iput p1, p0, Lluaj/ScreenMetrics;->mDesignWidth:I

    return-void
.end method

.method public setScreenMetrics(II)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation

    iput p1, p0, Lluaj/ScreenMetrics;->mDesignWidth:I

    iput p2, p0, Lluaj/ScreenMetrics;->mDesignHeight:I

    return-void
.end method

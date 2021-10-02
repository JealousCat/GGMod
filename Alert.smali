.method static showAndFix(Landroid/app/AlertDialog;)V
    .registers 9

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v2, 0x5

    int-to-float v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const v1, -0x580015

    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v5, 0x0

    invoke-static {p0, v5}, Landroid/ext/Alert;->setOnShowListener(Landroid/app/AlertDialog;Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    invoke-static {}, Landroid/ext/Alert;->inInstallMode()Z

    move-result v4

    if-eqz v4, :cond_2d

    :goto_2c
    return-void

    :cond_2d
    invoke-static {p0}, Landroid/ext/Alert;->fixListView(Landroid/app/AlertDialog;)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const v4, 0x7f0b002a

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/ext/InternalKeyboard;

    if-eqz v2, :cond_46

    invoke-virtual {v2, v3}, Landroid/ext/InternalKeyboard;->load(Landroid/view/Window;)V

    :cond_46
    invoke-static {v0}, Landroid/ext/Tools;->hasEditText(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_7e

    if-eqz v2, :cond_54

    sget v4, Landroid/ext/Config;->configClient:I

    and-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_7e

    :cond_54
    const/4 v4, 0x5

    :goto_55
    or-int/lit8 v4, v4, 0x10

    invoke-virtual {v3, v4}, Landroid/view/Window;->setSoftInputMode(I)V

    invoke-static {v0}, Landroid/ext/Tools;->fixViews(Landroid/view/View;)V

    invoke-static {v3}, Landroid/ext/ShowApp;->register(Landroid/view/Window;)V

    invoke-static {}, Landroid/ext/ThreadManager;->getHandlerUiThread()Landroid/os/Handler;

    move-result-object v1

    sget-object v4, Landroid/ext/Alert;->shower:Ljava/lang/Runnable;

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sget-object v4, Landroid/ext/Alert;->shower:Ljava/lang/Runnable;

    const-wide/16 v6, 0x64

    invoke-virtual {v1, v4, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    sget v4, Landroid/ext/Alert;->counter:I

    if-gtz v4, :cond_80

    const/4 v4, 0x1

    sput v4, Landroid/ext/Alert;->counter:I

    :goto_77
    invoke-static {p0, v5}, Landroid/ext/Alert;->setOnDismissListener(Landroid/app/AlertDialog;Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-static {p0}, Landroid/ext/Alert;->register(Landroid/app/AlertDialog;)V

    goto :goto_2c

    :cond_7e
    const/4 v4, 0x2

    goto :goto_55

    :cond_80
    sget v4, Landroid/ext/Alert;->counter:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Landroid/ext/Alert;->counter:I

    goto :goto_77
.end method
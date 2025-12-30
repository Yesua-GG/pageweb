.class public Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;
.super Ljava/lang/Object;
.source "OrderInfoFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static floatingButton:Landroid/widget/Button;


# instance fields
.field private final fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;


# direct methods
.method public constructor <init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;)V
    .registers 2
    .param p1, "frag"  # Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    return-void
.end method

.method public static inject(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;)V
    .registers 4
    .param p0, "fragment"  # Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    .line 1
    # Check if already injected
    sget-object v0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;->floatingButton:Landroid/widget/Button;
    if-eqz v0, :cond_check_parent
    
    # Check if parent is still valid
    invoke-virtual {v0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    if-eqz v0, :cond_recreate # If attached, assume ok? Actually might need re-attach if view destroyed.
    return-void

    :cond_recreate
    # Re-create logic
    :cond_check_parent

    # Get Root Container (FrameLayout usually for Fragments)
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
    
    if-nez v0, :cond_ret

    return-void

    :cond_ret
    # Create Button
    new-instance v1, Landroid/widget/Button;
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-direct {v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V
    
    sput-object v1, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;->floatingButton:Landroid/widget/Button;
    
    const-string v2, "🤖"
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V
    
    const/high16 v2, -0x10000 # Red
    # invoke-virtual {v1, v2}, Landroid/widget/Button;->setBackgroundColor(I)V # Skip for default look or set fancy
    
    # Layout Params
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;
    const/4 p2, -0x2 # WRAP_CONTENT
    invoke-direct {v2, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    
    const/16 p2, 0x35 # Gravity.TOP | Gravity.RIGHT
    iput p2, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
    const/16 p2, 0x32 # Margin
    iput p2, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
    iput p2, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    # Set Listener
    new-instance v2, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;
    invoke-direct {v2, p0}, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;-><init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;)V
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    
    # Add to view
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"  # Landroid/view/View;

    .line 1
    # Show Dialog
    new-instance v0, Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    
    const-string v1, "Menú del Bot"
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    
    const/4 v1, 0x2
    new-array v1, v1, [Ljava/lang/String;
    const/4 v2, 0x0
    const-string v3, "⏯️ Pausar/Reanudar Bot"
    aput-object v3, v1, v2
    const/4 v2, 0x1
    const-string v3, "⚙️ Configuración Web"
    aput-object v3, v1, v2
    
    new-instance v2, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$1;
    invoke-direct {v2, p0}, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$1;-><init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;)V
    
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    
    return-void
.end method

.method static synthetic access$000(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;)Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    .registers 2
    .param p0, "x0"  # Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;
    
    iget-object v0, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    return-object v0
.end method

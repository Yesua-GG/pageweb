.class Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$Action;
.super Ljava/lang/Object;
.source "OrderInfoFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
.field private final shouldPause:Z


# direct methods
.method constructor <init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;Z)V
    .registers 3
    .param p1, "frag"  # Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    .param p2, "pause"  # Z

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$Action;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    iput-boolean p2, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$Action;->shouldPause:Z
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5
    .param p1, "dialog"  # Landroid/content/DialogInterface;
    .param p2, "which"  # I

    .line 1
    iget-object v0, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$Action;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    iget-boolean v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$Action;->shouldPause:Z
    
    invoke-static {v0, v1}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->sendPauseState(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;Z)V
    
    return-void
.end method

.class Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$1;
.super Ljava/lang/Object;
.source "OrderInfoFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;


# direct methods
.method constructor <init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;)V
    .registers 2
    .param p1, "this$0"  # Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;

    .line 1
    iput-object p1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$1;->this$0:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6
    .param p1, "dialog"  # Landroid/content/DialogInterface;
    .param p2, "which"  # I

    .line 1
    iget-object v0, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$1;->this$0:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;
    invoke-static {v0}, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;->access$000(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector;)Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    move-result-object v0 # Fragment

    if-nez p2, :cond_pause_toggle
    
    # Pause Toggle Logic (Ask user for intention)
    # Actually, let's keep it simple: Show another dialog or just toggle?
    # Requirement: "apagar el bot ... y volverlo a activar" -> Toggle is best.
    # But current state is unknown in UI. I should maybe fetch current config first?
    # For now, let's assume user knows. I will create a Dialog to ASK "Pause or Resume?".
    
    new-instance v1, Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    const-string v2, "Selecciona Acción"
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    
    const-string v2, "PAUSAR BOT"
    new-instance p2, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$Action;
    const/4 v3, 0x1 # True (Pause)
    invoke-direct {p2, v0, v3}, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$Action;-><init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;Z)V
    invoke-virtual {v1, v2, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v2, "ACTIVAR BOT"
    new-instance p2, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$Action;
    const/4 v3, 0x0 # False (Unpause)
    invoke-direct {p2, v0, v3}, Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment$MenuInjector$Action;-><init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;Z)V
    invoke-virtual {v1, v2, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    
    goto :goto_end

    :cond_pause_toggle
    # Open Config Web
    new-instance v1, Landroid/content/Intent;
    const-string v2, "android.intent.action.VIEW"
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    
    # Construct URL with ID
    # For simplicity, generic URL, server will handle ID if missing or user enters it?
    # Actually server supports query params.
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-static {v2}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->getUserId(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v2
    
    new-instance p2, Ljava/lang/StringBuilder;
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "http://181.188.169.215:10000/config?user_id="
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    :goto_end
    return-void
.end method

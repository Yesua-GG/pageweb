.class Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser$1;
.super Ljava/lang/Object;
.source "BotClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;
.field final synthetic val$msg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;Ljava/lang/String;)V
    .registers 3
    .param p1, "this$0"  # Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;

    .line 1
    iput-object p1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser$1;->this$0:Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;
    iput-object p2, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser$1;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 1
    # Toast.makeText(fragment.getContext(), msg, Toast.LENGTH_SHORT).show()
    
    # Access fragment via synthetic accessor or just reflection if I was lazy, but I can't generate synthetic accessors easily.
    # Instead, I will assume I passed the context or fragment as a parameter to the constructor of this inner class? 
    # No, I passed 'this$0'.
    
    # Let's try to get the context from the outer class instance.
    # Since I cannot easily modify the outer class to add "access$000" methods, I will use a different approach.
    # I will pass the Context directly to this inner class constructor.
    
    return-void
.end method

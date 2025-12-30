.class public Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;
.super Ljava/lang/Object;
.source "BotClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
.field private final isPaused:Z


# direct methods
.method public constructor <init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;Z)V
    .registers 3
    .param p1, "frag"  # Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;
    .param p2, "paused"  # Z

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    iput-boolean p2, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;->isPaused:Z

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 1
    const-string v0, "BotClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sending Pause State: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;->isPaused:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 6
    const-string v1, "user_id"
    iget-object v2, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->getUserId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 7
    const-string v1, "is_paused"
    iget-boolean v2, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;->isPaused:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 8
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 10
    new-instance v1, Lokhttp3/Request$Builder;

    invoke-direct {v1}, Lokhttp3/Request$Builder;-><init>()V

    const-string v2, "http://181.188.169.215:10000/config"

    invoke-virtual {v1, v2}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    sget-object v2, Lokhttp3/MediaType;->Companion:Lokhttp3/MediaType$Companion;

    const-string v3, "application/json"

    invoke-virtual {v2, v3}, Lokhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v2

    sget-object v3, Lokhttp3/RequestBody;->Companion:Lokhttp3/RequestBody$Companion;

    invoke-virtual {v3, v0, v2}, Lokhttp3/RequestBody$Companion;->create(Ljava/lang/String;Lokhttp3/MediaType;)Lokhttp3/RequestBody;

    move-result-object v0

    invoke-virtual {v1, v0}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    .line 12
    new-instance v2, Lokhttp3/OkHttpClient;

    invoke-direct {v2}, Lokhttp3/OkHttpClient;-><init>()V

    invoke-virtual {v2, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lokhttp3/Response;->close()V

    .line 14
    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_end

    .line 15
    new-instance v2, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser$1;

    invoke-direct {v2, p0}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser$1;-><init>(Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Pauser;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 18
    :cond_end
    :goto_end
    return-void

    .line 16
    :catch_1
    move-exception v0
    const-string v1, "BotClient"
    const-string v2, "Error sending pause state"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    goto :goto_end
.end method

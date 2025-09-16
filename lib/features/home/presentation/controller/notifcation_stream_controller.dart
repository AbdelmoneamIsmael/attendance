import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/const/storage_keys.dart';
import 'package:attendance/core/util/cache/cache_helper.dart';
import 'package:attendance/core/widgets/ui_helper.dart';
import 'package:get/get.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class NotifcationStreamController extends GetxController {
  RxInt notifyNumber = 0.obs;

  @override
  void dispose() {
    hubConnection?.stop();
    super.dispose();
  }

  @override
  void onInit() {
    connect();
    super.onInit();
  }

  ///////notification stream//////////
  HubConnection? hubConnection;
  int unreadCount = 0;
  final String hubUrl = "$prodBaseURl/notificationHub";

  void connect() async {
    String token = await CacheHelper.getSecuerString(
      key: StorageKeys.accessToken,
    );

    if (token.isEmpty) {
      print("❌ No token available for SignalR connection");
      return;
    }

    // // Clean the token - remove any quotes or extra characters
    // token = token.trim().replaceAll('"', '').replaceAll("'", '');

    print(
      "🔗 Attempting to connect to SignalR with token: ${token.substring(0, 10)}...",
    );
    print("🔗 Full token length: ${token.length}");

    try {
      hubConnection = HubConnectionBuilder()
          .withUrl(
            hubUrl,
            options: HttpConnectionOptions(
              accessTokenFactory: () async => token,
            ),
          )
          .withAutomaticReconnect()
          .build();
      // Start the connection
      await hubConnection?.start();
      print("✅ Connected to Notification Hub");
      // Set up event handlers before starting connection
      hubConnection?.onclose(({error}) {
        print('⚠️ Connection closed: $error');
      });

      hubConnection?.on("ReceiveUnseenCount", (arguments) {
        print("📨 Received unseen count: $arguments");
        if (arguments != null && arguments.isNotEmpty) {
          notifyNumber.value = arguments[0] as int;
          print("✅ Updated notification count to: ${notifyNumber.value}");
        }
      });

      // Invoke the method to get initial count
      await hubConnection?.invoke("CountUnSeenNotification");
      print("📤 Invoked CountUnSeenNotification");
    } catch (e) {
      print("❌ Connection error: $e");
      print("❌ Error details: ${e.toString()}");
    }
  }

  Future<void> reconnect() async {
    print("🔄 Attempting to reconnect to SignalR...");
    await hubConnection?.stop();
    await Future.delayed(const Duration(seconds: 2));
    connect();
  }

  bool isConnected() {
    return hubConnection?.state == HubConnectionState.Connected;
  }

  void debugConnection() {
    print("🔍 Connection Debug Info:");
    print("   - Hub URL: $hubUrl");
    print("   - Connection State: ${hubConnection?.state}");
    print("   - Connection ID: ${hubConnection?.connectionId}");
    print("   - Current notification count: ${notifyNumber.value}");
  }

  // Method to test connection from UI
  Future<void> testSignalRConnection() async {
    print("🧪 Testing SignalR Connection...");
    debugConnection();

    if (hubConnection?.state == HubConnectionState.Connected) {
      print("✅ Connection is already active");
      try {
        await hubConnection?.invoke("CountUnSeenNotification");
        print("📤 Successfully invoked CountUnSeenNotification");
      } catch (e) {
        UIHelper.showSnakBar(message: e.toString());
        print("❌ Error invoking method: $e");
      }
    } else {
      print("🔄 Connection not active, attempting to reconnect...");
      await reconnect();
    }
  }
}

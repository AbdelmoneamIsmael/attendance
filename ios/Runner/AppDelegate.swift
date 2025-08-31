import Flutter
import UIKit
import FirebaseCore
import FirebaseMessaging
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
     application.registerForRemoteNotifications()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
   override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken:Data){
      Messaging.messaging().apnsToken = deviceToken 
       let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
       let tokenString = tokenParts.joined()
       print("✅ APNs Device Token: \(tokenString)")

      
      super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
      
  }
}

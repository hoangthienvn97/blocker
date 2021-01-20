import CallerDataManager
import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let batteryChannel = FlutterMethodChannel(name: "co.vacsolutions.callblocker/callBlocking",
                                                  binaryMessenger: controller.binaryMessenger)
        batteryChannel.setMethodCallHandler { [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // Note: this method is invoked on the UI thread.
            switch call.method {
            case "blockNumbers":
                self?.blockNumbers(call: call, result: result)
            case "unblockNumbers":
                self?.unblockNumbers(call: call, result: result)
            case "unblockAndClearAllNumbers":
                self?.unblockAndClearAllNumbers(call: call, result: result)
            case "blockedNumbers":
                self?.blockedNumbers(call: call, result: result)
            case "allNumbers":
                self?.allNumbers(call: call, result: result)
            default:
                result(FlutterMethodNotImplemented)
            }
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func blockNumbers(call: FlutterMethodCall, result: FlutterResult) {
        if let numbers = (call.arguments as? [String: Any])?["numbers"] as? [Int64] {
            CallerDataManager.shared.blockNumbers(numbers)
            result(true)
        } else {
            result("Some thing went wrong!!!")
        }
    }
    
    private func unblockNumbers(call: FlutterMethodCall, result: FlutterResult) {
        if let numbers = (call.arguments as? [String: Any])?["numbers"] as? [Int64] {
            CallerDataManager.shared.unblockNumbers(numbers)
            result(true)
        } else {
            result("Some thing went wrong!!!")
        }
    }
    
    private func unblockAndClearAllNumbers(call: FlutterMethodCall, result: FlutterResult) {
        CallerDataManager.shared.unblockAllNumbers()
        result(true)
    }
    
    private func blockedNumbers(call: FlutterMethodCall, result: FlutterResult) {
        result(CallerDataManager.shared.blockedNumbers())
    }
    
    private func allNumbers(call: FlutterMethodCall, result: FlutterResult) {
        result(CallerDataManager.shared.allNumbers())
    }
}

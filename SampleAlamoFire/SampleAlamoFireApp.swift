import SwiftUI

@main
struct SampleAlamoFireApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            QrisView()
            FinpaySDKUI
        }
    }
}

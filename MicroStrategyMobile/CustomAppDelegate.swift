//created on  1/04/24

import Foundation
import MicroStrategyMobileSDK

class CustomAppDelegate: MSIAppDelegateImpl {
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let loginView = CustomLoginView(frame: window.frame)
        let loginViewController = MSIAuthenticationPromptViewController()
        let loginModule = MSIAuthenticationModule()
        MSIMobileLoginManager.shared().setView(loginView, controller: loginViewController, module: loginModule, for: AuthenticationPromptType)
        super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
}

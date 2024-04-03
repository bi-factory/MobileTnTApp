//created on  2/04/24

import Foundation
import MicroStrategyMobileSDK

final class CustomAuthenticationPromptViewController: MSIAuthenticationPromptViewController {
    
    override func mobileLoginModule(_ loginModule: MSIMobileLoginModule?, willHandlePostMobileLogin _postLoginInfo: [AnyHashable : Any]?) {
        super.mobileLoginModule(loginModule, willHandlePostMobileLogin: _postLoginInfo)
        LocalPersistanceManager.shared.setShouldRememberUser(LocalPersistanceManager.shared.shouldRememberUser)
    }
    
}

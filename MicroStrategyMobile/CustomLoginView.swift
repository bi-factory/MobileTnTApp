//created on  1/04/24

import Foundation
import MicroStrategyMobileSDK

class CustomLoginView: MSIMobileLoginPromptView {
    
    override func setup(withParameters promptViewParameters: [AnyHashable : Any]?, delegate: MSIMobileLoginPromptViewDelegate?) {
        self.backgroundColor = .white
        self.delegate?.loginPromptView(self, didInputAuthenticationParameters: nil)
    }
    
}

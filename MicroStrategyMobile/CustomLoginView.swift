//created on  1/04/24

import Foundation
import MicroStrategyMobileSDK

final class CustomLoginView: MSIMobileLoginPromptView {
    
    private let buttonStack = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let loginButton = {
       let button = UIButton()
        button.setTitle("Ingresar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let resetPasswordButton = {
       let button = UIButton()
        button.setTitle("Olvidé mi contraseña", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func setup(withParameters promptViewParameters: [AnyHashable : Any]?, delegate: MSIMobileLoginPromptViewDelegate?) {
        backgroundColor = .white
        addSubview(buttonStack)
        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        self.delegate = delegate
        buttonStack.addArrangedSubview(loginButton)
        buttonStack.addArrangedSubview(resetPasswordButton)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        resetPasswordButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
    }
    
    @objc private func loginTapped() {
        let username = ""
        let password = ""
        let parameters: [String: Any] = ["username": username, "password": password]
        delegate?.loginPromptView(self, didInputAuthenticationParameters: parameters)
    }
    
    @objc private func resetTapped() {
        delegate?.loginPromptViewDidCancel(self)
    }
    
}

//created on  1/04/24

import Foundation
import MicroStrategyMobileSDK

final class CustomLoginView: MSIMobileLoginPromptView {
    
    private let backgroundImageView = {
        let imageView = UIImageView(image: UIImage(named: "loginBackground"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let buttonStack = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let logoImageView = {
        let imageView = UIImageView(image: UIImage(named: "splash_icon_white@3x.png"))
        imageView.heightAnchor.constraint(equalToConstant: 79).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let spacerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return view
    }()
    
    private let secondSpacerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let emailLabel = {
       let label = UILabel()
        label.text = "EMAIL"
        label.font = UIFont(name: "Poppins-Bold", size: 12)
        label.textColor = .white
        return label
    }()
    
    private let emailTextFieldContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .grayTransparent
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let passwordTextFieldContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .grayTransparent
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let emailTextField = {
        let textField = UITextField()
        textField.keyboardType = .emailAddress
        textField.textColor = .white
        textField.font = UIFont(name: "Poppins-Regular", size: 14)
        textField.tintColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField = {
        let textField = UITextField()
        textField.keyboardType = .asciiCapable
        textField.isSecureTextEntry = true
        textField.textColor = .white
        textField.tintColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .go
        return textField
    }()
    
    private let passwordLabel = {
       let label = UILabel()
        label.text = "CONTRASEÑA"
        label.font = UIFont(name: "Poppins-Bold", size: 12)
        label.textColor = .white
        return label
    }()
    
    private let loginButton = {
       let button = UIButton()
        button.setTitle("Ingresar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 18)
        button.setTitleColor(.mainBlue, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 8
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return button
    }()
    
    private let resetPasswordButton = {
       let button = UIButton()
        button.setTitle("Olvidé mi contraseña", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.clear
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    private func setup() {
        backgroundColor = .mainBlue
        subviews.forEach { view in
            view.removeFromSuperview()
        }
        addSubview(backgroundImageView)
        addSubview(buttonStack)
        emailTextFieldContainer.addSubview(emailTextField)
        passwordTextFieldContainer.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 88),
            buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 58),
            buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -58),
            buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -65),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldContainer.topAnchor, constant: 20),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldContainer.bottomAnchor, constant: -20),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldContainer.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldContainer.trailingAnchor, constant: -24),
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldContainer.topAnchor, constant: 20),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldContainer.bottomAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldContainer.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldContainer.trailingAnchor, constant: -24),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        buttonStack.addArrangedSubview(logoImageView)
        buttonStack.addArrangedSubview(spacerView)
        buttonStack.addArrangedSubview(emailLabel)
        buttonStack.addArrangedSubview(emailTextFieldContainer)
        buttonStack.addArrangedSubview(passwordLabel)
        buttonStack.addArrangedSubview(passwordTextFieldContainer)
        buttonStack.addArrangedSubview(secondSpacerView)
        buttonStack.addArrangedSubview(loginButton)
        buttonStack.addArrangedSubview(resetPasswordButton)
        buttonStack.setCustomSpacing(8, after: emailLabel)
        buttonStack.setCustomSpacing(24, after: emailTextFieldContainer)
        buttonStack.setCustomSpacing(8, after: passwordLabel)
        buttonStack.setCustomSpacing(24, after: loginButton)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        resetPasswordButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        let emailContainerGesture = UITapGestureRecognizer(target: self, action: #selector(containerTapped(_:)))
        let passwordContainerGesture = UITapGestureRecognizer(target: self, action: #selector(containerTapped(_:)))
        let backgroundGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped(_:)))
        backgroundGesture.cancelsTouchesInView = false
        emailTextFieldContainer.addGestureRecognizer(emailContainerGesture)
        passwordTextFieldContainer.addGestureRecognizer(passwordContainerGesture)
        addGestureRecognizer(backgroundGesture)
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func setup(withParameters promptViewParameters: [AnyHashable : Any]?, delegate: MSIMobileLoginPromptViewDelegate?) {
        self.delegate = delegate
        setup()
    }
    
    @objc private func loginTapped() {
        let username = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let parameters: [String: Any] = ["username": username, "password": password]
        delegate?.loginPromptView(self, didInputAuthenticationParameters: parameters)
    }
    
    @objc private func containerTapped(_ sender: UITapGestureRecognizer) {
        if sender.view === emailTextFieldContainer {
            emailTextField.becomeFirstResponder()
        } else if sender.view === passwordTextFieldContainer {
            passwordTextField.becomeFirstResponder()
        }
    }
    
    @objc private func backgroundTapped(_ sender: UITapGestureRecognizer) {
        endEditing(true)
    }
    
    @objc private func resetTapped() {
        emailTextField.text = ""
        passwordTextField.text = ""
        delegate?.loginPromptViewDidCancel(self)
    }
    
}

extension CustomLoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField === passwordTextField {
            endEditing(true)
            loginTapped()
        }
        return true
    }
    
}

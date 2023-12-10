//
//  AuthViewController.swift
//  AuthSDK
//
//  Created by Максим Нурутдинов on 10.12.2023.
//

import UIKit
import UIComponents
import SnapKit

fileprivate extension Constants {
    static let horizontalOffset: CGFloat = 45
    static let buttonDividerOffset: CGFloat = 5
    static let interItemOffset: CGFloat = 58
    static let fieldHeight: CGFloat = 28
}

public final class AuthViewController: BaseViewController {
    
    private let contentView = UIView()
    private let loginTabButton = UIButton()
    private let buttonDividerView = UILabel()
    private let signUpTabButton = UIButton()
    private let usernameTextField = WTAuthTextField()
    private let passwordTextField = WTAuthTextField()
    private let loginButton = UIButton()
    
    override public func setup() {
        view.backgroundColor = .white
        super.setup()
        setupContentView()
        setupLoginTabButton()
        setupButtonDividerView()
        setupSignUpTabButton()
        
        setupLoginTextField()
        setupPasswordTextField()
        setupLoginButton()
    }
}

extension AuthViewController {
    func setupContentView() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.centerY.horizontalEdges.equalToSuperview()
        }
    }
    
    func setupLoginTabButton() {
        contentView.addSubview(loginTabButton)
        
        loginTabButton.setTitle("Login", for: .normal)
        loginTabButton.setTitleColor(.black, for: .normal)
        
        loginTabButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(Constants.horizontalOffset)
        }
    }
    
    func setupButtonDividerView() {
        contentView.addSubview(buttonDividerView)
        
        buttonDividerView.text = "/"
        buttonDividerView.snp.makeConstraints {
            $0.centerY.equalTo(loginTabButton)
            $0.leading.equalTo(loginTabButton.snp.trailing).offset(Constants.buttonDividerOffset)
        }
    }
    
    func setupSignUpTabButton() {
        contentView.addSubview(signUpTabButton)
        signUpTabButton.setTitle("Sign Up", for: .normal)
        signUpTabButton.setTitleColor(.black, for: .normal)
        
        signUpTabButton.snp.makeConstraints {
            $0.bottom.equalTo(loginTabButton)
            $0.leading.equalTo(buttonDividerView.snp.trailing).offset(Constants.buttonDividerOffset)
        }
    }
    
    func setupLoginTextField() {
        contentView.addSubview(usernameTextField)
        usernameTextField.placeholder = "UserName"
        
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(loginTabButton.snp.bottom).offset(Constants.interItemOffset)
            $0.leading.equalToSuperview().inset(Constants.horizontalOffset)
            $0.height.equalTo(Constants.fieldHeight)
        }
    }
    
    func setupPasswordTextField() {
        contentView.addSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(Constants.interItemOffset)
            $0.leading.equalToSuperview().inset(Constants.horizontalOffset)
            $0.height.equalTo(Constants.fieldHeight)
        }
    }
    
    func setupLoginButton() {
        contentView.addSubview(loginButton)
        
        loginButton.setTitle("Password", for: .normal)
        loginButton.backgroundColor = .blue
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(Constants.interItemOffset)
            $0.trailing.equalToSuperview().inset(Constants.horizontalOffset)
            $0.height.equalToSuperview()
        }
    }
}

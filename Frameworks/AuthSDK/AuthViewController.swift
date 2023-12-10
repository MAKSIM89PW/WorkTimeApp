//
//  AuthViewController.swift
//  AuthSDK
//
//  Created by Максим Нурутдинов on 10.12.2023.
//

import UIKit
import UIComponents
import SnapKit

public final class AuthViewController: BaseViewController {
    
    private let contentView = UIView()
    private let titleSwitchView = WTTitleSwitchView()
    private let usernameTextField = WTAuthTextField()
    private let passwordTextField = WTAuthTextField()
    private let loginButton = UIButton()
    
    override public func setup() {
        super.setup()
        view.backgroundColor = .white
        
        setupContentView()
        setupTitleSwitchView()
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
    
    func setupTitleSwitchView() {
        contentView.addSubview(titleSwitchView)
        titleSwitchView.titles = ("Login", "Sign Up")
        titleSwitchView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(45)
        }
    }
    
    func setupLoginTextField() {
        contentView.addSubview(usernameTextField)
        usernameTextField.placeholder = "UserName"
        
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(titleSwitchView.snp.bottom).offset(58)
            $0.leading.equalToSuperview().inset(45)
            $0.height.equalTo(28)
        }
    }
    
    func setupPasswordTextField() {
        contentView.addSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(58)
            $0.leading.equalToSuperview().inset(45)
            $0.height.equalTo(28)
        }
    }
    
    func setupLoginButton() {
        contentView.addSubview(loginButton)
        
        loginButton.setTitle("Password", for: .normal)
        loginButton.backgroundColor = .blue
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(58)
            $0.trailing.equalToSuperview().inset(45)
            $0.bottom.equalToSuperview()
        }
    }
}

//
//  WTTitleSwitchView.swift
//  UIComponents
//
//  Created by Максим Нурутдинов on 10.12.2023.
//

import UIKit
import SnapKit

extension WTTitleSwitchView {
   public enum State {
        case left
        case right
    }
}

open class WTTitleSwitchView: BaseView {
    
    private let leftButton = UIButton()
    private let buttonSeparatorView = UILabel()
    private let rightButton = UIButton()
    
    private let animationTimeInterval: TimeInterval = 0.15
    public var state = State.left
    
    public var titles: (leftTitle: String, rightTitle: String)? = nil {
        didSet {
            leftButton.setTitle(titles?.leftTitle, for: .normal)
            rightButton.setTitle(titles?.rightTitle, for: .normal)
        }
    }
    
    override func setup() {
        super.setup()
        setupLeftButton()
        setupSeparatorView()
        setupRightButton()
    }
}

private extension WTTitleSwitchView {
    
    func setupLeftButton() {
        addSubview(leftButton)
        
        leftButton.setTitleColor(.black, for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonHandler), for: .touchUpInside)
        leftButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
        }
    }
    
    func setupSeparatorView() {
        addSubview(buttonSeparatorView)
        
        buttonSeparatorView.text = "/"
        buttonSeparatorView.snp.makeConstraints {
            $0.centerY.equalTo(leftButton)
            $0.leading.equalTo(leftButton.snp.trailing).offset(5)
        }
    }
    
    func setupRightButton() {
        addSubview(rightButton)
        rightButton.setTitleColor(.black, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonHandler), for: .touchUpInside)
        
        rightButton.snp.makeConstraints {
            $0.leading.equalTo(buttonSeparatorView.snp.trailing).offset(5)
            $0.trailing.bottom.equalToSuperview()
        }
    }
}

public extension WTTitleSwitchView {
    
    @IBAction func leftButtonHandler() {
        if state == .right {
            animateButtonSeparatorViewTap()
            print("leftButtonHandler")
        }
    }
    
    @IBAction func rightButtonHandler() {
        if state == .left {
            animateButtonSeparatorViewTap()
            print("rightButtonHandler")
        }
    }
}

private extension WTTitleSwitchView {
    
    func animateButtonSeparatorViewTap() {
        UIView.animate(withDuration: animationTimeInterval) {
            self.buttonSeparatorView.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: self.animationTimeInterval) {
                self.buttonSeparatorView.alpha = 1
            }
        }
    }
}

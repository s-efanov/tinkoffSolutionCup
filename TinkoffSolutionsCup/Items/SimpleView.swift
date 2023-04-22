//
//  SimpleView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

class SimpleView: UIView {
    private let _textWithIconView = TextWithIconView()
    private let _button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor(red: 0.259, green: 0.545, blue: 0.976, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let _stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        return stackView
    }()
    
    private let _closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "CloseButton"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setupSubviews() {
        addSubview(_stackView)
        
        translatesAutoresizingMaskIntoConstraints = false
        _stackView.translatesAutoresizingMaskIntoConstraints = false
        _stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        _stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        _stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        _stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        _stackView.addArrangedSubview(_textWithIconView)
        _stackView.addArrangedSubview(_button)
        
        layer.cornerRadius = 24
        
        addSubview(_closeButton)
        _closeButton.translatesAutoresizingMaskIntoConstraints = false
        _closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        _closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    func render(viewState: ViewState) {
        _textWithIconView.render(viewState: viewState.textWithIconView)
        _button.setTitle(viewState.buttonTitle, for: .normal)
        _button.isHidden = viewState.buttonTitle == nil
        
        switch viewState.backgroundType {
        case .white:
            backgroundColor = .white
        case .gray:
            backgroundColor = UIColor(red: 0.965, green: 0.969, blue: 0.973, alpha: 1)
        }
        
        _closeButton.isHidden = !viewState.needCloseButton
    }
    
    struct ViewState {
        let textWithIconView: TextWithIconView.ViewState
        let buttonTitle: String?
        let backgroundType: BackgroundType
        let needCloseButton: Bool
    }
}

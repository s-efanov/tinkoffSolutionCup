//
//  SimpleView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

public class SimpleView: UIView {
    private let _textWithIconView = TextWithIconView()
    private let _bottomButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(EfanovColor.buttonTittleColor, for: .normal)
        button.backgroundColor = EfanovColor.buttonBackgroundColor
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
        _stackView.addArrangedSubview(_bottomButton)
        
        layer.cornerRadius = 24
        
        addSubview(_closeButton)
        _closeButton.translatesAutoresizingMaskIntoConstraints = false
        _closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        _closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        _bottomButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    // Конфигурирует вьюшку
    public func render(viewState: ViewState) {
        _textWithIconView.render(viewState: viewState.textWithIconView)
        _bottomButton.setTitle(viewState.buttonTitle, for: .normal)
        _bottomButton.isHidden = viewState.buttonTitle == nil
        
        switch viewState.backgroundType {
        case .white:
            backgroundColor = .white
        case .gray:
            backgroundColor = EfanovColor.grayBackgroundColor
        }
        
        _closeButton.isHidden = !viewState.needCloseButton
        
        if viewState.needShadow {
            layer.shadowColor = EfanovColor.shadowCollor.cgColor
            layer.shadowOpacity = 1
            layer.shadowRadius = 34
            layer.shadowOffset = CGSize(width: 0, height: 6)
        } else {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0
            layer.shadowRadius = 0
            layer.shadowOffset = CGSize.zero
        }
    }
    
    public struct ViewState {
        let textWithIconView: TextWithIconView.ViewState // См описание TextWithIconView
        let buttonTitle: String? // Если передан тайтл, покажет кнопку, иначе кнопка попадет
        let backgroundType: BackgroundType //цвет беграунда согласно дизайну
        let needCloseButton: Bool // отобразим кнопку закрытия согласно дизайну
        let needShadow: Bool // если передан true, у вьюшки отобразится тень
        
        public init(
            textWithIconView: TextWithIconView.ViewState,
            buttonTitle: String? = nil,
            backgroundType: BackgroundType,
            needCloseButton: Bool,
            needShadow: Bool
        ) {
            self.textWithIconView = textWithIconView
            self.buttonTitle = buttonTitle
            self.backgroundType = backgroundType
            self.needCloseButton = needCloseButton
            self.needShadow = needShadow
        }
    }
}

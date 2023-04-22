//
//  SimpleView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

class SimpleView: UIView {
    var textWithIconView = TextWithIconView()
    var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor(red: 0.259, green: 0.545, blue: 0.976, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
        button.layer.cornerRadius = 12
        return button
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        addSubview(stackView)
        
        translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        stackView.addArrangedSubview(textWithIconView)
        stackView.addArrangedSubview(button)
    }
    
    func render(viewState: ViewState) {
        textWithIconView.render(viewState: viewState.textWithIconView)
        button.setTitle(viewState.buttonTitle, for: .normal)
        button.isHidden = viewState.buttonTitle == nil
    }
    
    struct ViewState {
        let textWithIconView: TextWithIconView.ViewState
        let buttonTitle: String?
    }
}

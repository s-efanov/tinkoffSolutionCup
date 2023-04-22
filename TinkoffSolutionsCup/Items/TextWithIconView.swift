//
//  TextWithIconView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

class TextWithIconView: UIView {
    private let _labelsView = LabelsView()
    private let _leftIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Star"))
        imageView.contentMode = .center
        return imageView
    }()
    private let _rightIcon = {
        let imageView = UIImageView(image: UIImage(named: "Star"))
        imageView.contentMode = .center
        return imageView
    }()
    
    private let _stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
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
        _stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        _stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        _stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        _stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        _stackView.addArrangedSubview(_leftIcon)
        _stackView.addArrangedSubview(_labelsView)
        _stackView.addArrangedSubview(_rightIcon)
        
        _leftIcon.setContentHuggingPriority(.required, for: .horizontal)
        _rightIcon.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    struct ViewState {
        let labels: LabelsView.ViewState
        let iconPosition: IconPosition
    }
    
    enum IconPosition {
        case left, right
    }
    
    func render(viewState: ViewState) {
        _labelsView.render(viewState: viewState.labels)
        
        switch viewState.iconPosition {
        case .left:
            _rightIcon.isHidden = true
            _leftIcon.isHidden = false
        case .right:
            _rightIcon.isHidden = false
            _leftIcon.isHidden = true
        }
    }
}

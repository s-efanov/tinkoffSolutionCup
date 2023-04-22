//
//  TextWithIconView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

class TextWithIconView: UIView {
    let labelsView = LabelsView()
    let leftIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Star"))
        imageView.contentMode = .center
        return imageView
    }()
    let rightIcon = {
        let imageView = UIImageView(image: UIImage(named: "Star"))
        imageView.contentMode = .center
        return imageView
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
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
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        stackView.addArrangedSubview(leftIcon)
        stackView.addArrangedSubview(labelsView)
        stackView.addArrangedSubview(rightIcon)
    }
    
    struct ViewState {
        let labels: LabelsView.ViewState
        let iconPosition: IconPosition
    }
    
    enum IconPosition {
        case left, right
    }
    
    func render(viewState: ViewState) {
        labelsView.render(viewState: viewState.labels)
        
        switch viewState.iconPosition {
        case .left:
            rightIcon.isHidden = true
            leftIcon.isHidden = false
        case .right:
            rightIcon.isHidden = false
            leftIcon.isHidden = true
        }
    }
}

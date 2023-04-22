//
//  LabelsView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

class LabelsView: UIView {
    var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    var subheaderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.573, green: 0.6, blue: 0.635, alpha: 1)
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
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
        
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subheaderLabel)
        
        stackView.setCustomSpacing(4, after: titleLabel)
    }
    
    func render(viewState: ViewState) {
        headerLabel.text = viewState.header
        titleLabel.text = viewState.title
        subheaderLabel.text = viewState.subheader
        
        headerLabel.isHidden = viewState.header == nil
        titleLabel.isHidden = viewState.title == nil
        subheaderLabel.isHidden = viewState.subheader == nil
    }
    
    struct ViewState {
        let header: String?
        let subheader: String?
        let title: String?
    }
}

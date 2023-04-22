//
//  LabelsView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

class LabelsView: UIView {
    private let _headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let _titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    private let _subheaderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.573, green: 0.6, blue: 0.635, alpha: 1)
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    private let _descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.573, green: 0.6, blue: 0.635, alpha: 1)
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    private let _stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
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
        
        _stackView.addArrangedSubview(_headerLabel)
        _stackView.addArrangedSubview(_titleLabel)
        _stackView.addArrangedSubview(_subheaderLabel)
        _stackView.addArrangedSubview(_descriptionLabel)
        
        _stackView.setCustomSpacing(4, after: _headerLabel)
    }
    
    func render(viewState: ViewState) {
        _headerLabel.text = viewState.header
        _titleLabel.text = viewState.title
        _subheaderLabel.text = viewState.subheader
        _descriptionLabel.text = viewState.description
        
        _headerLabel.isHidden = viewState.header == nil
        _titleLabel.isHidden = viewState.title == nil
        _subheaderLabel.isHidden = viewState.subheader == nil
        _descriptionLabel.isHidden = viewState.description == nil
    }
    
    struct ViewState {
        let header: String?
        let subheader: String?
        let title: String?
        let description: String?
    }
}

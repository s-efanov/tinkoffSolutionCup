//
//  LabelsView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

public class LabelsView: UIView {
    private let _headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = EfanovColor.headerColor
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
        label.textColor = EfanovColor.labelColor
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    private let _descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = EfanovColor.labelColor
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
    
    // Конфигурирует вьюшку
    public func render(viewState: ViewState) {
        _headerLabel.text = viewState.header
        _titleLabel.text = viewState.title
        _subheaderLabel.text = viewState.subheader
        _descriptionLabel.text = viewState.description
        
        _headerLabel.isHidden = viewState.header == nil
        _titleLabel.isHidden = viewState.title == nil
        _subheaderLabel.isHidden = viewState.subheader == nil
        _descriptionLabel.isHidden = viewState.description == nil
    }
    
    public struct ViewState {
        let header: String? // Отображает хедер, если передать nil, то строка пропадет
        let subheader: String? // Отображает сабхедер, если передать nil, то строка пропадет
        let title: String? // Отображает тайтл, если передать nil, то строка пропадет
        let description: String? // Отображает описание, если передать nil, то строка пропадет
        
        public init(header: String? = nil, subheader: String? = nil, title: String? = nil, description: String? = nil) {
            self.header = header
            self.subheader = subheader
            self.title = title
            self.description = description
        }
    }
}

#if DEBUG
extension LabelsView.ViewState {
    public static func mock(
        header: String? = "Header",
        subheader: String? = "Subheader",
        title: String? = "Subheader",
        description: String? = "description"
    ) -> LabelsView.ViewState {
        return .init(header: header, subheader: subheader, title: title, description: description)
    }
}
#endif

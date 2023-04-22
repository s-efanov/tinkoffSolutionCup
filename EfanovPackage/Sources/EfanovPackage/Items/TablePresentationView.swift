//
//  TablePresentationView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit
//import Combine

public final class TablePresentationView: UIView {
    private let _tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        return tableView
    }()
    
    private let _headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let _closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(EfanovColor.buttonTittleColor, for: .normal)
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    private var _items: [TextWithIconView.ViewState] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setupSubviews() {
        addSubview(_headerLabel)
        addSubview(_tableView)
        addSubview(_closeButton)
        
        _tableView.register(TableItem.self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        _headerLabel.translatesAutoresizingMaskIntoConstraints = false
        _headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        _headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true

        _closeButton.translatesAutoresizingMaskIntoConstraints = false
        _closeButton.firstBaselineAnchor.constraint(equalTo: _headerLabel.firstBaselineAnchor).isActive = true
        _closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        _tableView.translatesAutoresizingMaskIntoConstraints = false
        _tableView.topAnchor.constraint(equalTo: _headerLabel.bottomAnchor, constant: 20).isActive = true
        _tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        _tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        _tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        _tableView.dataSource = self
    }
    
    // Конфигурирует вьюшку
    public func render(viewState: ViewState) {
        _headerLabel.text = viewState.headerTitle
        _items = viewState.items
        _tableView.reloadData()
        
        switch viewState.backgroundType {
        case .white:
            backgroundColor = .white
        case .gray:
            backgroundColor = EfanovColor.grayBackgroundColor
        }
        
        layer.cornerRadius = 24
        _tableView.backgroundColor = .clear
        
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
        let headerTitle: String // Заголовок для хедера
        let items: [TextWithIconView.ViewState] // Элементы, которые нам нужно отображать. СМ TextWithIconView
        let backgroundType: BackgroundType // Цвет беграунда согласно дизайн системе
        let needShadow: Bool // если передан true, у вьюшки отобразится тень
        
        public init(headerTitle: String, items: [TextWithIconView.ViewState], backgroundType: BackgroundType, needShadow: Bool) {
            self.headerTitle = headerTitle
            self.items = items
            self.backgroundType = backgroundType
            self.needShadow = needShadow
        }
    }
}

extension TablePresentationView {
    enum Events {
        case closeButtonTapped
    }
    
    //Подписки на нажатия кнопки
//    var events: AnyPublisher<Events, Never> {
//        Publishers.MergeMany(
//            _closeButton.tapPublisher.map { .closeButtonTapped }
//        )
//    }
}

extension TablePresentationView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        _items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableItem.reuseIdentifier, for: indexPath)
        (cell as? TableItem)?.render(viewState: _items[indexPath.row])
        return cell
    }
    
    
}

class TableItem: UITableViewCell {
    let textWithIconView: TextWithIconView = {
        TextWithIconView()
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(textWithIconView)

        textWithIconView.translatesAutoresizingMaskIntoConstraints = false
        textWithIconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        textWithIconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        textWithIconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        textWithIconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(viewState: TextWithIconView.ViewState) {
        textWithIconView.render(viewState: viewState)
    }
}

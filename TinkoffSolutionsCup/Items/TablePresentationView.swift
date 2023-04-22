//
//  TablePresentationView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

final class TablePresentationView: UIView {
    private let _tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
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
        button.setTitleColor(UIColor(red: 0.259, green: 0.545, blue: 0.976, alpha: 1), for: .normal)
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
    
    func render(viewState: ViewState) {
        _headerLabel.text = viewState.headerTitle
        _items = viewState.items
        _tableView.reloadData()
        
        switch viewState.backgroundType {
        case .white:
            backgroundColor = .white
        case .gray:
            backgroundColor = UIColor(red: 0.965, green: 0.969, blue: 0.973, alpha: 1)
        }
    }
    
    struct ViewState {
        let headerTitle: String
        let items: [TextWithIconView.ViewState]
        let backgroundType: BackgroundType
    }
}

extension TablePresentationView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        _items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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


extension UITableView {
    func register<T: UITableViewCell>(_ type: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func reuse<T: UITableViewCell>(_ type: T.Type, _ indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }

    var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }
}

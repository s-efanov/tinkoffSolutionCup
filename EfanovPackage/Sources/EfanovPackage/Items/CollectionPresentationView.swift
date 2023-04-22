//
//  TablePresentationView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

var flowLayout: UICollectionViewFlowLayout {
    let _flowLayout = UICollectionViewFlowLayout()
    // edit properties here
    _flowLayout.itemSize = CGSize(width: 140, height: 140)
    _flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
    _flowLayout.minimumInteritemSpacing = 0.0
    _flowLayout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
    // edit properties here
    return _flowLayout
}

public final class CollectionPresentationView: UIView {
    private let _stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private let _collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        return collectionView
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
    
    private let _bottomButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor(red: 0.259, green: 0.545, blue: 0.976, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private var _items: [LabelsView.ViewState] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func _setupSubviews() {
        layer.cornerRadius = 24
        
        
        addSubview(_stackView)
        
        addSubview(_headerLabel)
        addSubview(_closeButton)
        addSubview(_collectionView)
        _collectionView.register(CollectionItem.self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        _headerLabel.translatesAutoresizingMaskIntoConstraints = false
        _headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        _headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true

        _closeButton.translatesAutoresizingMaskIntoConstraints = false
        _closeButton.firstBaselineAnchor.constraint(equalTo: _headerLabel.firstBaselineAnchor).isActive = true
        _closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        _stackView.translatesAutoresizingMaskIntoConstraints = false
        _stackView.topAnchor.constraint(equalTo: _headerLabel.bottomAnchor, constant: 20).isActive = true
        _stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        _stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        _stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        _stackView.addArrangedSubview(_collectionView)
        
        _stackView.addArrangedSubview(_bottomButton)

        _collectionView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        _bottomButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        _collectionView.dataSource = self
    }
    
    public func render(viewState: ViewState) {
        _headerLabel.text = viewState.headerTitle
        _items = viewState.items
        _collectionView.reloadData()
        
        switch viewState.backgroundType {
        case .white:
            backgroundColor = .white
        case .gray:
            backgroundColor = UIColor(red: 0.965, green: 0.969, blue: 0.973, alpha: 1)
        }
        
        _bottomButton.setTitle(viewState.buttonTitle, for: .normal)
        _bottomButton.isHidden = viewState.buttonTitle == nil
        
        if viewState.needShadow {
            layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
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
        let headerTitle: String
        let items: [LabelsView.ViewState]
        let buttonTitle: String?
        let backgroundType: BackgroundType
        let needShadow: Bool
        
        public init(
            headerTitle: String,
            items: [LabelsView.ViewState],
            buttonTitle: String?,
            backgroundType: BackgroundType,
            needShadow: Bool
        ) {
            self.headerTitle = headerTitle
            self.items = items
            self.buttonTitle = buttonTitle
            self.backgroundType = backgroundType
            self.needShadow = needShadow
        }
    }
}

extension CollectionPresentationView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        _items.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionItem.reuseIdentifier, for: indexPath)
        (cell as? CollectionItem)?.render(viewState: _items[indexPath.row])
        return cell
    }
}

class CollectionItem: UICollectionViewCell {
    let textWithIconView: LabelsView = {
        LabelsView()
    }()
    
    private let _icon = {
        let imageView = UIImageView(image: UIImage(named: "Star"))
        imageView.contentMode = .center
        return imageView
    }()
    
    private let _backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.965, green: 0.969, blue: 0.973, alpha: 1)
        view.layer.cornerRadius = 12
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(textWithIconView)
        contentView.addSubview(_icon)
        
        _icon.translatesAutoresizingMaskIntoConstraints = false
        _icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        _icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true

        textWithIconView.translatesAutoresizingMaskIntoConstraints = false
        textWithIconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        textWithIconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        textWithIconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contentView.addSubview(_backgroundView)
        _backgroundView.translatesAutoresizingMaskIntoConstraints = false
        _backgroundView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        _backgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        _backgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        _backgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contentView.sendSubviewToBack(_backgroundView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(viewState: LabelsView.ViewState) {
        textWithIconView.render(viewState: viewState)
    }
}


extension UICollectionView {
    func register<T: UICollectionViewCell>(_ type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func reuse<T: UICollectionViewCell>(_ type: T.Type, _ indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }

    open override var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }
}
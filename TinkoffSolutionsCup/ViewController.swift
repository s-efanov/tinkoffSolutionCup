//
//  ViewController.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import UIKit
import EfanovPackage

class ViewController: UIViewController {
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 1000, height: 4000)
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        let simpleView1 = SimpleView()
        scrollView.addSubview(simpleView1)

        simpleView1.translatesAutoresizingMaskIntoConstraints = false
        simpleView1.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        simpleView1.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10).isActive = true
        simpleView1.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10).isActive = true

        simpleView1.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(header: "Header", subheader: "Subheader"),
                iconPosition: .right
            ),
            backgroundType: .white,
            needCloseButton: false,
            needShadow: true
        ))
        
        ///

        let simpleView2 = SimpleView()
        view.addSubview(simpleView2)

        simpleView2.translatesAutoresizingMaskIntoConstraints = false
        simpleView2.topAnchor.constraint(equalTo: simpleView1.bottomAnchor, constant: 10).isActive = true
        simpleView2.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10).isActive = true
        simpleView2.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10).isActive = true

        simpleView2.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(header: "Header", subheader: "Subheader"),
                iconPosition: .right
            ),
            backgroundType: .gray,
            needCloseButton: false,
            needShadow: false
        ))
        
        let simpleView3 = SimpleView()
        view.addSubview(simpleView3)

        simpleView3.translatesAutoresizingMaskIntoConstraints = false
        simpleView3.topAnchor.constraint(equalTo: simpleView2.bottomAnchor, constant: 10).isActive = true
        simpleView3.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10).isActive = true
        simpleView3.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        simpleView3.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(header: "Header"),
                iconPosition: .right
            ),
            backgroundType: .white,
            needCloseButton: false,
            needShadow: true
        ))
        
        let simpleView4 = SimpleView()
        scrollView.addSubview(simpleView4)

        simpleView4.translatesAutoresizingMaskIntoConstraints = false
        simpleView4.topAnchor.constraint(equalTo: simpleView3.bottomAnchor, constant: 10).isActive = true
        simpleView4.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10).isActive = true
        simpleView4.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10).isActive = true

        simpleView4.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(header: "Header"),
                iconPosition: .right
            ),
            backgroundType: .gray,
            needCloseButton: false,
            needShadow: false
        ))
        
        let simpleView5 = SimpleView()
        scrollView.addSubview(simpleView5)

        simpleView5.translatesAutoresizingMaskIntoConstraints = false
        simpleView5.topAnchor.constraint(equalTo: simpleView4.bottomAnchor, constant: 10).isActive = true
        simpleView5.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10).isActive = true
        simpleView5.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10).isActive = true

        simpleView5.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(header: "Header", subheader: "Subheader"),
                iconPosition: .right
            ),
            buttonTitle: "Button",
            backgroundType: .white,
            needCloseButton: false,
            needShadow: true
        ))
        
        let simpleView6 = SimpleView()
        scrollView.addSubview(simpleView6)

        simpleView6.translatesAutoresizingMaskIntoConstraints = false
        simpleView6.topAnchor.constraint(equalTo: simpleView5.bottomAnchor, constant: 10).isActive = true
        simpleView6.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10).isActive = true
        simpleView6.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10).isActive = true

        simpleView6.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(title: "Title", description: "Description"),
                iconPosition: .left
            ),
            backgroundType: .gray,
            needCloseButton: false,
            needShadow: false
        ))
        
        let simpleView7 = SimpleView()
        scrollView.addSubview(simpleView7)

        simpleView7.translatesAutoresizingMaskIntoConstraints = false
        simpleView7.topAnchor.constraint(equalTo: simpleView6.bottomAnchor, constant: 10).isActive = true
        simpleView7.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10).isActive = true
        simpleView7.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10).isActive = true

        simpleView7.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(title: "Title", description: "Description"),
                iconPosition: .left
            ),
            backgroundType: .white,
            needCloseButton: true,
            needShadow: true
        ))
        
        //////
        
        let tableView = TablePresentationView()
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: simpleView7.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -10).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 300).isActive = true

        tableView.render(viewState: .init(
            headerTitle: "Header",
            items: [
            .init(labels: .init(
                header: nil,
                subheader: nil,
                title: "title",
                description: "description"
            ),
                  iconPosition: .left
            ),
            .init(labels: .init(
                header: nil,
                subheader: nil,
                title: "title",
                description: "description"
            ),
                  iconPosition: .left
            ),
            .init(labels: .init(
                header: nil,
                subheader: nil,
                title: "title",
                description: "description"
            ),
                  iconPosition: .left
            )
            ],
            backgroundType: .white,
            needShadow: true
        ))

        ///
        let collectionView = CollectionPresentationView()
        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -1000).isActive = true

        collectionView.render(viewState: .init(
            headerTitle: "Header",
            items: [
            .init(
                header: nil,
                subheader: nil,
                title: "title",
                description: "description"
            ),
            .init(
                header: nil,
                subheader: nil,
                title: "title",
                description: "description"
            ),
            .init(
                header: nil,
                subheader: nil,
                title: "title",
                description: "description"
            )
            ],
            buttonTitle: "Button",
            backgroundType: .white,
            needShadow: true
        ))
    }
}


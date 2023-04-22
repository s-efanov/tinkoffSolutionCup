//
//  ViewController.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import UIKit

class ViewController: UIViewController {

//    let labelsview = LabelsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let labelsView = LabelsView()
//        view.addSubview(labelsView)
//
//        labelsView.translatesAutoresizingMaskIntoConstraints = false
//        labelsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        labelsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//
//        labelsView.render(viewState: .init(header: "Header", subheader: "Subheader", title: "title"))
        
//        let textWithIconView = TextWithIconView()
//        view.addSubview(textWithIconView)
//
//        textWithIconView.translatesAutoresizingMaskIntoConstraints = false
//        textWithIconView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        textWithIconView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//
//        textWithIconView.render(viewState: .init(
//            labels: .init(header: "Header", subheader: "Subheader", title: "title"),
//            iconPosition: .right
//        ))
        
        let simpleView = SimpleView()
        view.addSubview(simpleView)
        
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        simpleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        simpleView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        simpleView.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(header: "Header", subheader: "Subheader", title: "title"),
                iconPosition: .left
            ),
            buttonTitle: "Button1"
        ))
    }


}


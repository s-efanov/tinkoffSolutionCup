//
//  SimpleView.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

class LeftIconView: UIView {
    var stackView = UIStackView()
    var icon = UIImage()
    var button = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(viewState: ViewState) {
        
    }
    
    struct ViewState {
        let header: String?
        let subheader: String?
        let title: String?
    }
}

//
//  File.swift
//  
//
//  Created by Efanov Sergey on 22.04.2023.
//

import SnapshotTesting
import Foundation
import XCTest
@testable import EfanovPackage

final class TextWithIconViewTests: XCTestCase {
    // TODO - Непонятно что с размерами изображений, нужно разобраться
    func testLeftIcon() {
        let view = TextWithIconView(frame: .zero)
        view.render(viewState: .init(labels: .init(header: "Header"), iconPosition: .left))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
    
    func testRightIcon() {
        let view = TextWithIconView(frame: .zero)
        view.render(viewState: .init(labels: .init(header: "Header"), iconPosition: .right))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
}

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

final class SimpleViewTests: XCTestCase {
    // TODO - Непонятно что с размерами изображений, нужно разобраться
    func testHeaderAndDescriptionGray() {
        let view = SimpleView(frame: .zero)
        view.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(header: "Header", description: "Description"),
                iconPosition: .left
            ),
            backgroundType: .gray,
            needCloseButton: false,
            needShadow: false
        ))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
    
    func testHeaderAndTitleWhite() {
        let view = SimpleView(frame: .zero)
        view.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(header: "Header", title: "Title"),
                iconPosition: .left
            ),
            backgroundType: .white,
            needCloseButton: false,
            needShadow: false
        ))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
    
    func testCloseButton() {
        let view = SimpleView(frame: .zero)
        view.render(viewState: .init(
            textWithIconView: .init(
                labels: .init(header: "Header", title: "Title"),
                iconPosition: .left
            ),
            backgroundType: .white,
            needCloseButton: true,
            needShadow: false
        ))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
}

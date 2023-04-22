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

final class CollectionPresentationViewTests: XCTestCase {
    // TODO - Непонятно что с размерами изображений, нужно разобраться
    // TODO - Нужно больше тестов
    func testCollection() {
        let view = CollectionPresentationView(frame: .zero)
        view.render(viewState: .init(
            headerTitle: "title",
            items: [
                .init(header: "Header")
        ],
            buttonTitle: "BuutonTitle",
            backgroundType: .white,
            needShadow: true
        ))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
}

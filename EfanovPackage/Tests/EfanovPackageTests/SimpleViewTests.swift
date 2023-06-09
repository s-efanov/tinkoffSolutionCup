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

final class TablePresentationViewTests: XCTestCase {
    // TODO - Непонятно что с размерами изображений, нужно разобраться
    // TODO - Нужно больше тестов
    func testTable() {
        let view = TablePresentationView(frame: .zero)
        view.render(viewState: .init(
            headerTitle: "Header",
            items: [
                .init(labels: .init(header: "Header"), iconPosition: .left)
            ],
            backgroundType: .gray,
            needShadow: true
        ))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
}

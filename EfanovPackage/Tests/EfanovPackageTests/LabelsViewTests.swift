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

final class LabelsViewTests: XCTestCase {
    func testHeader() {
        let view = LabelsView(frame: .zero)
        view.render(viewState: .init(header: "Header"))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
    
    func testSubheader() {
        let view = LabelsView(frame: .zero)
        view.render(viewState: .init(subheader: "Subheader"))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
    
    func testTitle() {
        let view = LabelsView(frame: .zero)
        view.render(viewState: .init(title: "Title"))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
    
    func testDescription() {
        let view = LabelsView(frame: .zero)
        view.render(viewState: .init(description: "Description"))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
    
    func testHeaderAndSubheader() {
        let view = LabelsView(frame: .zero)
        view.render(viewState: .init(header: "Header", subheader: "Subheader"))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
    
    func testTitleAndDescription() {
        let view = LabelsView(frame: .zero)
        view.render(viewState: .init(title: "Title", description: "Description"))
        assertSnapshots(matching: view, as: [Snapshotting.image(size: CGSize(width: 700, height: 300))])
    }
}

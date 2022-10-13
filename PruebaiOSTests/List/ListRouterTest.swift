//
//  ListRouterTest.swift
//  PruebaiOSTests
//
//  Created by Cristian Ayala on 13/10/22.
//

import XCTest
@testable import PruebaiOS

class ListRouterTest: XCTestCase {
    
    var sut: ListRouter!
    override func setUp() {
        super.setUp()
        sut = .init()
        UIApplication.shared.keyWindow?.rootViewController = sut
    }
    
    override func tearDown() {
        sut = nil
        UIApplication.shared.keyWindow?.rootViewController = nil
        super.tearDown()
    }
    
    func test_createModule() {
        let viewController = sut.createModule()
        let listViewController = viewController as? ListViewController
        XCTAssertNotNil(listViewController)
    }
    
    func test_presentError() {
        sut.presentError()
        let alert = sut.presentedViewController as? UIAlertController
        XCTAssertNotNil(alert)
    }
    
    func test_pushDetail() {
        sut.pushDetail(with: .init(title: "test", body: "body"))
        let detailViewController = sut.viewControllers.filter { viewController in
            if let _ = viewController as? DetailViewController {
                return true
            }
            return false
        }.first
        XCTAssertNotNil(detailViewController)
    }
}

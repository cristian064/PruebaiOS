//
//  ListPresenterTest.swift
//  PruebaiOSTests
//
//  Created by Cristian Ayala on 12/10/22.
//

import XCTest
@testable import PruebaiOS

class ListPresenterTest: XCTestCase {
    
    var sut: ListPresenter!
    var listInteractorMock: ListInteractorMock!
    var listRouterMock: ListRouterMock!
    var listViewMock: ListViewMock!
    override func setUp() {
        super.setUp()
        listRouterMock = .init()
        listInteractorMock = .init()
        listViewMock = .init()
        sut = .init(router: listRouterMock,
                              interactor: listInteractorMock)
        sut.view = listViewMock
    }
    
    override func tearDown() {
        listRouterMock = nil
        listInteractorMock = nil
        listViewMock = nil
        sut = nil
        super.tearDown()
    }
    
    func test_didSelectData() {
        sut.elements = [.init(title: "test", body: "one body"),
                        .init(title: "test 2", body: "two body")]
        
        sut.didSelect(at: 0)
        XCTAssertEqual(listRouterMock.data.title, sut.elements[0].title)
        XCTAssertEqual(listRouterMock.data.body, sut.elements[0].body)
    }
    
    func test_didReceiveError() {
        sut.didReceiveError()
        XCTAssertTrue(listRouterMock.isPresentError)
    }
    
    func test_getData() {
        sut.getData()
        XCTAssertEqual(sut.requestData.pageNumber, 1)
        XCTAssertEqual(sut.requestData.pageSize, 10)
    }
    
    func test_loadMoreData() {
        sut.requestData = .init(pageNumber: 2, pageSize: 10, totalPage: 4, text: .empty)
        sut.loadMoreData()
        XCTAssertEqual(listInteractorMock.requestData.pageNumber, 3)
        XCTAssertEqual(listInteractorMock.requestData.totalPage, 4)
    }
    
    func test_willDisplay() {
        sut.elements = [.init(title: "test", body: "one body"),
                        .init(title: "test 2", body: "two body")]
        sut.requestData = .init(pageNumber: 1, pageSize: 2, totalPage: 4, text: .empty)
        sut.willDisplay(indexPath: .init(row: 2, section: 0))
        XCTAssertEqual(listInteractorMock.requestData.pageNumber, 2)
    }
    
    func test_search() {
        sut.search(with: "test")
        sut.requestData = .init(pageNumber: 1, pageSize: 2, totalPage: 4, text: .empty)
        XCTAssertEqual(listInteractorMock.requestData.text, "test")
    }
    
    func test_paginationMoreData() {
        let listModel = ListModel(data: [.init(title: "test", body: "one body"),
                                         .init(title: "test 2", body: "two body")],
                                  pagination: .init(pageNumber: 2, pageSize: 2, totalPage: 4))
        sut.elements = [.init(title: "test 0", body: "one body"),
                        .init(title: "test 1", body: "two body")]
        sut.didReceiveData(dataModel: listModel)
        
        XCTAssertEqual(sut.elements.count, 4)
        XCTAssertEqual(sut.requestData.pageNumber, 2)
        
    }
    
    func test_didReceiveDataFirstPage() {
        let listModel = ListModel(data: [.init(title: "test", body: "one body"),
                                         .init(title: "test 2", body: "two body")],
                                  pagination: .init(pageNumber: 1, pageSize: 2, totalPage: 4))
        
        sut.didReceiveData(dataModel: listModel)
        XCTAssertEqual(sut.elements.count, 2)
        XCTAssertEqual(sut.requestData.pageNumber, 1)
    }
}

//
//  ListInteractorTest.swift
//  PruebaiOSTests
//
//  Created by Cristian Ayala on 12/10/22.
//

import XCTest
@testable import PruebaiOS

class ListInteractorTest: XCTestCase {
    var sut: ListInteractor!
    var listPresenterMock: ListPresenterMock!
    var repositoryMock: GoRestRepositoryProtocol!
    override func setUp() {
        super.setUp()
        
        listPresenterMock = ListPresenterMock()
        repositoryMock = RepositoryMock()
        sut = ListInteractor()
        sut.repository = repositoryMock
        sut.presenter = listPresenterMock
    }
    
    override func tearDown() {
        repositoryMock = nil
        listPresenterMock = nil
        sut = nil
        super.tearDown()
    }
    
    func test_getData() {
        let requestData = RequestModel(pageNumber: 1, pageSize: 10, totalPage: 1, text: .empty)
        sut.getData(requestData: requestData)
        XCTAssertEqual(sut.isLoadingMoreData, false)
        XCTAssertEqual(listPresenterMock.dataModel.data.count, 10)
        XCTAssertEqual(listPresenterMock.dataModel.pagination.totalPage, 8)
        XCTAssertEqual(listPresenterMock.dataModel.pagination.pageNumber, 1)
        
    }
    
    func test_mapDataModel() {
        let requestData = RequestModel(pageNumber: 1, pageSize: 10, totalPage: 1, text: .empty)
        let title = "Adinventitias subnecto vinitor deleo magnam delego sit cohibeo depromo celo vir uredo vitae bardus timor aestas venio unde."
        let body = "Aut coerceo abduco. Vinum venia ante. Aliqua conculco conitor. Coaegresco truculenter temeritas. Uxor atrocitas amicitia. Arto dedecor solvo. Desino coerceo teneo. Claro supplanto volutabrum. Crinis eum comburo. Alioqui abscido administratio. Recusandae argumentum iusto. Volutabrum solvo clamo. Vestrum auditor auctor. Talis sub beatus. Arx sursum usitas. Neque aliquid amicitia. Ambulo minima uter. Demoror accedo aggredior. Ubi comminor aufero."
        sut.getData(requestData: requestData)
        XCTAssertEqual(listPresenterMock.dataModel.data[0].title, title)
        XCTAssertEqual(listPresenterMock.dataModel.data[0].body, body)
    }
}


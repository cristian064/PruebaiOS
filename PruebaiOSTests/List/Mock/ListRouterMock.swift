//
//  ListPresenterRouterMock.swift
//  PruebaiOSTests
//
//  Created by Cristian Ayala on 12/10/22.
//

import Foundation
@testable import PruebaiOS

class ListRouterMock: ListRouterProtocol {
    var isPresentError: Bool!
    var data: DataModel!
    func presentError() {
        isPresentError = true
    }
    
    func pushDetail(with data: DataModel) {
        self.data = data
    }
    

    
}

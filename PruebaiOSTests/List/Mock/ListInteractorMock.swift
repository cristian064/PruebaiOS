//
//  ListInteractorMock.swift
//  PruebaiOSTests
//
//  Created by Cristian Ayala on 12/10/22.
//

import Foundation
@testable import PruebaiOS

class ListInteractorMock: ListInteractorProtocol {
    var requestData: RequestModel!
    func getData(requestData: RequestModel) {
        self.requestData = requestData
    }
    
    
}

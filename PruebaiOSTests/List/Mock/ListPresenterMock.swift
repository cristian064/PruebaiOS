//
//  ListPresenterMock.swift
//  PruebaiOSTests
//
//  Created by Cristian Ayala on 12/10/22.
//

import Foundation
@testable import PruebaiOS

class ListPresenterMock: ListPresenterProtocol {
    //test
    var dataModel: ListModel!
    
    
    init() {
        title = .empty
        
    }
    var title: String
    
    var elements: [DataModel] = []
    
    func viewDidLoad() {
        
    }
    
    func initialLoadData() {
        
    }
    
    func search(with title: String) {
        
    }
    
    func willDisplay(indexPath: IndexPath) {
        
    }
    
    func didSelect(at index: Int) {
        
    }
    
    func didReceiveError() {
        
    }
    
    func didReceiveData(dataModel: ListModel) {
        self.dataModel = dataModel
    }
    
    
}

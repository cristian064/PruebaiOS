//
//  DetailPresenter.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 12/10/22.
//

import Foundation

class DetailPresenter: DetailViewPresenterProtocol {
    var data: DataModel
    var title: String = Localized.Detail.title
    init(dataModel: DataModel) {
        self.data = dataModel
    }
}

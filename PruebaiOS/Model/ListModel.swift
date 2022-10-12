//
//  ListModel.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

struct ListModel {
    let data: [DataModel]
    let pagination: PaginationModel
}

struct DataModel {
    let title: String
    let body: String
}

struct PaginationModel {
    var pageNumber: Int
    var pageSize: Int
    var totalPage: Int
}



//struct Pagination: Decodable {
//    let page: Int
//    let pages: Int
//    let total: Int
//    let limit: Int
//}
//
//struct DataEntity: Decodable {
//    let id: Int
//    let userId: Int
//    let title: String
//    let body: String
//
//    private enum CodingKeys : String, CodingKey {
//        case id, userId = "user_id", title, body
//    }
//}

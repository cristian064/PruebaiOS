//
//  ResponseListModel.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

struct ListEntity: Decodable {
    let data: [DataEntity]
    let pagination: PaginationEntity
    private enum CodingKeys : String, CodingKey {
        case data, meta, pagination
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let meta = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .meta)
        data = try container.decode([DataEntity].self, forKey: .data)
        pagination = try meta.decode(PaginationEntity.self, forKey: .pagination)
        
    }
}

struct PaginationEntity: Decodable {
//    let page: Int
//    let pages: Int
//    let total: Int
//    let limit: Int
    
    var pageNumber: Int
    var pageSize: Int
    var totalPage: Int
    
    private enum CodingKeys : String, CodingKey {
        case pageNumber = "page", pageSize = "limit", totalPage = "pages"
    }
}

struct DataEntity: Decodable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
    private enum CodingKeys : String, CodingKey {
        case id, userId = "user_id", title, body
    }
}

//
//  DetailRouter.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 12/10/22.
//

import Foundation
import UIKit

class DetailRouter {
    
    func create(dataModel: DataModel) -> UIViewController {
        let presenter = DetailPresenter(dataModel: dataModel)
        let view = DetailViewController(presenter: presenter)
        return view
    }
}

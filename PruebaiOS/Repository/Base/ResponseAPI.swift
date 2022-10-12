//
//  ResponseAPI.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 12/10/22.
//

import Foundation

public enum ResponseAPI<T> {
    case success(T)
    case failure(NetworkError)
}

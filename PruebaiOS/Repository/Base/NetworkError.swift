//
//  NetworkError.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 12/10/22.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case jsonDecoderError
    case jsonEncoderError
    case dataTaskError(Error)
    case invalidResponse
}

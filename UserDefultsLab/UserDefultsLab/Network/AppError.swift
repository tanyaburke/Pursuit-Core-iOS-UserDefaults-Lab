//
//  AppError.swift
//  UserDefultsLab
//
//  Created by Tanya Burke on 1/14/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//


import Foundation

enum AppError: Error{
    case badURL(String)
    case networkClientError(Error)
    case noResponse
    case noData
    case badStatusCode(Int)
    case decodingError(Error)
    case encodingError(Error)
    case missingValue
}

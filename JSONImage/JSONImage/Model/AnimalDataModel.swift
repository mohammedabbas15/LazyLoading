//
//  AnimalDataModel.swift
//  JSONImage
//
//  Created by Field Employee on 10/20/21.
//

import Foundation

// https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals

struct AnimalDataModel: Codable {
    let errorMessage: String
    let animals: [Animal]
    enum CodingKeys: String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}

struct Animal: Codable {
    let name: String
    let image: String
}

//
//  NetworkManager.swift
//  JSONImage
//
//  Created by Field Employee on 10/20/21.
//

import Foundation

struct AnimalNetworkManager {
    func getAnimals(completionHandler: @escaping(AnimalDataModel?)->()) {
        let animalURL = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals")!
        URLSession.shared.dataTask(with: animalURL) {(data, response, error) in
            if(error == nil && data != nil) {
                do {
                    let result = try JSONDecoder().decode(AnimalDataModel.self, from: data!)
                    completionHandler(result)
                }
                catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}

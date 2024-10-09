//
//  GetDownloadDataUsecase.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import CoreData

protocol GetDownloadDataUsecaseType {
    func execute() async throws -> [ProductModel]
}

struct GetDownloadDataUsecase: GetDownloadDataUsecaseType {
    
    func execute() async throws -> [ProductModel] {
        
        // we can use APIManager if we have a location API 
        
        guard let dataUrl = Bundle.main.url(forResource: "Location", withExtension: "json") else {
            return []
        }
        let data = try Data(contentsOf: dataUrl)
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode([ProductModel].self, from: data)
    }
    
}

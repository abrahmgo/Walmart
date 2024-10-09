//
//  GetDownloadDataUsecase.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import Foundation

protocol GetDownloadDataUsecaseType {
    func execute() async throws -> [ProductModel]
}

struct GetDownloadDataUsecase: GetDownloadDataUsecaseType {
    
    private let network = APIRequest()
    
    func execute() async throws -> [ProductModel] {
        let request = URLRequest(url: URL(string: "https://fakestoreapi.com/products")!)
        let data = try await network.get(request: request)
        let decoder = JSONDecoder()
        switch data {
        case .success(let data):
            let models = try decoder.decode([ProductModel].self, from: data)
            return models
        case .failure(let error):
            throw error
        }
    }
}

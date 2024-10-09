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
    
    private let network = APIRequest()
    
    func execute() async throws -> [ProductModel] {
        let localData = try await getLocalData()
        if localData.isEmpty {
            print("descargando data")
            return try await downloadData()
        } else {
            print("mostrando data local")
            return localData
        }
    }
    
    func downloadData() async throws -> [ProductModel] {
        let request = URLRequest(url: URL(string: "https://fakestoreapi.com/products")!)
        let data = try await network.get(request: request)
        let decoder = JSONDecoder()
        switch data {
        case .success(let data):
            let models = try decoder.decode([ProductModel].self, from: data)
            try await saveData(data: models)
            return models
        case .failure(let error):
            throw error
        }
    }
    
    func saveData(data: [ProductModel]) async throws {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        for element in data {
            let entity = NSEntityDescription.entity(forEntityName: "ProductCoreModel", in: context)
            let newStore = NSManagedObject(entity: entity!, insertInto: context)
            newStore.setValue(element.id, forKey: "id")
            newStore.setValue(element.title, forKey: "title")
            newStore.setValue(element.price, forKey: "price")
        }
        try await CoreDataManager.shared.saveContext()
        print("se gurado en local la data descargada")
    }
    
    func getLocalData() async throws -> [ProductModel] {
        let data = try await CoreDataManager.shared.getContext()
        return data
    }
}

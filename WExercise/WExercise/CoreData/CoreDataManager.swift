//
//  CoreDataManager.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "WExerciseData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() async throws {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try context.save()
        }
    }
    
    func getContext() async throws -> [ProductModel] {
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductCoreModel")
        request.returnsObjectsAsFaults = false
        
        let result = try persistentContainer.viewContext.fetch(request)
        var list: [ProductModel] = []
        for data in result as! [NSManagedObject] {
            
            let id = data.value(forKey: "id") as? Int ?? 0
            let price = data.value(forKey: "price") as? Double ?? 0
            let title = data.value(forKey: "title") as? String ?? ""
            let newProduct = ProductModel(id: id, title: title, price: price)
            list.append(newProduct)
        }
        return list
    }
}

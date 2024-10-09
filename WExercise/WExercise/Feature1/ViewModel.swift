//
//  ViewModel.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import Foundation

protocol ViewModelType {
    func getData() async throws -> [ProductModel]
}

struct ViewModel: ViewModelType {
    
    private let functions: ArrayFunctionsType
    private let getDataUseCase: GetDownloadDataUsecaseType = GetDownloadDataUsecase()
    
    init(functions: ArrayFunctionsType = ArrayFunctions()) {
        self.functions = functions
    }
    
    func getData() async throws -> [ProductModel] {
        let data = try await getDataUseCase.execute()
        return data
    }
}

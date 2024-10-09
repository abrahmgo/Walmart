//
//  ViewModel.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import Foundation

protocol ViewModelType {
    func getArraySum() -> Int
}

struct ViewModel: ViewModelType {
    
    private let functions: ArrayFunctionsType
    
    init(functions: ArrayFunctionsType = ArrayFunctions()) {
        self.functions = functions
    }
    
    func getArraySum() -> Int {
        let input = functions.makeList()
        print("list \(input) \n")
        return functions.getSum(input: input)
    }
}

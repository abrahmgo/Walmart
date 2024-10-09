//
//  ArrayFunctions.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import Foundation

protocol ArrayFunctionsType {
    func getSum(input: [Int]) -> Int
    func makeList() -> [Int]
}

struct ArrayFunctions: ArrayFunctionsType {
    
    func getSum(input: [Int]) -> Int {
        return input.reduce(.zero, +)
    }
    
    func makeList() -> [Int] {
        let randomLength = Int.random(in: 0...100)
        return (0..<randomLength).map { _ in .random(in: 1...20) }
    }
}

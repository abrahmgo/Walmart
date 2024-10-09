//
//  ArrayFunctions.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import Foundation

public protocol ArrayFunctionsType {
    func getSum(input: [Int]) -> Int
    func makeList() -> [Int]
}

public struct ArrayFunctions: ArrayFunctionsType {
    
    public init() { }
    
    public func getSum(input: [Int]) -> Int {
        return input.reduce(.zero, +)
    }
    
    public func makeList() -> [Int] {
        let randomLength = Int.random(in: 0...100)
        return (0..<randomLength).map { _ in .random(in: 1...20) }
    }
}

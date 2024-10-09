//
//  ProductModel.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import Foundation

struct ProductModel: Decodable {
    
    let id: Int
    let title: String
    let price: Double
}

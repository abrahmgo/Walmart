//
//  ViewFactory.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import UIKit

struct ViewFactory {
    
    static func build() -> UIViewController {
        let viewModel = ViewModel()
        let viewController = ViewController(viewModel: viewModel)
        return viewController
    }
}

//
//  ViewController.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var button: UIButton?
    private let viewModel: ViewModelType
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        let buttonSize = CGSize(width: 200, height: 75)
        let buttonOrigin = CGPoint(x: view.frame.width/2 - 100, y: view.bounds.height/2)
        let buttonFrame = CGRect(origin: buttonOrigin, size: buttonSize)
        button = UIButton(frame: buttonFrame)
        button?.backgroundColor = .blue
        button?.setTitle("Funcion sum array", for: .normal)
        button?.addTarget(self, action: #selector(getSumArray), for: .touchUpInside)
        if let viewButton = button {
            view.addSubview(viewButton)
        }
    }
    
    @objc func getSumArray() {
        // it a generate a random list
        let sum = viewModel.getArraySum()
        print("sum \(sum)\n")
    }
}


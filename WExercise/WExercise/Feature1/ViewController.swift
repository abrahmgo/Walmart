//
//  ViewController.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView?
    private let viewModel: ViewModelType
    private var products: [ProductModel] = []
    
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
        downloadData()
    }
    
    private func setupUI() {
        tableView = UITableView(frame: view.frame)
        tableView?.backgroundColor = .white
        tableView?.dataSource = self
        if let tableView = self.tableView {
            view.addSubview(tableView)
        }
    }
    
    private func downloadData() {
        Task {
            do {
                let data = try await viewModel.getData()
                products = data
                await MainActor.run {
                    self.tableView?.reloadData()
                }
            } catch {
                print("error")
            }
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            }
            return cell
        }()
        let product = products[indexPath.row]
        cell.textLabel?.text = product.title
        cell.detailTextLabel?.text = "$ \(product.price)"
        return cell
    }
}

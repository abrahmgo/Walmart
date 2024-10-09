//
//  ViewController.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    private var mapView: MKMapView?
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
        mapView = MKMapView(frame: view.frame)
        if let mapView = self.mapView {
            view.addSubview(mapView)
        }
    }
    
    private func downloadData() {
        Task {
            do {
                let data = try await viewModel.getData()
                if let firstElement = data.first {
                    let coordinate = CLLocationCoordinate2D(latitude: firstElement.latitude,
                                                            longitude: firstElement.longitude)
                    setRegion(coordinate: coordinate)
                    setAnnotations(elements: data)
                }
            } catch {
                print(error)
            }
        }
    }
    
    @MainActor
    private func setAnnotations(elements: [ProductModel]) {
        let annotations = elements.map({
            let annotation = MKPointAnnotation()
            annotation.title = $0.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: $0.latitude,
                                                           longitude: $0.longitude)
            return annotation
        })
        
        annotations.forEach({ self.mapView?.addAnnotation($0) })
    }
    
    @MainActor
    private func setRegion(coordinate: CLLocationCoordinate2D) {
        guard let region = self.mapView?.regionThatFits(MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)) else {
            return
        }
        self.mapView?.setRegion(region, animated: true)
    }
}

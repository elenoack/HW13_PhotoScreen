//
//  AlbumsViewController.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

class AlbumsViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties
    
    private var screenView: ScreenView? {
        guard isViewLoaded else { return nil }
        return view as? ScreenView
    }
    
    public var model: [[Item]] = []
  
    private lazy var navigationButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Settings"
        button.image = UIImage(systemName: "plus")
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ScreenView()
        model = DataManger.shared.createModels()
        screenView?.collectionView.delegate = self
        screenView?.collectionView.dataSource = self
        setupView()
        configureView()
    }
}

// MARK: - Private

private extension AlbumsViewController {
    
    func setupView() {
        self.navigationItem.leftBarButtonItem = navigationButton
        self.title = "Альбомы"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
        
    func configureView() {
        let models = model
        models.forEach { [unowned self] model in
            screenView?.configureView(with: models)
        }
    }
}







    




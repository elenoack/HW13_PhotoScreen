//
//  AlbumsViewController.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

class AlbumsViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
    }
}

// MARK: - Private

private extension AlbumsViewController {
    
    func setupView() {
        view.backgroundColor = .white
        title = "Альбомы"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupCollectionView() {
      
    view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
}

// MARK: - UICollectionViewLayout

private extension AlbumsViewController {
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int,
             layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionLayout = Sections(rawValue: sectionIndex) else { return nil }
            
            switch sectionLayout {
            case .first:
                return nil
            case .second:
                return nil
            case .third:
                return nil
            case .fourth:
                return nil
            default:
                return nil
            }
        }
        return layout
    }
}

// MARK: - NSCollectionLayoutSection

enum Sections: Int {
    
    case first = 0
    case second = 1
    case third = 2
    case fourth = 3
}


// MARK: - UICollectionViewDataSource

extension AlbumsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 4
     }
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         switch section {
         case 0:
             return 0
         case 1:
             return 0
         case 2:
             return 0
         case 3:
             return 0
         default:
            return 0
         }
     }
     
//     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//
//}

}

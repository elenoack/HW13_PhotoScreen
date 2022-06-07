//
//  AlbumsViewController.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

class AlbumsViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties
    
    let arrayItems: [[Item]] = [
        [Item(text: "Недавние", image: UIImage(named: "house"), number: 3154),
         Item(text: "Избранное", image: UIImage(named: "cat"), number: 26),
         Item(text: "Documents", image: UIImage(named: "Documents"), number: 11),
         Item(text: "WhatsApp", image: UIImage(named: "flowers"), number: 1208),
         Item(text: "Lightroom", image: UIImage(named: "dog"), number: 67),
         Item(text: "Рецепты", image: UIImage(named: "recipes"), number: 34),
         Item(text: "Instagram", image: UIImage(named: "sea"), number: 104),
         Item(text: "VSCO", image: UIImage(named: "bicycle"), number: 89),],
        
        [Item(text: "Horses", image: UIImage(named: "horse"), number: 34),
         Item(text: "Зима", image: UIImage(named: "winter"), number: 22),
         Item(text: "Travel", image: UIImage(named: "travel"), number: 66),
         Item(text: "Deutsch", image: UIImage(named: "deutsch"), number: 103),],
        
        [],
        
        [],
    ]
    
    private lazy var navigationButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Settings"
        button.image = UIImage(systemName: "plus")
        return button
    }()
    
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
        self.navigationItem.leftBarButtonItem = navigationButton
        view.backgroundColor = .white
        title = "Альбомы"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupCollectionView() {
        collectionView.register(HorizontalCell.self, forCellWithReuseIdentifier: HorizontalCell.reuseID)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseID)
        
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
                return self.firstSection()
            case .second:
                return self.secondSection()
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

private extension AlbumsViewController {
    
    private func firstSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 12,
            leading: 6,
            bottom: 0,
            trailing: 6)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.95/2),
            heightDimension: .fractionalWidth(1)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )
        
        group.interItemSpacing = .fixed(88)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 12,
            bottom: 98,
            trailing: 12)
        section.orthogonalScrollingBehavior = .paging
        
        section.contentInsets.leading = 15
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        //            header.pinToVisibleBounds = true - оставила для себя!
        //            header.extendsBoundary = true
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func secondSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 6,
            bottom: 0,
            trailing: 6)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.95/2),
            heightDimension: .fractionalWidth(1)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 12,
            bottom: 0,
            trailing: 12)
        section.orthogonalScrollingBehavior = .paging
        
        section.contentInsets.leading = 15
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(55))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

// MARK: - UICollectionViewDataSource

extension AlbumsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arrayItems[0].count
        case 1:
            return arrayItems[1].count
        case 2:
            return arrayItems[2].count
        case 3:
            return arrayItems[3].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCell.reuseID, for: indexPath) as! HorizontalCell
        let item = arrayItems[indexPath.section][indexPath.row]
        switch (indexPath as NSIndexPath).section {
            
        case 0, 1:
            cell.photoImageView.image = item.image
            cell.namePhotoLabel.text = item.text
            cell.numberPhotosLabel.text = item.number.formattedWithSeparator
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseID, for: indexPath) as? HeaderView else {
            return HeaderView()
        }
        headerView.frame.size.height = 68
        
        switch indexPath.section  {
        case 0:
            headerView.label.text = "Мои альбомы"
            headerView.button.text = "Все"
        case 1:
            headerView.label.text = "Общие альбомы"
            headerView.button.text = "Все"
        default:
            break
        }
        return headerView
    }
}

    




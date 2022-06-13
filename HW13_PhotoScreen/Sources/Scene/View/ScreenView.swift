//
//  ScreenView.swift
//  HW13_PhotoScreen
//
//  Created by mac on 13.06.22.
//

import UIKit

final class ScreenView: UIView {
    // MARK: - Configuration
    
    func configureView(with models: [[Item]]) {
        self.models = models
        collectionView.reloadData()
    }
    
    // MARK: - Constants
    
    enum Metric {
        static let layoutIndent: CGFloat = 12
        static let leftIndentLayout: CGFloat = 6
        static let photoRadius: CGFloat = 10
        static let topIndentVerticalSection: CGFloat = 20
    }
    
    // MARK: - Properties
    
    private var models = [[Item]]()
    
    private lazy var navigationButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Settings"
        button.image = UIImage(systemName: "plus")
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HorizontalCell.self, forCellWithReuseIdentifier: HorizontalCell.reuseID)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseID)
        collectionView.register(VerticalCell.self, forCellWithReuseIdentifier: VerticalCell.reuseID)
        return collectionView
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .systemBackground
        setupCollectionView()
    }
    
    // MARK: - Private
    
    func setupCollectionView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

// MARK: - UICollectionViewLayout

private extension ScreenView {
    
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
                return self.thirdSection()
            case .fourth:
                return self.fourthSection()
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

// MARK: - NSCollectionLayoutSection - FirstSection

private extension ScreenView {
    
    private func firstSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.layoutIndent,
            leading: Metric.leftIndentLayout,
            bottom: .zero,
            trailing: Metric.leftIndentLayout)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(192),
            heightDimension: .absolute(399)
        )
    
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )
        
        group.interItemSpacing = .fixed(88)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = .zero
        section.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: Metric.layoutIndent,
            bottom: 112,
            trailing: Metric.layoutIndent)
        section.orthogonalScrollingBehavior = .paging
        
        section.contentInsets.leading = Metric.layoutIndent
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        //            header.pinToVisibleBounds = true
        //            header.extendsBoundary = true
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // MARK: - NSCollectionLayoutSection - SecondSection

    private func secondSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: Metric.leftIndentLayout,
            bottom: .zero,
            trailing: Metric.leftIndentLayout)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(192),
            heightDimension: .absolute(186)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: Metric.layoutIndent,
            bottom: 60,
            trailing: Metric.layoutIndent)
        section.orthogonalScrollingBehavior = .paging
        
        section.contentInsets.leading = Metric.layoutIndent
        
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
    
    // MARK: - NSCollectionLayoutSection - ThirdSection
    
    private func thirdSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(52)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.topIndentVerticalSection,
            leading: .zero,
            bottom: .zero,
            trailing: .zero)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize:  itemSize,
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.leading = Metric.layoutIndent
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: itemSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // MARK: - NSCollectionLayoutSection - FourthSection

    private func fourthSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(52)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.topIndentVerticalSection,
            leading: .zero,
            bottom: .zero,
            trailing: .zero)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize:  itemSize,
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.leading = Metric.layoutIndent
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: itemSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}


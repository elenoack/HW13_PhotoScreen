//
//  CellHeaders.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

class HeaderView: UICollectionReusableView {
    // MARK: - Properties
    
    static let reuseID = "Header"
    
    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        return line
    }()
    
    lazy var label: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .left
        lable.font = .systemFont(ofSize: 22, weight: .semibold)
        lable.textColor = .black
        return lable
    }()
    
    lazy var button: UILabel = {
        let button = UILabel()
        button.textAlignment = .right
        button.font = .systemFont(ofSize: 17, weight: .regular)
        button.textColor = .systemBlue
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Configuration

extension HeaderView {
    func configure() {
        
        addSubviewsForAutoLayout([
            stackView,
            lineSeparators
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            lineSeparators.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            lineSeparators.heightAnchor.constraint(equalToConstant: 1),
            lineSeparators.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            lineSeparators.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        stackView.addArrangedSubviewsForAutoLayout([
            label,
            button,
        ])
    }
}

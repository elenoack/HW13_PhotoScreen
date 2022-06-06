//
//  SearchViewController.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.backgroundColor = .white
        title = "Для Вас"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}


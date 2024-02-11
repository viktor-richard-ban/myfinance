//
//  DashboardViewController.swift
//  myfinance
//
//  Created by Viktor Bán on 09/02/2024.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    // MARK: - Private properties
    private let balanceComponent = BalanceComponent()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(balanceComponent)
        balanceComponent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            balanceComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            balanceComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            balanceComponent.topAnchor.constraint(equalTo: view.topAnchor),
            balanceComponent.heightAnchor.constraint(equalToConstant: 220.0)
        ])
    }


}


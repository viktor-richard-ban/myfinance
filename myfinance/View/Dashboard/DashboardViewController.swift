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
    private let overviewComponent = OverviewComponent()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(balanceComponent)
        balanceComponent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            balanceComponent.topAnchor.constraint(equalTo: view.topAnchor),
            balanceComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            balanceComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            balanceComponent.heightAnchor.constraint(equalToConstant: 220.0)
        ])
        
        view.addSubview(overviewComponent)
        overviewComponent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewComponent.topAnchor.constraint(equalTo: balanceComponent.bottomAnchor, constant: -32.0),
            overviewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            overviewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            overviewComponent.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -26),
        ])
    }


}


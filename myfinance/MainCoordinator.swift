//
//  MainCoordinator.swift
//  myfinance
//
//  Created by Viktor Bán on 09/02/2024.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let viewController = DashboardViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}

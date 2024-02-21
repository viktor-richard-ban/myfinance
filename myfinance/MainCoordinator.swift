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
    }
    
    func start() {
        let viewController = DashboardViewController(viewModel: DashboardViewModel(coordinator: self))
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToDetailedFinancialStatistics() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .yellow
        navigationController.pushViewController(viewController, animated: true)
    }
}

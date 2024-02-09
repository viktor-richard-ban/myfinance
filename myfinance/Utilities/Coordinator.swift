//
//  Coordinator.swift
//  myfinance
//
//  Created by Viktor Bán on 09/02/2024.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

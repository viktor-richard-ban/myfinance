//
//  SpendingDetailsViewController.swift
//  myfinance
//
//  Created by Viktor Bán on 02/03/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Charts

class SpendingDetailsViewController: BaseViewController {
    
    // MARK: - ViewModel
    private let viewModel: SpendingDetailsViewModel
    private var disposeBag = DisposeBag()
    
    // MARK: - Private properties
    private let overviewComponent = SpendingOverviewComponent()
    private let summarizedList = SummarizedList()
    
    // MARK: - Inits
    init(viewModel: SpendingDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
    }
    
    private func setupBindings() {
        disposeBag = DisposeBag()
        
        let data = viewModel.bind()
        overviewComponent.bind(data.overviewComponentData)
        summarizedList.bind(data.topMerchants)
    }
    
    // MARK: - Setup
    private func setupComponents() {
        overviewComponent.translatesAutoresizingMaskIntoConstraints = false
        summarizedList.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overviewComponent)
        view.addSubview(summarizedList)
        
        NSLayoutConstraint.activate([
            overviewComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            overviewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overviewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            summarizedList.topAnchor.constraint(equalTo: overviewComponent.bottomAnchor, constant: 28.0),
            summarizedList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            summarizedList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
        ])
    }
}

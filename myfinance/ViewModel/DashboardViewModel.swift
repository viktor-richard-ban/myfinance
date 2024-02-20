//
//  DashboardViewModel.swift
//  myfinance
//
//  Created by Viktor Bán on 17/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

final class DashboardViewModel: ViewModel {
    
    // MARK: Private properties
    private var coordinator: MainCoordinator
    private var disposeBag = DisposeBag()
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    struct Data {
        let balanceComponentViewModel: BalanceComponent.Data
        let overviewComponentData: OverviewComponent.Data
    }
    
    struct Events {
        let overviewComponentEvents: OverviewComponent.Events
    }
    
    func bind() -> Data {
        return Data(balanceComponentViewModel: BalanceComponent.Data(balance: .just("$1,755"),
                                                                     info: .just("Avaliable balance"),
                                                                     avatar: .never()),
                    overviewComponentData: OverviewComponent.Data(incomeTitle: .just("Spent"),
                                                                  incomeValue: .just("$1,999"),
                                                                  outcomeTitle: .just("Earned"),
                                                                  outcomeValue: .just("$1,999")))
    }
    
    func listen(_ events: Events) {
        events.overviewComponentEvents
            .more
            .bind { [coordinator] in
                coordinator.navigateToDetailedFinancialStatistics()
            }
            .disposed(by: disposeBag)
    }
    
}

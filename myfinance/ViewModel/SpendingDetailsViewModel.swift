//
//  SpendingDetailsViewModel.swift
//  myfinance
//
//  Created by Viktor Bán on 02/03/2024.
//

import Foundation
import RxSwift
import RxCocoa

final class SpendingDetailsViewModel: ViewModel {
    
    // MARK: Private properties
    private var disposeBag = DisposeBag()
    
    struct Data {
        let overviewComponentData: SpendingOverviewComponent.Data
        let topMerchants: SummarizedList.Data
    }
    
    struct Events {
        // no-event
    }
    
    func bind() -> Data {
        let overviewComponentData = OverviewComponent.Data(incomeTitle: .just("Spent"),
                                                           incomeValue: .just("$1,999"),
                                                           outcomeTitle: .just("Earned"),
                                                           outcomeValue: .just("$1,999"),
                                                           info: .never(),
                                                           ctaButtonTitle: .never(),
                                                           isDetailed: .just(false))
        return Data(overviewComponentData: SpendingOverviewComponent.Data(title: .just(NSAttributedString(string: "Your balance is $1,750")),
                                                                          overviewComponentData: overviewComponentData),
                    topMerchants: SummarizedList.Data(listItems: .just([
                        "Phone", "Food"
                    ])))
    }
    
    func listen(_ events: Events) {
        // no-events
    }
    
}

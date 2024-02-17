//
//  DashboardViewModel.swift
//  myfinance
//
//  Created by Viktor Bán on 17/02/2024.
//

import Foundation

final class DashboardViewModel: ViewModel {
    struct Data {
        let balanceComponentViewModel: BalanceComponentViewModel
    }
    
    struct Events {
        /* no-events */
    }
    
    func bind() -> (data: Data, events: Events) {
        let data = Data(balanceComponentViewModel: BalanceComponentViewModel())
        let events = Events()
        
        return (data, events)
    }
}

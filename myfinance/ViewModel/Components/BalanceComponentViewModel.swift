//
//  BalanceComponentViewModel.swift
//  myfinance
//
//  Created by Viktor Bán on 17/02/2024.
//

import UIKit
import RxCocoa

final class BalanceComponentViewModel: ViewModel {
    struct Data {
        let balance: Driver<String?>
        let info: Driver<String?>
        let avatar: Driver<UIImage?>
    }
    
    struct Events {
        /* no-events */
    }
    
    func bind() -> (data: Data, events: Events) {
        let data = Data(balance: .just("$1,755"),
                        info: .just("Available balance"),
                        avatar: .never())
        let events = Events()
        
        return (data, events)
    }
}

//
//  ViewModel.swift
//  myfinance
//
//  Created by Viktor Bán on 17/02/2024.
//

import Foundation

protocol ViewModel {
    associatedtype Data
    associatedtype Events
    
    func bind() -> Data
    func listen(_ events: Events)
}

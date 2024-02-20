//
//  DataBindable.swift
//  myfinance
//
//  Created by Viktor Bán on 20/02/2024.
//

import Foundation

protocol DataBindable {
    associatedtype Data
    
    func bind(_ data: Data)
}

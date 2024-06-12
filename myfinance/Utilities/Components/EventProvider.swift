//
//  EventProvider.swift
//  myfinance
//
//  Created by Viktor Bán on 20/02/2024.
//

import Foundation

protocol EventProvider {
    associatedtype Events
    
    var events: Events { get }
}

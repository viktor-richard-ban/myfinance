//
//  UIView+NSLayoutConstraint.swift
//  myfinance
//
//  Created by Viktor Bán on 17/02/2024.
//

import UIKit

extension UIView {
    func anchorToSuperview() {
        guard let superview = self.superview else { return }
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor)
        ])
    }
}

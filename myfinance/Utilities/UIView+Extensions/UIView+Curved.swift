//
//  UIView+Curved.swift
//  myfinance
//
//  Created by Viktor Bán on 10/02/2024.
//

import UIKit

extension UIView {
    // source: https://stackoverflow.com/questions/52495806/rounded-curve-edge-for-uiview
    func addBottomRoundedEdge() {
        let offset: CGFloat = (self.frame.width * 1.5)
        let bounds: CGRect = self.bounds
        
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width , height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset , height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        self.layer.mask = maskLayer
    }
}

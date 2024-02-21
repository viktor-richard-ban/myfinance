//
//  Avatar.swift
//  myfinance
//
//  Created by Viktor Bán on 09/02/2024.
//

import UIKit

final class Avatar: UIView {
    
    // MARK: - Public properties
    var image: UIImage? {
        get { imageView.image }
        set { imageView.image = newValue }
    }
    
    // MARK: - Private properties
    private let imageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setup() {
        layer.cornerRadius = 18.0
        addSubview(imageView)
        imageView.anchorToSuperview()
    }
    
}

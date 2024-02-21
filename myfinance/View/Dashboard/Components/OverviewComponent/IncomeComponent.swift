//
//  IncomeComponent.swift
//  myfinance
//
//  Created by Viktor Bán on 11/02/2024.
//

import UIKit

final class IncomeComponent: UIView {
    // MARK: - Public properties
    var dotColor: UIColor? {
        get { dotView.backgroundColor }
        set { dotView.backgroundColor = newValue }
    }
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var value: String? {
        get { valueLabel.text }
        set { valueLabel.text = newValue }
    }
    
    // MARK: - Private properties
    private let dotView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let labelStack = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private let titleLabel = {
        var label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        return label
    }()
    
    private let valueLabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20.0, weight: .medium)
        return label
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
        labelStack.addArrangedSubview(titleLabel)
        labelStack.addArrangedSubview(valueLabel)
        
        dotView.layer.cornerRadius = 6
        
        addSubview(dotView)
        addSubview(labelStack)
        NSLayoutConstraint.activate([
            dotView.heightAnchor.constraint(equalToConstant: 12.0),
            dotView.widthAnchor.constraint(equalToConstant: 12.0),
            dotView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
            dotView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dotView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            dotView.trailingAnchor.constraint(equalTo: labelStack.leadingAnchor, constant: -16.0),
            dotView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelStack.topAnchor.constraint(equalTo: topAnchor),
            labelStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

#Preview {
    let button = IncomeComponent(frame: .zero)
    button.title = "Spent"
    button.value = "$1,999"
    button.dotColor = UIColor.midnightOrange
    return button
}

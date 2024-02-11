//
//  OverviewComponent.swift
//  myfinance
//
//  Created by Viktor Bán on 11/02/2024.
//

import UIKit

final class OverviewComponent: UIView {
    
    // MARK: - Private properties
    private let incomeView = IncomeComponent()
    private let outcomeView = IncomeComponent()
    
    private let incomeAndOutcomeStack = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private let line = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .superLightGray
        return view
    }()
    
    private let infoLabel = {
        var label = UILabel()
        label.text = "You spent more than in the last 3 months. Let's try to make it lower."
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        return label
    }()
    
    private let ctaButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tell me more", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor.lightPurple, for: .normal)
        button.setTitleColor(UIColor.darkPurple, for: .highlighted)
        return button
    }()
    
    private let containerStack = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle delegates
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 12
    }
    
    // MARK: - Setup
    private func setup() {
        backgroundColor = .white
        
        addSubview(containerStack)
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            containerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            containerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ctaButton.heightAnchor.constraint(equalToConstant: 30),
            line.heightAnchor.constraint(equalToConstant: 2.0),
            incomeAndOutcomeStack.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        incomeView.title = "Spent"
        incomeView.value = "$1,999"
        incomeView.dotColor = .midnightOrange
        incomeAndOutcomeStack.addArrangedSubview(incomeView)
        
        outcomeView.title = "Earned"
        outcomeView.value = "$3,650"
        outcomeView.dotColor = .lightPurple
        incomeAndOutcomeStack.addArrangedSubview(outcomeView)
        
        containerStack.addArrangedSubview(incomeAndOutcomeStack)
        containerStack.addArrangedSubview(line)
        containerStack.addArrangedSubview(infoLabel)
        
        let buttonContainer = UIView()
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.addSubview(ctaButton)
        NSLayoutConstraint.activate([
            ctaButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor),
            ctaButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor),
            ctaButton.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor),
            ctaButton.trailingAnchor.constraint(lessThanOrEqualTo: buttonContainer.trailingAnchor),
        ])
        containerStack.addArrangedSubview(buttonContainer)
    }
    
}

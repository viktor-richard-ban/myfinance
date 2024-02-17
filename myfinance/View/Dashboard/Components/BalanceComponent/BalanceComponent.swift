//
//  BalanceComponent.swift
//  myfinance
//
//  Created by Viktor Bán on 09/02/2024.
//

import UIKit
import RxSwift
import RxCocoa

final class BalanceComponent: UIView {
    
    // MARK: - ViewModel
    private let viewModel: BalanceComponentViewModel
    private var disposeBag = DisposeBag()
    
    // MARK: - Private properties
    private let gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.middleBlue.cgColor,
            UIColor.lightPurple.cgColor
        ]
        gradient.startPoint = CGPointMake(0.0, 1.0);
        gradient.endPoint = CGPointMake(1.0, 0.0);
        return gradient
    }()
    
    private let containerStack = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let labelContainerStack = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    private let balanceLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 28.0, weight: .semibold)
        return label
    }()
    private let infoLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        return label
    }()
    
    private let avatar = {
        let avatar = Avatar()
        avatar.backgroundColor = .white
        return avatar
    }()
    
    // MARK: - Inits
    init(viewModel: BalanceComponentViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        layer.addSublayer(gradient)
        setupComponent()
        setupBindings()
    }
    
    override init(frame: CGRect) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateBackground()
    }
    
    // MARK: - Setup
    private func setupComponent() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerStack)
        containerStack.addArrangedSubview(labelContainerStack)
        labelContainerStack.addArrangedSubview(balanceLabel)
        labelContainerStack.addArrangedSubview(infoLabel)
        containerStack.addArrangedSubview(avatar)
        
        NSLayoutConstraint.activate([
            // Container stack
            containerStack.topAnchor.constraint(lessThanOrEqualTo: topAnchor),
            containerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
            containerStack.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            containerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0),
            containerStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // Avatar
            avatar.widthAnchor.constraint(equalToConstant: 50),
            avatar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func updateBackground() {
        gradient.frame = bounds
        addBottomRoundedEdge()
    }
    
    private func setupBindings() {
        disposeBag = DisposeBag()
        
        let dataAndEvents = viewModel.bind()
        let data = dataAndEvents.data
        
        data.balance.drive(balanceLabel.rx.text).disposed(by: disposeBag)
        data.info.drive(infoLabel.rx.text).disposed(by: disposeBag)
        data.avatar.drive(avatar.rx.image).disposed(by: disposeBag)
    }
    
}

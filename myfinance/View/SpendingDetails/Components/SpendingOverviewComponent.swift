//
//  SpendingOverviewComponent.swift
//  myfinance
//
//  Created by Viktor Bán on 02/03/2024.
//

import UIKit
import RxSwift
import RxCocoa

final class SpendingOverviewComponent: UIView {
    
    // MARK: - Rx
    private var disposeBag = DisposeBag()
    
    // MARK: - Public properties
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    // MARK: - Private properties
    private let titleLabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        return label
    }()
    
    private let contentStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private let overviewComponent = {
        let component = OverviewComponent()
        component.translatesAutoresizingMaskIntoConstraints = false
        return component
    }()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    private func setupComponents() {
        addSubview(contentStackView)
        addSubview(overviewComponent)
        
        
        NSLayoutConstraint.activate([
            contentStackView.heightAnchor.constraint(equalToConstant: 150),
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: overviewComponent.topAnchor, constant:16),
            
            overviewComponent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            overviewComponent.bottomAnchor.constraint(equalTo: bottomAnchor),
            overviewComponent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28)
        ])
        
        contentStackView.addArrangedSubview(titleLabel)
    }
    
}

// MARK: Data binding
extension SpendingOverviewComponent: DataBindable {
    struct Data {
        let title: Driver<NSAttributedString?>
        let overviewComponentData: OverviewComponent.Data
    }
    
    func bind(_ data: Data) {
        disposeBag = DisposeBag()
        
        data.title.drive(titleLabel.rx.attributedText).disposed(by: disposeBag)
        overviewComponent.bind(data.overviewComponentData)
    }
}

#Preview {
    let component = SpendingOverviewComponent(frame: .zero)
    component.title = "Title"
    return component
}

//
//  SummarizedList.swift
//  myfinance
//
//  Created by Viktor Bán on 03/03/2024.
//

import UIKit
import RxSwift
import RxCocoa

final class SummarizedList: UIView {
    
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
        label.text = "Top merchant"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        return label
    }()
    
    private let contentStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
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
        addSubview(titleLabel)
        addSubview(contentStackView)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentStackView.topAnchor, constant: -8.0),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
}

extension SummarizedList: DataBindable {
    struct Data {
        let listItems: Driver<[String]>
    }
    
    func bind(_ data: Data) {
        disposeBag = DisposeBag()
        for subview in contentStackView.arrangedSubviews {
            contentStackView.removeArrangedSubview(subview)
        }
        
        data.listItems.drive { [contentStackView] values in
            for value in values {
                let item = SummarizedList.Item()
                item.title = value
                contentStackView.addArrangedSubview(item)
            }
        }
        .disposed(by: disposeBag)
    }
}

extension SummarizedList {
    final class Item: UIView, DataBindable {
        
        // MARK: - Public properties
        var title: String? {
            get { titleLabel.text }
            set { titleLabel.text = newValue }
        }
        
        var subtitle: String? {
            get { subtitleLabel.text }
            set { subtitleLabel.text = newValue }
        }
        
        var image: UIImage? {
            get { imageView.image }
            set { imageView.image = newValue }
        }
        
        // MARK: - Private properties
        private let separatorView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .lightGray.withAlphaComponent(0.15)
            return view
        }()
        
        private let imageContainerView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            view.layer.cornerRadius = 12.0
            return view
        }()
        
        private let imageView = {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.image = .actions
            return view
        }()
        
        private let titleLabel = {
            var label = UILabel()
            label.text = "Starbucks"
            label.numberOfLines = 1
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = .systemFont(ofSize: 16.0, weight: .regular)
            return label
        }()
        
        private let subtitleLabel = {
            var label = UILabel()
            label.text = "4 transactions"
            label.numberOfLines = 1
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .gray
            label.font = .systemFont(ofSize: 12.0, weight: .medium)
            return label
        }()
        
        private let priceLabel = {
            var label = UILabel()
            label.text = "$245"
            label.numberOfLines = 1
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = .systemFont(ofSize: 16.0, weight: .medium)
            label.textAlignment = .right
            return label
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
            backgroundColor = .clear
            
            imageContainerView.addSubview(imageView)
            addSubview(imageContainerView)
            addSubview(separatorView)
            
            let textContainerView = UIView()
            textContainerView.translatesAutoresizingMaskIntoConstraints = false
            textContainerView.backgroundColor = .clear
            textContainerView.addSubview(titleLabel)
            textContainerView.addSubview(subtitleLabel)
            addSubview(textContainerView)
            
            addSubview(priceLabel)
            
            NSLayoutConstraint.activate([
                imageContainerView.heightAnchor.constraint(equalToConstant: 45),
                imageContainerView.widthAnchor.constraint(equalToConstant: 45),
                imageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                imageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                imageContainerView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -20),
                
                imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor, constant: 4),
                imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: 4),
                imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: -4),
                imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: -4),
                
                textContainerView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor),
                textContainerView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
                textContainerView.leadingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: 16.0),
                textContainerView.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
                
                priceLabel.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
                priceLabel.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
                priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                priceLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.25, constant: 16.0),
                
                titleLabel.heightAnchor.constraint(equalTo: textContainerView.heightAnchor, multiplier: 0.5),
                titleLabel.topAnchor.constraint(equalTo: textContainerView.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor),
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
                subtitleLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor),
                subtitleLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor),
                subtitleLabel.bottomAnchor.constraint(equalTo: textContainerView.bottomAnchor),
                
                separatorView.heightAnchor.constraint(equalToConstant: 1.0),
                separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
                separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
                separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }
        
        // MARK: - DataBindable
        struct Data {
            let image: UIImage
            let title: String
            let subtitle: String
            let price: String?
        }
        
        func bind(_ data: Data) {
            title = data.title
        }
    }
}

#Preview {
    let component = SummarizedList(frame: .zero)
    component.title = "Title"
    return component
}

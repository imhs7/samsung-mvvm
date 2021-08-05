//
//  ProductTableViewCell.swift
//  Samsung
//
//  Created by Hemant Sharma on 04/08/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var productImageView: UIImageView = {
        let productImage = UIImageView()
        productImage.translatesAutoresizingMaskIntoConstraints = false
        return productImage
    }()
    
    var productName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    internal lazy var productPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    internal lazy var productOfferPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = label.font.withSize(16)
        return label
    }()
    
    internal lazy var productStrikeThroughPriceDisplay: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = label.font.withSize(12)
        label.textColor = .red
        return label
    }()
    
    internal lazy var productBookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ADD", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        styleView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleView()
    {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        containerView.addSubview(productImageView)
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            productImageView.widthAnchor.constraint(equalToConstant: 100),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            productImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        containerView.addSubview(productName)
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            productName.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            productName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
        productName.numberOfLines = 0
        productName.font = UIFont.systemFont(ofSize: 18)
        
        containerView.addSubview(productPrice)
        NSLayoutConstraint.activate([
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
            productPrice.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            productPrice.widthAnchor.constraint(equalToConstant: 120)
        ])
        productName.font = UIFont.systemFont(ofSize: 16)

        containerView.addSubview(productOfferPrice)
        NSLayoutConstraint.activate([
            productOfferPrice.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 8),
            productOfferPrice.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            productOfferPrice.widthAnchor.constraint(equalToConstant: 120)
        ])
        productOfferPrice.font = UIFont.systemFont(ofSize: 14)
        
        containerView.addSubview(productStrikeThroughPriceDisplay)
        NSLayoutConstraint.activate([
            productStrikeThroughPriceDisplay.topAnchor.constraint(equalTo: productOfferPrice.bottomAnchor, constant: 8),
            productStrikeThroughPriceDisplay.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            productStrikeThroughPriceDisplay.widthAnchor.constraint(equalToConstant: 120)
        ])
        productStrikeThroughPriceDisplay.font = UIFont.systemFont(ofSize: 12)
        
        containerView.addSubview(productBookButton)
        NSLayoutConstraint.activate([
            productBookButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            productBookButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            productBookButton.widthAnchor.constraint(equalToConstant: 72),
            productBookButton.heightAnchor.constraint(equalToConstant: 40)

        ])


        
    }

    func configure(with viewModel: ProductTableViewCellViewModel) {
        productImageView.downloaded(from: viewModel.productImageUrlString)
        productName.text = viewModel.productName
        productPrice.text = viewModel.productPrice
        productOfferPrice.text = viewModel.productOfferPrice
        productStrikeThroughPriceDisplay.attributedText = viewModel.productStrikeThroughPriceDisplay?.strikeThroughText()
    }

   func configure(images: String?, name: String?, priceDisplay: String?, offerPriceDisplay: String?, strikeThroughPriceDisplay: String?) {        productImageView.downloaded(from: images)
        productName.text = name
        productPrice.text = priceDisplay
        productOfferPrice.text = offerPriceDisplay
        productStrikeThroughPriceDisplay.attributedText = strikeThroughPriceDisplay?.strikeThroughText()
    }
}

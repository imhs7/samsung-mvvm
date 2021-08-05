//
//  ProductTableViewCellViewModel.swift
//  Samsung
//
//  Created by Hemant Sharma on 04/08/21.
//

import Foundation

class ProductTableViewCellViewModel {
    
    let productImageUrlString: String?
    let productName: String?
    let productPrice: String?
    let productOfferPrice: String?
    let productStrikeThroughPriceDisplay: String?
    
    init(with model: Products?) {
        productImageUrlString = model?.images.first
        productName = model?.name ?? ""
        productPrice = model?.price?.priceDisplay
        productOfferPrice = model?.price?.offerPriceDisplay
        productStrikeThroughPriceDisplay = model?.price?.strikeThroughPriceDisplay ?? ""
    }
    
}

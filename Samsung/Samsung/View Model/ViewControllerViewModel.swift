//
//  ViewControllerViewModel.swift
//  Samsung
//
//  Created by Hemant Sharma on 04/08/21.
//

import Foundation

protocol ProductDataSourceProtocol: class {

}

protocol ProductDataDelegateProtocol: class {

}


class ViewControllerViewModel: NSObject {
    
    private var productListArray = [Products]()
    //private var productCellViewModels = [ProductTableViewCellViewModel]()
    private(set) var apiService =  APIService()
    
    func numberOfRowsInSection() -> Int {
//        for item in productListArray {
//            productCellViewModels.append(ProductTableViewCellViewModel(with: item))
//        }
        return productListArray.count
    }
    
    func getCellModelAtIndexpath(indexpath: IndexPath) -> ProductTableViewCellViewModel {
        return ProductTableViewCellViewModel(with: productListArray[indexpath.row])//productCellViewModels[indexpath.row]
    }

    private func updateProducts(with productModel: ProductModel?) {
        guard let productModel = productModel  else { return }
        productListArray = productModel.data?.products ?? []
    }
    
    func fetchProducts(completioner: @escaping ()->Void) {
        apiService.fetchProductDetails { (product) in
            self.updateProducts(with: product)
            completioner()
        }
    }
    
}

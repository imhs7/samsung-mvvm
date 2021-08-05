//
//  APIResponse.swift
//  Samsung
//
//  Created by Hemant Sharma on 04/08/21.
//

import Foundation

class APIService: NSObject {
    
    func fetchProductDetails(completion: @escaping (ProductModel?) -> Void) {
        let urlString = "https://www.blibli.com/backend/search/products?searchTerm=Samsung"
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { data, urlResponse, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(ProductModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(result)
                    }
                }
                catch{
                    print("Error: \(error)")
                }
            }
        }
        task.resume()
    }
}

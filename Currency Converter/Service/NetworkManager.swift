//
//  NetworkManager.swift
//  Currency Converter
//
//  Created by Neskin Ivan on 24.07.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//

import Foundation

class NetworkManager {
    func downloadData(url: String, completion: @escaping(ExchangeRates)->Void) {
                
                let request = URLRequest(url: URL(string: url)!)
                
                let task = URLSession.shared.dataTask(with: request) { (data, responce, error) in
                    guard let data = data else {return}
                    guard error == nil else { return }
                    do {
                        let objects = try JSONDecoder().decode(ExchangeRates.self, from: data)
                        completion(objects)
                        print(objects)
                    } catch let error {
                      print(error)
                    }
                }
                task.resume()
            }
}

//
//  CurrencyTableViewController.swift
//  Currency Converter
//
//  Created by Neskin Ivan on 27.07.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//

import UIKit

protocol CurrencyTableViewProtocol: class {
    var completion: ((String, Double) -> ())? { get set }
    func getData()
}

class CurrencyTableViewController: UITableViewController, CurrencyTableViewProtocol {
    var networkManager = NetworkManager()
    var currency:ExchangeRates?
    weak var viewController = ViewController()
    var completion: ((String, Double) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getData()
    }
    
    
    func getData() {
        networkManager.downloadData(url: "https://www.cbr-xml-daily.ru/daily_json.js") { (result) in
            self.currency = result
            DispatchQueue.main.async {
                            self.tableView.reloadData()
            }
           
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let values = Array((currency?.valute.values)!)[indexPath.row]
        let charCode = values.charCode
        let valueCur = values.value
        completion?(charCode, valueCur)
        self.dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let currArr = currency {
            return currArr.valute.keys.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentTableCell", for: indexPath) as! CurrentTableCell
        var keyValute = Array((currency?.valute.keys)!)[indexPath.row]
        let values = Array((currency?.valute.values)!)[indexPath.row]
        let charCode = values.charCode
        let name = values.name
        cell.configureWith(name: name, charCode: charCode)
        return cell
    }
    

}
    

//
//  ViewController.swift
//  Currency Converter
//
//  Created by Neskin Ivan on 24.07.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var charCodeLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    private let toSelect = "toSelect"
    private let secSelect = "secSelect"
    var networkManager = NetworkManager()
    var currency: [ExchangeRates]?
    var valueCurrency: Double?
    var valueSecCurrency: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func changeValute(_ sender: Any) {
        if let iGetString = inputTextField.text {
            if let isDouble = Double(iGetString) {
                if valueSecCurrency! > valueCurrency! {
                    var outValue = isDouble * valueCurrency!
                    outputLabel.text = "\(outValue)"
                }
                if valueSecCurrency! < valueCurrency! {
                    var outValue = isDouble * valueSecCurrency! / valueCurrency!
                    outputLabel.text = "\(outValue)"
                }
                
            }
        }
    }
}
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toSelect {
            if let tableVC = segue.destination as? CurrencyTableViewController {
            tableVC.completion = { charCode, value in
                self.charCodeLabel.text = charCode
                self.valueCurrency = value
            }
        }
    }
        if segue.identifier == secSelect {
                if let tableVC = segue.destination as? CurrencyTableViewController {
                tableVC.completion = { charCode, value in
                    self.inputLabel.text = charCode
                    self.valueSecCurrency = value
                }
            }
        }
        
  }
}

//
//  CurrentTableCell.swift
//  Currency Converter
//
//  Created by Neskin Ivan on 29.07.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//

import UIKit

class CurrentTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var charCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureWith(name: String, charCode: String){
        nameLabel.text = name
        charCodeLabel.text = charCode
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

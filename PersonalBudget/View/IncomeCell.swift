//
//  IncomeCell.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 19/06/21.
//

import UIKit

class IncomeCell: UITableViewCell {
    @IBOutlet weak var incomeName: UILabel!
    @IBOutlet weak var incomeNominal: UILabel!
    @IBOutlet weak var incomePercentage: UILabel!
    @IBOutlet weak var incomeColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

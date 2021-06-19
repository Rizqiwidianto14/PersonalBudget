//
//  ExpensesCell.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 19/06/21.
//

import UIKit

class ExpensesCell: UITableViewCell {
    @IBOutlet weak var colorIndicator: UIView!
    @IBOutlet weak var expenseName: UILabel!
    @IBOutlet weak var expensePrice: UILabel!
    @IBOutlet weak var expensePercentage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

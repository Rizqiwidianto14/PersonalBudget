//
//  StructViewController.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 20/06/21.
//

import UIKit

class StructViewController: UIViewController {

    @IBOutlet weak var backToButton: UIView!
    var expenses = ExpenseModel()
    var expensess = [ExpenseModel]()
    var balance = Int()
    var expenseBudget = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackButton()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMainPage(_ sender: Any) {
        
        if expensess[0].expensesPrice == 0 {
            expensess.removeFirst()
        }
        
        if let rootVC = navigationController?.viewControllers.first as? MenuViewController {
            rootVC.expense = expenses
            rootVC.expenses = expensess
            rootVC.balance = balance
            rootVC.expenseBudget = expenseBudget
        }

        navigationController?.popToRootViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    
    func setUpBackButton(){
        backToButton.backgroundColor = UIColor(string: "#0E4B78")
    }
    

}

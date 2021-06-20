//
//  MenuViewController.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 20/06/21.
//

import UIKit

class MenuViewController: UIViewController {
    var expense = ExpenseModel()
    var expenses = [ExpenseModel]()
 
    
    var balance = 10000000
    var expenseBudget = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        // Do any additional setup after loading the view.
    }
    @IBAction func personalBudget(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "MainViewController") as! MainViewController
        vc.expense = expense
        vc.expenses = expenses
        vc.balance = balance
        vc.expenseBudget = expenseBudget
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpNavBar(){
        let logo = UIImage(named: "livinmandiri.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.barTintColor = UIColor(string: "#0E4B78")
        navigationController?.navigationBar.tintColor = .white

    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

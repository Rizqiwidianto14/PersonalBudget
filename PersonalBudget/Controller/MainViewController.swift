//
//  ViewController.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 19/06/21.
//

import UIKit
import CarbonKit
import Charts


class MainViewController: UIViewController, CarbonTabSwipeNavigationDelegate{
    
    var carbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    var controllerNames = ["Pengeluaran", "Pemasukkan"]
    var expense = ExpenseModel()
    var expenses = [ExpenseModel]()
    var balance = Int()
    var expenseBudget = Int()
    var entries = [PieChartDataEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSegmentedView()
        setUpNavBar()
        carbonTabSwipeNavigation.reloadInputViews()
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(expense)
    }
 

    func setUpNavBar(){
        let logo = UIImage(named: "livinmandiri.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.barTintColor = UIColor(string: "#0E4B78")
        navigationController?.navigationBar.tintColor = .white

    }
    
    
    
    func setUpSegmentedView(){
        
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: controllerNames, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        carbonTabSwipeNavigation.toolbarHeight.constant = 50.0
        carbonTabSwipeNavigation.setIndicatorColor(UIColor(string: "#0E4B78"))
        carbonTabSwipeNavigation.setNormalColor(UIColor(string: "#0E4B78"))
        carbonTabSwipeNavigation.setSelectedColor(UIColor(string: "#0E4B78"))
        carbonTabSwipeNavigation.setTabExtraWidth(view.frame.width/4)
    }

    

    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        guard let storyboard = storyboard else {
            return UIViewController()
        }
        if expense.expensesPrice > 0 {
            expenseBudget += expense.expensesPrice
            balance -= expenseBudget
        }
        
        if index == 0 {
            let vc = storyboard.instantiateViewController(withIdentifier: "ExpensesViewController") as! ExpensesViewController
            vc.expense = expense
            vc.expenses = expenses
            vc.balance = balance
            vc.expenseBudget = expenseBudget
            print("entries: \(entries)")
            vc.entries = entries
            return vc
        } else {
            let vc = storyboard.instantiateViewController(withIdentifier: "IncomeViewController") as! IncomeViewController
            balance += expenseBudget
            vc.balance = balance
            return vc
        }
        
    }
    

}




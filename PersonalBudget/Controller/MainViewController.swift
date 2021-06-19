//
//  ViewController.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 19/06/21.
//

import UIKit
import CarbonKit

class MainViewController: UIViewController, CarbonTabSwipeNavigationDelegate{
    
    var carbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    var controllerNames = ["Pengeluaran", "Pemasukkan"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpSegmentedView()
        setUpNavBar()
 
    }
    
    func setUpNavBar(){
        let logo = UIImage(named: "livinmandiri.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.barTintColor = UIColor(string: "#0E4B78")

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
        if index == 0 {
            return storyboard.instantiateViewController(withIdentifier: "ExpensesViewController")
        } else {
            return storyboard.instantiateViewController(withIdentifier: "IncomeViewController")
        }
        
    }
    

}




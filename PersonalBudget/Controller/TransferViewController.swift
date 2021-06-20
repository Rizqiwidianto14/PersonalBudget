//
//  TransferViewController.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 19/06/21.
//

import UIKit
import DropDown
import Charts


class TransferViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var holderName: UILabel!
    @IBOutlet weak var accountBalance: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var rekeningField: UITextField!
    @IBOutlet weak var nominalField: UITextField!
    @IBOutlet weak var categoriesField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    
    let categoriesDropDown = DropDown()
    var categories = ["Biaya Listrik", "Biaya Wifi", "Gaya Hidup", "Makanan", "Investasi"]
    
    var expenses = ExpenseModel()
    var expensess = [ExpenseModel]()
    var balance = Int()
    var expenseBudget = Int()
    var entries = [PieChartDataEntry]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateField.delegate = self
        setUpNavBar()
        setUpAccountView()
        setUpNextButton()
        setUpCategoriesDropDown()
        self.hideKeyboardWhenTappedAround()

    }
    
   
    
  
    
    override func viewDidDisappear(_ animated: Bool) {
        dismiss(animated: true) {
            print("dismissed")
        }
    }
    
    
    func setUpNavBar(){
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Transfer"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationItem.leftItemsSupplementBackButton = true

    }
    
    func setUpAccountView(){
        accountView.layer.cornerRadius = 10
        holderName.textColor = UIColor(string: "#0E4B78")
        accountBalance.textColor = UIColor(string: "#0E4B78")

    }
    
    func setUpNextButton(){
        nextButton.backgroundColor = UIColor(string: "#0E4B78")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == categoriesField{
            categoriesDropDown.show()
            categoriesDropDown.isHidden = false
            categoriesField.endEditing(true)
        }
        
        if textField == dateField{
            dateField.text = ""
            dateField.textColor = UIColor.black
        }
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == dateField {
            if Int(dateField.text ?? "") ?? 31 > 30 {
                dateField.text = "Tanggal Harus Sesuai Dengan Format"
                dateField.textColor = UIColor.red
                return
            }
            
        }
    }
    
    
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        expenses.expensesName = descriptionField.text ?? ""
        expenses.expensesPrice = Int(nominalField.text ?? "") ?? 0
        expenses.expensesDate = Int(dateField.text ?? "") ?? 0
        expenses.category = categoriesField.text ?? ""
        
        
//        if categoriesField.text == "Biaya Listrik"{
//            expenses.category = 0
//        } else if categoriesField.text == "Biaya Wifi"{
//            expenses.category = 1
//        } else if categoriesField.text == "Gaya Hidup"{
//            expenses.category = 2
//        } else if categoriesField.text == "Makanan"{
//            expenses.category = 3
//        } else {
//            expenses.category = 4
//        }
        
        let vc = self.storyboard?.instantiateViewController(identifier: "StructViewController") as! StructViewController
        vc.expenses = expenses
        vc.expensess = expensess
        vc.balance = balance
        vc.expenseBudget = expenseBudget
        self.navigationController?.pushViewController(vc, animated: true)
        vc.entries = entries

        
    }
    func setUpCategoriesDropDown(){
        categoriesField.delegate = self
        categoriesDropDown.anchorView = categoriesField
        categoriesDropDown.topOffset = CGPoint(x: 0, y: -(categoriesDropDown.anchorView?.plainView.bounds.height)!)
        categoriesDropDown.dataSource = categories
        categoriesDropDown.selectionAction = { index, title in
            self.categoriesField.text = title
            
        }
        
        
    }

}

extension TransferViewController {
        func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(TransferViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    }

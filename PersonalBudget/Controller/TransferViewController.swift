//
//  TransferViewController.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 19/06/21.
//

import UIKit
import DropDown

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavBar()
        setUpAccountView()
        setUpNextButton()
        setUpCategoriesDropDown()
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

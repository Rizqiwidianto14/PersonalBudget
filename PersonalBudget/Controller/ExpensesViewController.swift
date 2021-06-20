//
//  ExpensesViewController.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 19/06/21.
//

import UIKit
import Charts

class ExpensesViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var pieChartView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var promoView: UIView!
    @IBOutlet weak var barChartView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var pieChart = PieChartView()
    var barChart = BarChartView()

    var expense = ExpenseModel()
    var balance = Int()
    var expenseBudget = Int()
    
    var expenses = [ExpenseModel]()
    var dateData = ["1-7","8-14", "15-21", "22-31"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        expenses.append(expense)
       
        
        balanceLabel.text = "IDR \(balance)"
        priceLabel.text = "IDR \(expenseBudget)"
        
        setUpPieCharts()
        setUpPromoView()
        setUpBarCharts()
        
 
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 3
        tableView.layer.borderColor = UIColor(string: "#F2F3F4").cgColor
    }
    
  
    
    func setUpPieCharts(){
        pieChart.frame = CGRect(x: 0, y: 0, width: self.pieChartView.frame.width/2, height: self.pieChartView.frame.height-50)
        
        pieChartView.layer.cornerRadius = 10
        pieChartView.layer.borderWidth = 3
        pieChartView.layer.borderColor = UIColor(string: "#F2F3F4").cgColor
        
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        pieChart.delegate = self
        self.pieChartView.addSubview(pieChart)

        NSLayoutConstraint.activate([
            pieChart.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            pieChart.leadingAnchor.constraint(equalTo: pieChartView.leadingAnchor , constant: 20),
            pieChart.trailingAnchor.constraint(equalTo: pieChartView.trailingAnchor , constant: -20),
            pieChart.bottomAnchor.constraint(equalTo: pieChartView.bottomAnchor, constant: -20)
        ])

        pieChart.centerText = "Juni 2021"
        self.backgroundView.addSubview(pieChartView)
        var entries = [PieChartDataEntry]()
     
  
        for element in expenses{
            entries.append(PieChartDataEntry(value: Double(element.expensesPrice), label: element.expensesName))
        }
        
        pieChart.legend.enabled = false
        pieChart.drawEntryLabelsEnabled = false
        let set = PieChartDataSet(entries: entries)
        set.drawValuesEnabled = false
        set.colors = ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: set)
        pieChart.data = data

    }
    
    @IBAction func transferButtonTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "TransferViewController") as! TransferViewController
        vc.expensess = expenses
        vc.balance = balance
        vc.expenseBudget = expenseBudget
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    func setUpBarCharts(){
        barChart.frame = CGRect(x: 0, y: 0, width: self.barChartView.frame.width/2, height: self.barChartView.frame.height-50)
        barChartView.layer.cornerRadius = 10
        barChartView.layer.borderWidth = 3
        barChartView.layer.borderColor = UIColor(string: "#F2F3F4").cgColor
        barChart.delegate = self
        
        
        var entries = [BarChartDataEntry]()
        for element in expenses{
            var x = Double()
            if element.expensesDate < 8{
                x = 0
            } else if element.expensesDate >= 8 && element.expensesDate < 15{
                x = 1
            } else if element.expensesDate >= 15 && element.expensesDate < 22{
                x = 2
            } else {
                x = 3
            }
            
            
            entries.append(BarChartDataEntry(x: x , y: Double(element.expensesPrice)))
        }
        
        
        
        let set = BarChartDataSet(entries: entries,label: "Date")
        barChart.doubleTapToZoomEnabled = false
        let data = BarChartData(dataSet: set)
        barChart.data = data
        barChart.drawValueAboveBarEnabled = false
        barChart.xAxis.labelPosition = .bottom
        barChart.xAxis.labelCount = 4
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: dateData)
        barChart.highlightPerTapEnabled = false
        self.backgroundView.addSubview(barChartView)
    }
    
    func setUpPromoView(){
        promoView.layer.cornerRadius = 10
        promoView.layer.borderColor = UIColor(string: "#F2F3F4").cgColor
        promoView.layer.borderWidth = 3
        barChart.translatesAutoresizingMaskIntoConstraints = false
        self.barChartView.addSubview(barChart)
        NSLayoutConstraint.activate([
            barChart.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20),
            barChart.leadingAnchor.constraint(equalTo: barChartView.leadingAnchor , constant: 20),
            barChart.trailingAnchor.constraint(equalTo: barChartView.trailingAnchor , constant: -20),
            barChart.bottomAnchor.constraint(equalTo: barChartView.bottomAnchor, constant: -20)
        ])
    }
}

extension ExpensesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpensesCell", for: indexPath) as! ExpensesCell
        cell.expenseName.text = expenses[indexPath.row].expensesName
        cell.expensePrice.text = "\(expenses[indexPath.row].expensesPrice)"
        
        if expenseBudget != 0 {
            let price = Double(expenses[indexPath.row].expensesPrice)
            let expenseBudgetNominal = Double(expenseBudget)
            let percentage = price/expenseBudgetNominal * 100
            cell.expensePercentage.text = "\(Int(percentage))%"
            
        } else {
            cell.expensePercentage.text = "\(expenseBudget)%"

        }
        
   
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CGFloat(100)
        return height
    }
    
    
}

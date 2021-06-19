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
    
    var pieChart = PieChartView()
    var barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPieCharts()
        setUpPromoView()
        setUpBarCharts()
        // Do any additional setup after loading the view.
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

        pieChart.centerText = "June 2021"
        self.backgroundView.addSubview(pieChartView)
        var entries = [ChartDataEntry]()
        
        for x in 0..<10{
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        pieChart.legend.enabled = false
        pieChart.drawEntryLabelsEnabled = false
        
        
        let set = PieChartDataSet(entries: entries)
        set.drawValuesEnabled = false
        set.colors = ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: set)
        pieChart.data = data

    }
    
    
    func setUpBarCharts(){
        barChart.frame = CGRect(x: 0, y: 0, width: self.barChartView.frame.width/2, height: self.barChartView.frame.height-50)
        
        
        barChartView.layer.cornerRadius = 10
        barChartView.layer.borderWidth = 3
        barChartView.layer.borderColor = UIColor(string: "#F2F3F4").cgColor
        barChart.delegate = self
        
        var entries = [BarChartDataEntry]()
        
        for x in 0..<10{
            entries.append((BarChartDataEntry(x: Double(x), y: Double(x))))
        }
        
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        barChart.doubleTapToZoomEnabled = false
        
        let data = BarChartData(dataSet: set)
        barChart.data = data

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

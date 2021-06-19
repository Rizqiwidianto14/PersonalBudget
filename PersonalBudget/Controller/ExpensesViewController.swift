//
//  ExpensesViewController.swift
//  PersonalBudget
//
//  Created by Rizqi Imam Gilang Widianto on 19/06/21.
//

import UIKit
import Charts

class ExpensesViewController: UIViewController {
    
    var pieChart = PieChartView()
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var pieChartView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCharts()
        // Do any additional setup after loading the view.
    }
    
    
    func setUpCharts(){
        pieChart.frame = CGRect(x: 0, y: 0, width: self.pieChartView.frame.width/2, height: self.pieChartView.frame.height-50)
        pieChartView.layer.cornerRadius = 10
        pieChartView.layer.borderWidth = 3
        pieChartView.layer.borderColor = UIColor(string: "#F2F3F4").cgColor
        
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

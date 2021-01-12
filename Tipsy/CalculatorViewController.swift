//
//  ViewController.swift
//  Tipsy
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var result = 0.0
    var tip = 0.1

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    override func viewDidLoad() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        tip = Double(getTipNumber(sender.currentTitle ?? "10%"))
        
        billTextField.endEditing(true)
    }
    
    private func getTipNumber(_ title: String) -> Double {
        let tipNumber = String(title.dropLast())
        
        return (Double(tipNumber) ?? 0.0) / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f",sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let doublePriceValue = (billTextField.text ?? "0").replacingOccurrences(of: ",", with: ".")
        
        let price = Double(doublePriceValue) ?? 0.0
        let people = Double(splitNumberLabel.text ?? "2") ?? 2.0
        
        result = (price + (price * tip)) / people
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.total = String(format: "%.2f", result)
            destinationVC.tip = String(format: "%.0f",tip * 100.0)
            destinationVC.people = splitNumberLabel.text ?? "2"
        }
    }
}


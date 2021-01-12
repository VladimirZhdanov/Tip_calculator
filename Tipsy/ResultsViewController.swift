//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by mac on 12.01.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var total: String = "0.0"
    var tip: String = "0"
    var people: String = "0"

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total
        settingsLabel.text = "Split between \(people) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

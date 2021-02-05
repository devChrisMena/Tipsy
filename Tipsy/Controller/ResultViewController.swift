//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Christopher Mena on 2/4/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    var totalResult  = ""
    var tip = 0.15
    var result  = ""
    var numberOfPeople  = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitAmountLabel.text = "$\(result)"
        totalAmountLabel.text = "Split between \(numberOfPeople), with \(tip * 100)% tip. Total is $\(totalResult)"
    }
}

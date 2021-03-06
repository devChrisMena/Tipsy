//
//  ViewController.swift
//  Tipsy
//
//  Created by Christopher Mena on 2/3/21.
//

import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipStepper: UIStepper!

    //Needed variables
    var numberOfPeople = 2
    var tipPercentages = [0.15, 0.18, 0.20]
    var tippingBrain: CalculateTipBrain?
    var tip = 0.0
    var totalResult = ""
    var splitResult = ""
    var tipAmount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.delegate = self
        tipStepper.minimumValue = Double(numberOfPeople)
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateUI()
    }
    
    func updateUI() -> Void {
        // Retrieve dada
        let defaults = UserDefaults.standard
        var fVal = defaults.double(forKey: "fVal")
        var sVal = defaults.double(forKey: "sVal")
        var tVal = defaults.double(forKey: "tVal")
        
        //Assign data
        tipPercentages = [Double(fVal) / 100, Double(sVal) / 100, Double(tVal) / 100]
        
        //Update labels
        tipControl.setTitle("\(fVal)%", forSegmentAt: 0)
        tipControl.setTitle("\(sVal)%", forSegmentAt: 1)
        tipControl.setTitle("\(tVal)%", forSegmentAt: 2)
        
        splitLabel.text = String(numberOfPeople)
    }
    @IBAction func splitStepperPressed(_ sender: UIStepper) {
        //Update Choose Split value
        numberOfPeople = Int(sender.value)
        splitLabel.text = String(numberOfPeople)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        // Generate and calculate data
        tip = tipPercentages[tipControl.selectedSegmentIndex]
        let bill = Double(billAmountTextField.text!) ?? 0.0
        tippingBrain = CalculateTipBrain(tip: tip, numberOfPeople: numberOfPeople, billTotal: bill)
        splitResult = tippingBrain?.getSplitAmountText() ?? ""
        totalResult = tippingBrain?.getTotalBillWithTipText() ?? ""
        tipAmount = tippingBrain?.getTipAmountText() ?? ""
        self.performSegue(withIdentifier: "goToResult", sender: self)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            //Force downcast
            let secondVC = segue.destination as! ResultViewController
            secondVC.numberOfPeople = numberOfPeople
            secondVC.tip = tip
            secondVC.totalResult = totalResult
            secondVC.result = splitResult
            secondVC.tipAmount = tipAmount
        }
    }
}

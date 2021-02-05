//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Christopher Mena on 2/5/21.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var firstTipField: UITextField!
    @IBOutlet weak var secondTipField: UITextField!
    @IBOutlet weak var thirdTipField: UITextField!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTipField.text = String(defaults.double(forKey: "fVal"))
        secondTipField.text = String(defaults.double(forKey: "sVal"))
        thirdTipField.text = String(defaults.double(forKey: "tVal"))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        getData()
    }
    
    func getData() -> Void {
        let fVal = Double(firstTipField.text!) ?? 15
        let sVal = Double(secondTipField.text!) ?? 18
        let tVal = Double(thirdTipField.text!) ?? 20
        // Save data
        defaults.set(fVal, forKey: "fVal")
        defaults.set(sVal, forKey: "sVal")
        defaults.set(tVal, forKey: "tVal")
        defaults.synchronize()
    }
}

//
//  ViewController.swift
//  Tip_Calculator_2.0
//
//  Created by Yaocheng Wu on 12/30/16.
//  Copyright © 2016 Yao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var calculationView: UIView!
    
    @IBOutlet weak var splitOne: UILabel!
    @IBOutlet weak var splitTwo: UILabel!
    @IBOutlet weak var splitThree: UILabel!
    @IBOutlet weak var splitFour: UILabel!
    @IBOutlet weak var splitFive: UILabel!
    @IBOutlet weak var splitSix: UILabel!
    @IBOutlet weak var splitSeven: UILabel!
    @IBOutlet weak var splitEight: UILabel!
    @IBOutlet weak var splitNine: UILabel!
    @IBOutlet weak var splitTen: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calculationView.isHidden = true
        billField.center = CGPoint(x: 145, y: 185)
        calculationView.center = CGPoint(x: 160, y: 528)
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        if billField.text != "" {
            view.endEditing(true)
        }
    }
    
    @IBAction func calculate(_ sender: AnyObject) {
        if billField.text == "" {
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.billField.center = CGPoint(x: 145, y: 185)
                            self.calculationView.center = CGPoint(x: 160, y: 528)
                            })
            calculationView.isHidden = true
        } else {
            calculationView.isHidden = false
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.billField.center = CGPoint(x: 145, y: 102)
                            self.calculationView.center = CGPoint(x: 160, y: 348)
            })
            
            let tipPercentages = [0.1, 0.12, 0.15, 0.20]
            let billAmount = Double(billField.text!) ?? 0
        
            let tipAmount = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
            let totalAmount = billAmount + tipAmount
            let splitAmounts = [ totalAmount,
                                 totalAmount/2,
                                 totalAmount/3,
                                 totalAmount/4,
                                 totalAmount/5,
                                 totalAmount/6,
                                 totalAmount/7,
                                 totalAmount/8,
                                 totalAmount/9,
                                 totalAmount/10 ]
            
            tipLabel.text = String(format: "$%.2f", tipAmount)
            totalLabel.text = String(format: "$%.2f", totalAmount)
            
            splitOne.text = String(format: "$%.2f", splitAmounts[0])
            splitTwo.text = String(format: "$%.2f", splitAmounts[1])
            splitThree.text = String(format: "$%.2f", splitAmounts[2])
            splitFour.text = String(format: "$%.2f", splitAmounts[3])
            splitFive.text = String(format: "$%.2f", splitAmounts[4])
            splitSix.text = String(format: "$%.2f", splitAmounts[5])
            splitSeven.text = String(format: "$%.2f", splitAmounts[6])
            splitEight.text = String(format: "$%.2f", splitAmounts[7])
            splitNine.text = String(format: "$%.2f", splitAmounts[8])
            splitTen.text = String(format: "$%.2f", splitAmounts[9])
        }
    }
}


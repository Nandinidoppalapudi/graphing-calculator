//
//  SecondViewController.swift
//  graphing-calculator
//
//  Created by student on 9/25/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class FormulaViewController: UIViewController {
    
    
    @IBOutlet weak var enterA: UITextField!
    @IBOutlet weak var enterB: UITextField!
    @IBOutlet weak var enterC: UITextField!
    
    @IBOutlet weak var solution1: UILabel!
    
    @IBOutlet weak var solution2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func Calculate(_ sender: Any) {
        if enterA.text != "" && enterB.text != "" && enterC.text != ""{
            if let enterA=Double(enterA.text!),let enterB=Double(enterB.text!),let enterC=Double(enterC.text!){
                if enterA != nil && enterB != nil && enterC != nil{
                    let subpart1 = enterB*enterB
                    let subpart2 = 4*enterA*enterC
                    let subpart3 = subpart1-subpart2
                    func squareroot()->Double{
                        let subpart = Double(enterB*enterB)-Double(4*enterA*enterC)
                        return subpart
                    }
                    let qudraticaFormula = -enterB + squareroot()/(2*enterA)
                    let qudraticaFormulaFormat = String(format: "%.2f", qudraticaFormula)
                    solution1.text = "\(qudraticaFormulaFormat)"
                    
                    let quadraticFormula1 = -enterB - squareroot()/(2*enterA)
                    let qudraticaFormulaFormat1 = String(format: "%.2f", quadraticFormula1)
                    solution2.text = "\(qudraticaFormulaFormat1)"
                }
                
            }
            else{
                let  valueA:Double? = Double(enterA.text!)
                let  valueB:Double? = Double(enterB.text!)
                let  valueC:Double? = Double(enterC.text!)
                if valueA == nil && valueB != nil && valueC != nil{
                    let ac = UIAlertController(title: "Invalid A value ", message: "Enter only numerics ",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA != nil && valueB == nil && valueC != nil{
                    let ac = UIAlertController(title: "Invalid B value ", message: "Enter only numerics ",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA != nil && valueB != nil && valueC == nil{
                    let ac = UIAlertController(title: "Invalid C value ", message: "Enter only numerics ",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA == nil && valueB == nil && valueC != nil{
                    let ac = UIAlertController(title: "Invalid A and B value ", message: "Enter only numerics ",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA != nil && valueB == nil && valueC == nil{
                    let ac = UIAlertController(title: "Invalid B and C value ", message: "Enter only numerics ",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA == nil && valueB != nil && valueC == nil{
                    let ac = UIAlertController(title: "Invalid A and C value ", message: "Enter only numerics ",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else
                {
                    let ac = UIAlertController(title: "Invalid A,B,C Svalue ", message: "Enter only numerics ",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
            }
        }
        else{
            
            if enterA.text == "" && enterB.text != "" && enterC.text != ""{
                let ac = UIAlertController(title: " No A value entered", message: "Enter  A value ",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text != "" && enterB.text == "" && enterC.text != ""{
                let ac = UIAlertController(title: " No B value entered", message: "Enter  B value ",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text != "" && enterB.text != "" && enterC.text == ""{
                let ac = UIAlertController(title: " No C value entered", message: "Enter  C value ",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text != "" && enterB.text == "" && enterC.text == ""{
                let ac = UIAlertController(title: " No B  and c value entered", message: "Enter  B and c value ",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text == "" && enterB.text != "" && enterC.text == ""{
                let ac = UIAlertController(title: " No A and C value entered", message: "Enter A and C value ",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text == "" && enterB.text == "" && enterC.text != ""{
                let ac = UIAlertController(title: " No A and B value entered", message: "Enter A and C value ",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
                
            else{
                let ac = UIAlertController(title: "No A,B,C value entered", message: "Enter  A,B,C value ",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
        }
    }
    
    
    
}


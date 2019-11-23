//
//  SecondViewController.swift
//  graphing-calculator
//
//  Created by student on 9/25/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Darwin

class FormulaViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var enterA: UITextField!
    @IBOutlet weak var enterB: UITextField!
    @IBOutlet weak var enterC: UITextField!
    
    @IBOutlet weak var solution1: UILabel!
    
    @IBOutlet weak var solution2: UILabel!
    
    @IBAction func Calculate(_ sender: Any) {
        if enterA.text != "" && enterB.text != "" && enterC.text != ""{
            if let enterA=Double(enterA.text!),let enterB=Double(enterB.text!),let enterC=Double(enterC.text!){
                if enterA == 0.0{
                    let ac = UIAlertController(title: "Zero Value", message: "A value cannot be zero",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
                else{
                    let discriminant = Double(enterB*enterB)-Double(4*enterA*enterC)
                    let isImaginary = discriminant < 0
                    let discrimimantAbsSqrt = sqrt(fabs(discriminant))
                    if isImaginary {
                        let qudraticaFormulaFormat1 = String(format: "%.2f", discrimimantAbsSqrt)
                        solution1.text = "(\(-enterB) + \(qudraticaFormulaFormat1)i)/\(2*enterA))"
                        let qudraticaFormulaFormat2 = String(format: "%.2f", discrimimantAbsSqrt)
                        solution2.text = "(\(-enterB) - \(qudraticaFormulaFormat2)i)/\(2*enterA))"
                        
                    }
                    else{
                        let qudraticaFormula = ((-enterB) + (discrimimantAbsSqrt))/(2*enterA)
                        let qudraticaFormulaFormat = String(format: "%.2f", qudraticaFormula)
                        solution1.text = "\(qudraticaFormulaFormat)"
                        
                        let quadraticFormula1 = ((-enterB) - (discrimimantAbsSqrt))/(2*enterA)
                        let qudraticaFormulaFormat1 = String(format: "%.2f", quadraticFormula1)
                        solution2.text = "\(qudraticaFormulaFormat1)"
                    }
                }
            }
                
            else{
                let  valueA:Double? = Double(enterA.text!)
                let  valueB:Double? = Double(enterB.text!)
                let  valueC:Double? = Double(enterC.text!)
                if valueA == nil && valueB != nil && valueC != nil{
                    let ac = UIAlertController(title: "Invalid A value", message: "Enter only numerics",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA != nil && valueB == nil && valueC != nil{
                    let ac = UIAlertController(title: "Invalid B value", message: "Enter only numerics",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA != nil && valueB != nil && valueC == nil{
                    let ac = UIAlertController(title: "Invalid C value", message: "Enter only numerics",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA == nil && valueB == nil && valueC != nil{
                    let ac = UIAlertController(title: "Invalid A and B value", message: "Enter only numerics",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA != nil && valueB == nil && valueC == nil{
                    let ac = UIAlertController(title: "Invalid B and C value", message: "Enter only numerics",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if valueA == nil && valueB != nil && valueC == nil{
                    let ac = UIAlertController(title: "Invalid A and C value", message: "Enter only numerics",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                    
                else
                {
                    let ac = UIAlertController(title: "Invalid A,B,C value", message: "Enter only numerics",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
            }
        }
        else{
            
            if enterA.text == "" && enterB.text != "" && enterC.text != ""{
                let ac = UIAlertController(title: "No A value entered", message: "Enter A value",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text != "" && enterB.text == "" && enterC.text != ""{
                let ac = UIAlertController(title: "No B value entered", message: "Enter B value",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text != "" && enterB.text != "" && enterC.text == ""{
                let ac = UIAlertController(title: "No C value entered", message: "Enter C value",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text != "" && enterB.text == "" && enterC.text == ""{
                let ac = UIAlertController(title: "No B and C value entered", message: "Enter B and C value",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text == "" && enterB.text != "" && enterC.text == ""{
                let ac = UIAlertController(title: "No A and C value entered", message: "Enter A and C value",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if enterA.text == "" && enterB.text == "" && enterC.text != ""{
                let ac = UIAlertController(title: "No A and B value entered", message: "Enter A and C value",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
                
            else{
                let ac = UIAlertController(title: "No A,B,C value entered", message: "Enter A,B,C value",
                                           preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterA.delegate = self
        enterB.delegate = self
        enterC.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enterA.resignFirstResponder()
        enterB.resignFirstResponder()
        enterC.resignFirstResponder()
        
        return true
    }
    
}



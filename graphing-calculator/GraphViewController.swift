//
//  FirstViewController.swift
//  graphing-calculator
//
//  Created by student on 9/25/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    
    
    @IBOutlet weak var x1TF: UITextField!
    @IBOutlet weak var y1TF: UITextField!
    @IBOutlet weak var x2TF: UITextField!
    @IBOutlet weak var y2TF: UITextField!
    
    
    @IBOutlet weak var mLBL: UILabel!
    
    @IBOutlet weak var yLBL: UILabel!
    
    @IBOutlet weak var yinterceptTF: UITextField!
    @IBOutlet weak var slopeTF: UITextField!
    
    @IBOutlet weak var aTF: UITextField!
    @IBOutlet weak var bTF: UITextField!
    @IBOutlet weak var cTF: UITextField!
    
    @IBOutlet weak var graphView: GraphView!
    
    @IBOutlet weak var getHashValue: UISlider!
    @IBOutlet weak var hashNumberLBL: UILabel!
    
    @IBAction func clearGraph(_ sender: UIButton) {
        x1TF.text = nil
        graphView.xPoint1 = Double(x1TF.text!)
        y1TF.text = nil
        graphView.yPoint1 = Double(y1TF.text!)
        x2TF.text = nil
        graphView.xPoint2 = Double(x2TF.text!)
        y2TF.text = nil
        graphView.yPoint2 = Double(y2TF.text!)
        mLBL.text = "m"
        yLBL.text = "b"
        
        yinterceptTF.text = nil
        graphView.yIntercept = Double(yinterceptTF.text!)
        slopeTF.text = nil
        graphView.slope = Double(slopeTF.text!)
        
        aTF.text = nil
        graphView.quadAvalue = Double(aTF.text!)
        bTF.text = nil
        graphView.quadBvalue = Double(bTF.text!)
        cTF.text = nil
        graphView.quadCvalue = Double(cTF.text!)
        
        graphView.setNeedsDisplay()
    }
    
    @IBAction func graphPointsEquation(_ sender: UIButton) {
        var y2: Double? = 0.0
        var y1: Double? = 0.0
        var x1: Double? = 0.0
        var x2: Double? = 0.0
        if x1TF.text != "" && x2TF.text != "" && y1TF.text != "" && y2TF.text != ""  {
            if let X1 = Double(x1TF.text!),let X2 = Double(x2TF.text!),let Y1 = Double(y1TF.text!),let Y2 = Double(y2TF.text!){
                if X2-X1 == 0.0{
                    let ac = UIAlertController(title: "Zero Value", message: "X2 and X1 cannot have same value",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
                
                else{
                if y2TF.text!.contains("/") && y1TF.text!.contains("/") && x1TF.text!.contains("/") && x2TF.text!.contains("/"){
                    y2 = graphView.solveFraction(fractionInput: y2TF.text!)
                    y1 = graphView.solveFraction(fractionInput: y1TF.text!)
                    x2 = graphView.solveFraction(fractionInput: x2TF.text!)
                    x1 = graphView.solveFraction(fractionInput: x1TF.text!)
                    
                } else {
                    y2 = Double(y2TF.text!)
                    y1 = Double(y1TF.text!)
                    x1 = Double(x1TF.text!)
                    x2 = Double(x2TF.text!)
                }
                graphView.yPoint2 = y2
                graphView.yPoint1 = y1
                let y = y2! - y1!
                graphView.xPoint1 = x1
                graphView.xPoint2 = x2
                let x = x2! - x1!
                
                let slope = y/x
                let slope1 = String(format: "%.2f", slope)
                mLBL.text = "\(slope1)"
                let yintercept = String(graphView.pointFindIntercept(x1: x1!, x2: x2!, y1: y1!, y2: y2!))
                let yinterceptFormat = String(format: "%.2f", yintercept)
                yLBL.text = "\(yinterceptFormat)"
                graphView.setNeedsDisplay()
                
            }
            }
            else{
                let X1 = Double(x1TF.text!)
                let X2 = Double(x2TF.text!)
                let Y1 = Double(y1TF.text!)
                let Y2 = Double(y2TF.text!)
                if X1 == nil && X2 != nil && Y1 != nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 == nil && Y1 != nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 != nil && Y1 == nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid Y1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 != nil && Y1 != nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 == nil && Y1 != nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X1 AND X2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 == nil && Y1 == nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X2 AND Y1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 == nil && Y1 != nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid X2 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 != nil && Y1 == nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid Y1 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 != nil && Y1 != nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid X1 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 != nil && Y1 == nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X1 AND Y1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 == nil && Y1 == nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X1, X2 AND Y1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 == nil && Y1 == nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid X2, Y1 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 != nil && Y1 == nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid X1, Y1 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 == nil && Y1 != nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid X1, X2 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                    
                    
                else
                {
                    let ac = UIAlertController(title: "Invalid X1, X2, Y1, Y2 values ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
            }
        }
        else{
            let X1 = (x1TF.text!)
            let X2 = (x2TF.text!)
            let Y1 = (y1TF.text!)
            let Y2 = (y2TF.text!)
            if X1 == "" && X2 != "" && Y1 != "" && Y2 != "" {
                let ac = UIAlertController(title: "No X1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 == "" && Y1 != "" && Y2 != "" {
                let ac = UIAlertController(title: "No X2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 != "" && Y1 == "" && Y2 != "" {
                let ac = UIAlertController(title: "No Y1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 != "" && Y1 != "" && Y2 == "" {
                let ac = UIAlertController(title: "No Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 == "" && Y1 != "" && Y2 != "" {
                let ac = UIAlertController(title: "No X1 AND X2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 == "" && Y1 == "" && Y2 != "" {
                let ac = UIAlertController(title: "No X2 AND Y1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 == "" && Y1 != "" && Y2 == "" {
                let ac = UIAlertController(title: "No X2 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 != "" && Y1 == "" && Y2 == "" {
                let ac = UIAlertController(title: "No Y1 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 != "" && Y1 != "" && Y2 == "" {
                let ac = UIAlertController(title: "No X1 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 != "" && Y1 == "" && Y2 != "" {
                let ac = UIAlertController(title: "No X1 AND Y1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 == "" && Y1 == "" && Y2 != "" {
                let ac = UIAlertController(title: "No X1, X2 AND Y1 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 == "" && Y1 == "" && Y2 == "" {
                let ac = UIAlertController(title: "No X2, Y1 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 != "" && Y1 == "" && Y2 == "" {
                let ac = UIAlertController(title: "No X1, Y1 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 == "" && Y1 != "" && Y2 == "" {
                let ac = UIAlertController(title: "No X1, X2 AND Y2 value ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
                
                
                
            else
            {
                let ac = UIAlertController(title: "No X1, X2, Y1, Y2 values ", message: "Enter only numerics ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
        }
    }
    
    
    
    @IBAction func graphStandardEquation(_ sender: UIButton) {
        
        if slopeTF.text != "" && yinterceptTF.text != "" {
            if let slope = Double(slopeTF.text!),let _ = Double(yinterceptTF.text!){
                let yIntercept = Double(yinterceptTF.text!)
                if slopeTF.text!.contains("/") && yinterceptTF.text!.contains("/"){
                    graphView.slope = graphView.solveFraction(fractionInput: slopeTF.text!)
                    graphView.yIntercept = graphView.solveFraction(fractionInput: yinterceptTF.text!)
                } else {
                    graphView.slope = slope
                    graphView.yIntercept = yIntercept
                }
                graphView.setNeedsDisplay()
            }
            else{
                let aVal = Double(slopeTF.text!)
                let bVal = Double(yinterceptTF.text!)
                if aVal == nil && bVal != nil {
                    let ac = UIAlertController(title: "Invalid m ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal != nil && bVal == nil {
                    let ac = UIAlertController(title: "Invalid b", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                
                    
                    
                else
                {
                    let ac = UIAlertController(title: "Invalid m and b value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
            }
        }
        else{
            
            if slopeTF.text == "" && yinterceptTF.text != "" {
                let ac = UIAlertController(title: " No  m value entered", message: "Enter  slope value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if slopeTF.text != "" && yinterceptTF.text == "" {
                let ac = UIAlertController(title: " No b value entered", message: "Enter  yintercept value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
                
            else if slopeTF.text == "" && yinterceptTF.text == ""{
                let ac = UIAlertController(title: " No m and b value entered ", message: "Enter slope and yintercept value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
                
            else{
                let ac = UIAlertController(title: "No slope and yintercept", message: "Enter  slope and yintercept ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
        }
        
    }
    
    
    @IBAction func graphQuadraticEquation(_ sender: UIButton) {
        if aTF.text != "" && bTF.text != "" && cTF.text != ""{
            if let aVal = Double(aTF.text!),let bVal = Double(bTF.text!),let cVal = Double(cTF.text!){
                
                if aTF.text!.contains("/") && bTF.text!.contains("/") && cTF.text!.contains("/"){
                    graphView.quadAvalue = graphView.solveFraction(fractionInput: aTF.text!)
                    graphView.quadBvalue = graphView.solveFraction(fractionInput: bTF.text!)
                    graphView.quadCvalue = graphView.solveFraction(fractionInput: cTF.text!)
                    
                } else {
                    graphView.quadAvalue = aVal
                    graphView.quadBvalue = bVal
                    graphView.quadCvalue = cVal
                }
                graphView.setNeedsDisplay()
            }
            else{
                let aVal = Double(aTF.text!)
                let bVal = Double(bTF.text!)
                let cVal = Double(cTF.text!)
                
                if aVal == nil && bVal != nil && cVal != nil{
                    let ac = UIAlertController(title: "Invalid A value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal != nil && bVal == nil && cVal != nil{
                    let ac = UIAlertController(title: "Invalid B value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal != nil && bVal != nil && cVal == nil{
                    let ac = UIAlertController(title: "Invalid C value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal == nil && bVal == nil && cVal != nil{
                    let ac = UIAlertController(title: "Invalid A and B value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal != nil && bVal == nil && cVal == nil{
                    let ac = UIAlertController(title: "Invalid B and C value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal == nil && bVal != nil && cVal == nil{
                    let ac = UIAlertController(title: "Invalid A and C value ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                    
                else
                {
                    let ac = UIAlertController(title: "Invalid A,B,C Svalue ", message: "Enter only numerics ",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
            }
        }
        else{
            
            if aTF.text == "" && bTF.text != "" && cTF.text != ""{
                let ac = UIAlertController(title: " No A value entered", message: "Enter  A value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text != "" && bTF.text == "" && cTF.text != ""{
                let ac = UIAlertController(title: " No B value entered", message: "Enter  B value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text != "" && bTF.text != "" && cTF.text == ""{
                let ac = UIAlertController(title: " No C value entered", message: "Enter  C value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text != "" && bTF.text == "" && cTF.text == ""{
                let ac = UIAlertController(title: " No B  and c value entered", message: "Enter  B and c value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text == "" && bTF.text != "" && cTF.text == ""{
                let ac = UIAlertController(title: " No A and C value entered", message: "Enter A and C value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text == "" && bTF.text == "" && cTF.text != ""{
                let ac = UIAlertController(title: " No A and B value entered", message: "Enter A and C value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
                
            else{
                let ac = UIAlertController(title: "No A,B,C value entered", message: "Enter  A,B,C value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHashValue.addTarget(self, action: #selector(GraphViewController.slideValueChanged(_:)), for: .valueChanged)
        
        graphView.getHashValue = Double(getHashValue.value)
        hashNumberLBL.text = String(getHashValue.value)
        mLBL.text = "m"
        yLBL.text = "b"
        graphView.setNeedsDisplay()
    }
    
    @objc func slideValueChanged(_ send: UISlider!) {
        let roundedValue = roundf(send.value)
        send.value = roundedValue
        graphView.getHashValue = Double(getHashValue.value)
        hashNumberLBL.text = String(getHashValue.value)
        graphView.setNeedsDisplay()
    }
    
}

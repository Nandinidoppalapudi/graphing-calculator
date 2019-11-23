//
//  FirstViewController.swift
//  graphing-calculator
//
//  Created by student on 9/25/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, UITextFieldDelegate {
    
    
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
            if y2TF.text!.contains("/") || y1TF.text!.contains("/") || x2TF.text!.contains("/") || x1TF.text!.contains("/") {
                if y2TF.text!.contains("/") {
                    y2 = graphView.solveFraction(fractionInput: y2TF.text!)
                } else {
                    y2 = Double(y2TF.text!)
                    if y2 == nil {
                        let ac = UIAlertController(title: "Invalid Y2 value", message: "Enter only numerics",preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(action)
                        self.present(ac, animated: true)
                    }
                }
                if y1TF.text!.contains("/") {
                    y1 = graphView.solveFraction(fractionInput: y1TF.text!)
                } else {
                    y1 = Double(y1TF.text!)
                    if y1 == nil {
                        let ac = UIAlertController(title: "Invalid Y1 value", message: "Enter only numerics",preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(action)
                        self.present(ac, animated: true)
                    }
                }
                if x2TF.text!.contains("/") {
                    x2 = graphView.solveFraction(fractionInput: x2TF.text!)
                } else {
                    x2 = Double(x2TF.text!)
                    if x2 == nil {
                        let ac = UIAlertController(title: "Invalid X2 value", message: "Enter only numerics",preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(action)
                        self.present(ac, animated: true)
                    }
                }
                if x1TF.text!.contains("/") {
                    x1 = graphView.solveFraction(fractionInput: x1TF.text!)
                } else {
                    x1 = Double(x1TF.text!)
                    if x1 == nil {
                        let ac = UIAlertController(title: "Invalid X1 value", message: "Enter only numerics",preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(action)
                        self.present(ac, animated: true)
                    }
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
                let yintercept = graphView.pointFindIntercept(x1: x1!, x2: x2!, y1: y1!, y2: y2!)
                let yinterceptFormat = String(format: "%.2f", yintercept)
                yLBL.text = "\(yinterceptFormat)"
                graphView.setNeedsDisplay()
            }
            else if let X1 = Double(x1TF.text!),let X2 = Double(x2TF.text!),let Y1 = Double(y1TF.text!),let Y2 = Double(y2TF.text!){
                if X2-X1 == 0.0{
                    let ac = UIAlertController(title: "Zero Value", message: "X2 and X1 cannot have same value",
                                               preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
                
                else{
                    y2 = Double(y2TF.text!)
                    y1 = Double(y1TF.text!)
                    x1 = Double(x1TF.text!)
                    x2 = Double(x2TF.text!)
                    
                    graphView.yPoint2 = y2
                    graphView.yPoint1 = y1
                    let y = y2! - y1!
                    graphView.xPoint1 = x1
                    graphView.xPoint2 = x2
                    let x = x2! - x1!
                
                    let slope = y/x
                    let slope1 = String(format: "%.2f", slope)
                    mLBL.text = "\(slope1)"
                    let yintercept = graphView.pointFindIntercept(x1: x1!, x2: x2!, y1: y1!, y2: y2!)
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
                    let ac = UIAlertController(title: "Invalid X1 value", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 == nil && Y1 != nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X2 value", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 != nil && Y1 == nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid Y1 value", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 != nil && Y1 != nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid Y2 value", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 == nil && Y1 != nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X1 and X2 values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 == nil && Y1 == nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X2 and Y1 values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 == nil && Y1 != nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid X2 and Y2 values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 != nil && Y1 == nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid Y1 and Y2 values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 != nil && Y1 != nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid X1 and Y2 values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 != nil && Y1 == nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X1 and Y1 values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 == nil && X2 == nil && Y1 == nil && Y2 != nil {
                    let ac = UIAlertController(title: "Invalid X1, X2 and Y1 values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if X1 != nil && X2 == nil && Y1 == nil && Y2 == nil {
                    let ac = UIAlertController(title: "Invalid X2, Y1 and Y2 values", message: "Enter only numerics",preferredStyle: .alert)
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
                    let ac = UIAlertController(title: "Invalid X1, X2 and Y2 values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else
                {
                    let ac = UIAlertController(title: "Invalid X1, X2, Y1, Y2 values", message: "Enter only numerics",preferredStyle: .alert)
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
                let ac = UIAlertController(title: "No X1 value entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 == "" && Y1 != "" && Y2 != "" {
                let ac = UIAlertController(title: "No X2 value entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 != "" && Y1 == "" && Y2 != "" {
                let ac = UIAlertController(title: "No Y1 value entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 != "" && Y1 != "" && Y2 == "" {
                let ac = UIAlertController(title: "No Y2 value entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 == "" && Y1 != "" && Y2 != "" {
                let ac = UIAlertController(title: "No X1 and X2 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 == "" && Y1 == "" && Y2 != "" {
                let ac = UIAlertController(title: "No X2 and Y1 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 == "" && Y1 != "" && Y2 == "" {
                let ac = UIAlertController(title: "No X2 and Y2 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 != "" && Y1 == "" && Y2 == "" {
                let ac = UIAlertController(title: "No Y1 and Y2 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 != "" && Y1 != "" && Y2 == "" {
                let ac = UIAlertController(title: "No X1 and Y2 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 != "" && Y1 == "" && Y2 != "" {
                let ac = UIAlertController(title: "No X1 and Y1 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 == "" && Y1 == "" && Y2 != "" {
                let ac = UIAlertController(title: "No X1, X2 and Y1 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 != "" && X2 == "" && Y1 == "" && Y2 == "" {
                let ac = UIAlertController(title: "No X2, Y1 and Y2 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 != "" && Y1 == "" && Y2 == "" {
                let ac = UIAlertController(title: "No X1, Y1 and Y2 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
            else if X1 == "" && X2 == "" && Y1 != "" && Y2 == "" {
                let ac = UIAlertController(title: "No X1, X2 and Y2 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
                
            }
                
                
                
            else
            {
                let ac = UIAlertController(title: "No X1, X2, Y1, Y2 values entered", message: "Enter only numerics",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
        }
    }
    
    
    
    @IBAction func graphStandardEquation(_ sender: UIButton) {
        var m: Double? = 0.0
        var b: Double? = 0.0
        if slopeTF.text != "" && yinterceptTF.text != "" {
            if slopeTF.text!.contains("/") || yinterceptTF.text!.contains("/"){
                if slopeTF.text!.contains("/") {
                    m = graphView.solveFraction(fractionInput: slopeTF.text!)
                } else {
                    m = Double(slopeTF.text!)
                    if m == nil {
                        let ac = UIAlertController(title: "Invalid m value", message: "Enter only numerics",preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(action)
                        self.present(ac, animated: true)
                    }
                }
                if yinterceptTF.text!.contains("/") {
                    b = graphView.solveFraction(fractionInput: yinterceptTF.text!)
                } else {
                    b = Double(yinterceptTF.text!)
                    if b == nil {
                        let ac = UIAlertController(title: "Invalid b value", message: "Enter only numerics",preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(action)
                        self.present(ac, animated: true)
                    }
                }
                graphView.slope = m
                graphView.yIntercept = b
                graphView.setNeedsDisplay()
        
            }
            else if let slope = Double(slopeTF.text!),let yInt = Double(yinterceptTF.text!){
                let yIntercept = Double(yinterceptTF.text!)
                graphView.slope = slope
                graphView.yIntercept = yIntercept
                graphView.setNeedsDisplay()
            }
            else{
                let mVal = Double(slopeTF.text!)
                let bVal = Double(yinterceptTF.text!)
                if mVal == nil && bVal != nil {
                    let ac = UIAlertController(title: "Invalid m value", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if mVal != nil && bVal == nil {
                    let ac = UIAlertController(title: "Invalid b value", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                
                    
                    
                else
                {
                    let ac = UIAlertController(title: "Invalid m and b values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
            }
        }
        else{
            
            if slopeTF.text == "" && yinterceptTF.text != "" {
                let ac = UIAlertController(title: "No m value entered", message: "Enter slope value",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if slopeTF.text != "" && yinterceptTF.text == "" {
                let ac = UIAlertController(title: "No b value entered", message: "Enter y intercept value",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
                
            else if slopeTF.text == "" && yinterceptTF.text == ""{
                let ac = UIAlertController(title: "No m and b values entered", message: "Enter slope and y intercept values",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
                
            else{
                let ac = UIAlertController(title: "No m and b values entered", message: "Enter slope and y intercept values",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
        }
        
    }
    
    
    @IBAction func graphQuadraticEquation(_ sender: UIButton) {
        var a: Double? = 0.0
        var b: Double? = 0.0
        var c: Double? = 0.0
        if aTF.text != "" && bTF.text != "" && cTF.text != ""{
            if aTF.text!.contains("/") || bTF.text!.contains("/") || cTF.text!.contains("/"){
                if aTF.text!.contains("/") {
                    a = graphView.solveFraction(fractionInput: aTF.text!)
                } else {
                    a = Double(aTF.text!)
                    if a == nil {
                        let ac = UIAlertController(title: "Invalid A value", message: "Enter only numerics",preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(action)
                        self.present(ac, animated: true)
                    }
                }
                if bTF.text!.contains("/") {
                    b = graphView.solveFraction(fractionInput: bTF.text!)
                } else {
                    b = Double(bTF.text!)
                    if b == nil {
                        let ac = UIAlertController(title: "Invalid B value", message: "Enter only numerics",preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(action)
                        self.present(ac, animated: true)
                    }
                }
                if cTF.text!.contains("/") {
                    c = graphView.solveFraction(fractionInput: cTF.text!)
                } else {
                    c = Double(cTF.text!)
                    if c == nil {
                        let ac = UIAlertController(title: "Invalid C value", message: "Enter only numerics",preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(action)
                        self.present(ac, animated: true)
                    }
                }
                graphView.quadAvalue = a
                graphView.quadBvalue = b
                graphView.quadCvalue = c
                graphView.setNeedsDisplay()
                
            }
            else if let aVal = Double(aTF.text!),let bVal = Double(bTF.text!),let cVal = Double(cTF.text!){
                graphView.quadAvalue = aVal
                graphView.quadBvalue = bVal
                graphView.quadCvalue = cVal
                graphView.setNeedsDisplay()
            }
            else{
                let aVal = Double(aTF.text!)
                let bVal = Double(bTF.text!)
                let cVal = Double(cTF.text!)
                
                if aVal == nil && bVal != nil && cVal != nil{
                    let ac = UIAlertController(title: "Invalid A value", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal != nil && bVal == nil && cVal != nil{
                    let ac = UIAlertController(title: "Invalid B value", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal != nil && bVal != nil && cVal == nil{
                    let ac = UIAlertController(title: "Invalid C value", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal == nil && bVal == nil && cVal != nil{
                    let ac = UIAlertController(title: "Invalid A and B values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal != nil && bVal == nil && cVal == nil{
                    let ac = UIAlertController(title: "Invalid B and C values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                else if aVal == nil && bVal != nil && cVal == nil{
                    let ac = UIAlertController(title: "Invalid A and C values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                    
                }
                    
                else
                {
                    let ac = UIAlertController(title: "Invalid A,B,C values", message: "Enter only numerics",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
            }
        }
        else{
            
            if aTF.text == "" && bTF.text != "" && cTF.text != ""{
                let ac = UIAlertController(title: "No A value entered", message: "Enter A value",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text != "" && bTF.text == "" && cTF.text != ""{
                let ac = UIAlertController(title: "No B value entered", message: "Enter B value",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text != "" && bTF.text != "" && cTF.text == ""{
                let ac = UIAlertController(title: "No C value entered", message: "Enter C value ",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text != "" && bTF.text == "" && cTF.text == ""{
                let ac = UIAlertController(title: " No B and C values entered", message: "Enter B and c values",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text == "" && bTF.text != "" && cTF.text == ""{
                let ac = UIAlertController(title: "No A and C values entered", message: "Enter A and C values",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
            else if aTF.text == "" && bTF.text == "" && cTF.text != ""{
                let ac = UIAlertController(title: "No A and B values entered", message: "Enter A and C values",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true)
            }
                
            else{
                let ac = UIAlertController(title: "No A,B,C values entered", message: "Enter A,B,C values",preferredStyle: .alert)
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
        
        x1TF.delegate = self
        x2TF.delegate = self
        y1TF.delegate = self
        y2TF.delegate = self
        
        yinterceptTF.delegate = self
        slopeTF.delegate = self
        
        aTF.delegate = self
        bTF.delegate = self
        cTF.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardRect.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        x1TF.resignFirstResponder()
        x2TF.resignFirstResponder()
        y1TF.resignFirstResponder()
        y2TF.resignFirstResponder()
        
        yinterceptTF.resignFirstResponder()
        slopeTF.resignFirstResponder()
        
        aTF.resignFirstResponder()
        bTF.resignFirstResponder()
        cTF.resignFirstResponder()
        
        return true
    }
    
    @objc func slideValueChanged(_ send: UISlider!) {
        let roundedValue = roundf(send.value)
        send.value = roundedValue
        graphView.getHashValue = Double(getHashValue.value)
        hashNumberLBL.text = String(getHashValue.value)
        graphView.setNeedsDisplay()
    }
    
    
    
}

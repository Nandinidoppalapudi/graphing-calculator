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
        if y2TF.text!.contains("/"){
            y2 = graphView.solveFraction(fractionInput: y2TF.text!)
        } else {
            y2 = Double(y2TF.text!)
        }
        graphView.yPoint2 = y2
        
        var y1: Double? = 0.0
        if y1TF.text!.contains("/"){
            y1 = graphView.solveFraction(fractionInput: y1TF.text!)
        } else {
            y1 = Double(y1TF.text!)
        }
        graphView.yPoint1 = y1
        let y = y2! - y1!

        var x1: Double? = 0.0
        if x1TF.text!.contains("/"){
            x1 = graphView.solveFraction(fractionInput: x1TF.text!)
        } else {
            x1 = Double(x1TF.text!)
        }
        graphView.xPoint1 = x1
        
        var x2: Double? = 0.0
        if x2TF.text!.contains("/"){
            x2 = graphView.solveFraction(fractionInput: x2TF.text!)
        }
        else {
            x2 = Double(x2TF.text!)
        }
        graphView.xPoint2 = x2
        let x = x2! - x1!
        
        let slope = y/x
        mLBL.text = String(slope)
        yLBL.text = String(graphView.pointFindIntercept(x1: x1!, x2: x2!, y1: y1!, y2: y2!))
        
        graphView.setNeedsDisplay()
    }
    
    @IBAction func graphStandardEquation(_ sender: UIButton) {
        let slope = Double(slopeTF.text!)
        if slopeTF.text!.contains("/") {
            graphView.slope = graphView.solveFraction(fractionInput: slopeTF.text!)
        } else {
            graphView.slope = slope
        }
            
        let yIntercept = Double(yinterceptTF.text!)
        if yinterceptTF.text!.contains("/") {
            graphView.yIntercept = graphView.solveFraction(fractionInput: yinterceptTF.text!)
        } else {
            graphView.yIntercept = yIntercept
        }
        
        graphView.setNeedsDisplay()
    }
    
    @IBAction func graphQuadraticEquation(_ sender: UIButton) {
        let aVal = Double(aTF.text!)
        if aTF.text!.contains("/") {
            graphView.quadAvalue = graphView.solveFraction(fractionInput: aTF.text!)
        } else {
            graphView.quadAvalue = aVal
        }
        
        let bVal = Double(slopeTF.text!)
        if bTF.text!.contains("/") {
            graphView.quadBvalue = graphView.solveFraction(fractionInput: bTF.text!)
        } else {
            graphView.quadBvalue = bVal
        }
        
        let cVal = Double(cTF.text!)
        if cTF.text!.contains("/") {
            graphView.quadCvalue = graphView.solveFraction(fractionInput: cTF.text!)
        } else {
            graphView.quadCvalue = cVal
        }
        
        graphView.setNeedsDisplay()
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


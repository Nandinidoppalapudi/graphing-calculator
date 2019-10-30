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
    @IBOutlet weak var yinterceptTF: UITextField!
    @IBOutlet weak var slopeTF: UITextField!
    @IBOutlet weak var aTF: UITextField!
    @IBOutlet weak var bTF: UITextField!
    @IBOutlet weak var cTF: UITextField!
    @IBOutlet weak var graphView: GraphView!
    
    @IBAction func changeScale(_ sender: UIButton) {
        self.graphView.max = Int(scaleX.text!)!
        self.graphView.min = Int(scaleY.text!)!
        self.graphView.setNeedsDisplay()
    }
    
    @IBOutlet weak var scaleX: UITextField!
    @IBOutlet weak var scaleY: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


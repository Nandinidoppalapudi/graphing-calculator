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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchFilter))
        
    }


    @objc func searchFilter(){
        let ac = UIAlertController(title: "Scaling", message: "Please enter a number to scale by.", preferredStyle: .alert)
        
        ac.addTextField { (textField) in textField.text = ""}
        
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak ac] (action) -> Void in let textNum = ac?.textFields![0] as UITextField!
            self.graphView.userScale = Int((textNum?.text!)!)!
            self.graphView.setNeedsDisplay()
        }))
        self.present(ac, animated: true)
        
    }
    
}


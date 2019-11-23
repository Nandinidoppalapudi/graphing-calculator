//
//  InfoViewController.swift
//  graphing-calculator
//
//  Created by Student on 9/30/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    var strings:[String] = []
    @IBOutlet weak var bulletLabel: UITextView!
    
    @IBOutlet weak var textLabel: UITextView!
    
    override func viewDidLoad()
    {
    super.viewDidLoad()
    //Displays common equation information using strings and bullet points
    let bullet1 = "Slope-Intercept  : y=mx+b where m is the slope and b is the y-intercept.\n"
    let bullet2 = "Point-Slope  : y-y1=m(x-x1) where m is the slope and (x, y) is the point on the line.\n"
    let bullet3 = "Standard :   Ax+By=C where A,B,C are constants.\n"
    
    strings = [bullet1, bullet2, bullet3]
    
    var fullString = ""
    
    for string: String in strings
    {
    let bulletPoint: String = "\u{2022}"
    let formattedString: String = "\(bulletPoint) \(string)\n"
    
    fullString = fullString + formattedString
    }
    
    bulletLabel.text = fullString
    
    let bullet4 = "Cubic Equation: 3x^3+a2x^2+a1x+a0==0 \n"
    let bullet5 = "Trignometric Equation: sin(x) + cos(x) = 1\n"

    
    strings = [bullet4, bullet5]
    
    var fullString1 = ""
    
    for string2: String in strings
    {
    let bulletPoint1: String = "\u{2022}"
    let formattedString1: String = "\(bulletPoint1) \(string2)\n"
    
    fullString1 = fullString1 + formattedString1
    }
    
    textLabel.text = fullString1

}
}

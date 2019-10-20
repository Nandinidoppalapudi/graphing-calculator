//
//  GraphView.swift
//  graphing-calculator
//
//  Created by Dustin Potter on 10/20/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class GraphView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        
        let yLine = UIBezierPath()
        yLine.lineWidth = 1.0
        UIColor.black.setStroke()
        yLine.move(to: CGPoint(x: 375/2, y:0))
        yLine.addLine(to: CGPoint(x: 375/2, y:430.0))
        yLine.stroke()
        
        let xLine = UIBezierPath()
        xLine.lineWidth = 1.0
        UIColor.black.setStroke()
        xLine.move(to: CGPoint(x: 0, y: 430/2))
        xLine.addLine(to: CGPoint(x: 375.0, y: 430/2))
        xLine.stroke()
        
        let xHash = UIBezierPath()
        xHash.lineWidth = 1.0
        UIColor.black.setStroke()
        for i in stride(from: 375/2, through: 0, by: -5)  {
           xHash.move(to: CGPoint(x: i, y: (430/2) + 5))
           xHash.addLine(to: CGPoint(x: i, y: (430/2) - 5))
           xHash.stroke()
        }
        
        for i in stride(from: 375/2, through: 375, by: 5) {
            xHash.move(to: CGPoint(x: i, y: (430/2) + 5))
            xHash.addLine(to: CGPoint(x: i, y: (430/2) - 5))
            xHash.stroke()
        }
        
        let yHash = UIBezierPath()
        yHash.lineWidth = 1.0
        UIColor.black.setStroke()
        for i in stride(from: 430/2, through: 0, by: -5){
            yHash.move(to: CGPoint(x: (375/2) - 5, y: i))
            yHash.addLine(to: CGPoint(x: (375/2) + 5, y: i))
            yHash.stroke()
        }
        
        for i in stride(from: 430/2, through: 430, by: 5) {
            yHash.move(to: CGPoint(x: (375/2) - 5, y: i))
            yHash.addLine(to: CGPoint(x: (375/2) + 5, y: i))
            yHash.stroke()
        }
    }
}

//
//  GraphView.swift
//  graphing-calculator
//
//  Created by Dustin Potter on 10/20/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class GraphView: UIView {

    let xLength = 375
    let yLength = 430
    
    let xHalf = 375/2
    let yHalf = 430/2
    
    var max = 10
    var min = 10
    
    
    
    override func draw(_ rect: CGRect) {
        
        let yLine = UIBezierPath()
        yLine.lineWidth = 1.0
        UIColor.black.setStroke()
        yLine.move(to: CGPoint(x: xHalf, y:0))
        yLine.addLine(to: CGPoint(x: xHalf, y: yLength))
        yLine.stroke()
        
        let xLine = UIBezierPath()
        xLine.lineWidth = 1.0
        UIColor.black.setStroke()
        xLine.move(to: CGPoint(x: 0, y: yHalf))
        xLine.addLine(to: CGPoint(x: xLength, y: yHalf))
        xLine.stroke()
        
        let xHash = UIBezierPath()
        xHash.lineWidth = 1.0
        UIColor.black.setStroke()
        for i in stride(from: xHalf, through: 0, by: -(xHalf)/min)  {
           xHash.move(to: CGPoint(x: i, y: yHalf + 5))
           xHash.addLine(to: CGPoint(x: i, y: yHalf - 5))
           xHash.stroke()
        }
        
        for i in stride(from: xHalf, through: xLength, by: xHalf/max) {
            xHash.move(to: CGPoint(x: i, y: yHalf + 5))
            xHash.addLine(to: CGPoint(x: i, y: yHalf - 5))
            xHash.stroke()
        }
        
        let yHash = UIBezierPath()
        yHash.lineWidth = 1.0
        UIColor.black.setStroke()
        for i in stride(from: yHalf, through: 0, by: -(yHalf)/max){
            yHash.move(to: CGPoint(x: xHalf - 5, y: i))
            yHash.addLine(to: CGPoint(x: xHalf + 5, y: i))
            yHash.stroke()
        }
        
        for i in stride(from: yHalf, through: yLength, by: yHalf/min) {
            yHash.move(to: CGPoint(x: xHalf - 5, y: i))
            yHash.addLine(to: CGPoint(x: xHalf + 5, y: i))
            yHash.stroke()
            
            //test
        }
    }
}

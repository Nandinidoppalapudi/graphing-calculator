//
//  GraphView.swift
//  graphing-calculator
//
//  Created by Dustin Potter on 10/20/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class GraphView: UIView {

    let xLength = 375.0
    let yLength = 430.0
    
    let xHalf = 375.0/2.0
    let yHalf = 430.0/2.0
    
    var getHashValue = 1.0
    
    var slope: Double? = nil
    var yIntercept: Double? = nil
    
    
    override func draw(_ rect: CGRect) {
        let originalHashx = xHalf/10.0
        let originalHashy = yHalf/10.0
        
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
        for i in stride(from: xHalf, through: 0, by: -originalHashx)  {
           xHash.move(to: CGPoint(x: i, y: yHalf + 5))
           xHash.addLine(to: CGPoint(x: i, y: yHalf - 5))
           xHash.stroke()
        }
        
        for i in stride(from: xHalf, through: xLength, by: originalHashx) {
            xHash.move(to: CGPoint(x: i, y: yHalf + 5))
            xHash.addLine(to: CGPoint(x: i, y: yHalf - 5))
            xHash.stroke()
        }
        
        let yHash = UIBezierPath()
        yHash.lineWidth = 1.0
        UIColor.black.setStroke()
        for i in stride(from: yHalf, through: 0, by: -originalHashy){
            yHash.move(to: CGPoint(x: xHalf - 5, y: i))
            yHash.addLine(to: CGPoint(x: xHalf + 5, y: i))
            yHash.stroke()
        }
        
        for i in stride(from: yHalf, through: yLength, by: originalHashy) {
            yHash.move(to: CGPoint(x: xHalf - 5, y: i))
            yHash.addLine(to: CGPoint(x: xHalf + 5, y: i))
            yHash.stroke()
            
        }
        
        if slope != nil && yIntercept != nil {
            drawLine(slope: slope!, yIntercept: yIntercept!)
        }
    }
        
        func drawLine(slope: Double, yIntercept: Double) {
            let originalHashx = xHalf/10.0
            let originalHashy = yHalf/10.0

            let funcLine = UIBezierPath()
            funcLine.lineWidth = 1.0
            UIColor.blue.setStroke()
            
            var counter1 = 1.0
            
            funcLine.move(to: CGPoint(x: xHalf, y: yHalf - ((originalHashy * yIntercept) / getHashValue)))
            for point in stride(from: xHalf + originalHashx, through: xLength * getHashValue, by: originalHashx) {
                funcLine.addLine(to: CGPoint(x: point, y: yHalf - ((originalHashy * yIntercept) + (originalHashy * slope * counter1)) / getHashValue))
                counter1 += 1
            }
            funcLine.stroke()
            
            var counter2 = 1.0
            
            funcLine.move(to: CGPoint(x: xHalf, y: yHalf - ((originalHashy * yIntercept) / getHashValue)))
            for point in stride(from: xHalf - originalHashx, through: 0, by: -originalHashx) {
                funcLine.addLine(to: CGPoint(x: point, y: yHalf - ((originalHashy * yIntercept) - (originalHashy * slope * counter2)) / getHashValue))
                counter2 += 1
            }
            funcLine.stroke()
 
        }
}

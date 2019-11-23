//
//  GraphView.swift
//  graphing-calculator
//
//  Created by Dustin Potter on 10/20/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

//Create class to draw the graph
class GraphView: UIView {

    let xLength = 375.0
    let yLength = 430.0
    
    let xHalf = 375.0/2.0
    let yHalf = 430.0/2.0
    
    var getHashValue = 1.0
    
    var slope: Double? = nil
    var yIntercept: Double? = nil
    
    var quadAvalue: Double? = nil
    var quadBvalue: Double? = nil
    var quadCvalue: Double? = nil
    
    var yPoint2:Double? = nil
    var yPoint1:Double? = nil
    var xPoint1:Double? = nil
    var xPoint2:Double? = nil
    
    //function to convert the string fraction into a double value
    func solveFraction(fractionInput: String) -> Double? {
        let numbers = fractionInput.components(separatedBy: "/")
        let numerator = Double(numbers[0])!
        let denominator = Double(numbers[1])!
        if denominator != 0 {
            return numerator/denominator
        } else {
            return nil
        }
    }
    
    //function to convert CGPoints into normal graphing points
    func cartToPoints(_ point: CGPoint) -> CGPoint {
        let xHashLength = xHalf/10.0
        let yHashLength = yHalf/10.0
        
        let newPoint: CGPoint
        newPoint = CGPoint(
            x: xHalf + ((xHashLength * Double(point.x)) / getHashValue),
            y:  yHalf - ((yHashLength * Double(point.y)) / getHashValue)
        )
        return newPoint
    }
    
    //function to find the y intercept of a function using two points
    func pointFindIntercept(x1:Double,x2:Double, y1:Double, y2:Double)->Double{
        var yvalue = 0.0
        let slope = pointFindSlope(x1: x1, x2: x2, y1: y1, y2: y2)
        yvalue = ((slope * x1) - y1) / -1
        return yvalue
        
    }
    
    //function to find the slope of a function using two points
    func pointFindSlope(x1: Double, x2: Double, y1: Double, y2: Double) -> Double {
        var slope = 0.0
        slope = (y2 - y1) / (x2 - x1)
        return slope
    }
    
    //function to calculate y value for a standard equation
    func solveStandardEquation(slope: Double, yIntercept: Double, xValue: Double) -> Double {
        var yValue = 0.0
        yValue = (slope * xValue) + yIntercept
        return yValue
    }
    
    //function to calculate y value for a quadratic equation
    func solveQuadEquation(aValue: Double, bValue: Double, cValue: Double, xValue: Double) -> Double {
        var yValue: Double = 0
        yValue = (aValue * pow(xValue, 2)) + (bValue * xValue) + cValue
        return yValue
    }
    
    //function to implement draw
    override func draw(_ rect: CGRect) {
        let originalHashx = xHalf/10.0
        let originalHashy = yHalf/10.0
        
        //path that draws the y line
        let yLine = UIBezierPath()
        yLine.lineWidth = 1.0
        UIColor.black.setStroke()
        yLine.move(to: CGPoint(x: xHalf, y:0))
        yLine.addLine(to: CGPoint(x: xHalf, y: yLength))
        yLine.stroke()
        
        //path that draws the x line
        let xLine = UIBezierPath()
        xLine.lineWidth = 1.0
        UIColor.black.setStroke()
        xLine.move(to: CGPoint(x: 0, y: yHalf))
        xLine.addLine(to: CGPoint(x: xLength, y: yHalf))
        xLine.stroke()
        
        //path that draws the hash marks for the x line
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
        
        //path that draws the hash marks for the y line
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
        
        //will execute the drawLine function
        if slope != nil && yIntercept != nil {
            drawLine(slope: slope!, yIntercept: yIntercept!)
        }
        
        //will execute the drawPointsLine function
        if xPoint1 != nil && xPoint2 != nil && yPoint1 != nil && yPoint2 != nil{
            drawPointsLine(x1: xPoint1!, x2: xPoint2!, y1: yPoint1!, y2:yPoint2!)
        }
        
        //will execute the drawQuadraticLine function
        if quadAvalue != nil && quadBvalue != nil && quadCvalue != nil {
            drawQuadraticLine(aValue: quadAvalue!, bValue: quadBvalue!, cValue: quadCvalue!)
        }
 
    }
    
    //function that draws the line equation using two points
    func drawPointsLine(x1:Double,x2:Double, y1:Double, y2:Double) {
        
        let slope = pointFindSlope(x1: x1, x2: x2, y1: y1, y2: y2)
        let yIntercept = pointFindIntercept(x1: x1, x2: x2, y1: y1, y2: y2)
        
        let pointLine = UIBezierPath()
        pointLine.lineWidth = 1.0
        UIColor.purple.setStroke()
        
        pointLine.move(to: cartToPoints(
            CGPoint(
                x: -getHashValue * 10.0,
                y: solveStandardEquation(slope: slope, yIntercept: yIntercept, xValue: (-getHashValue * 10.0))
            )))
        for point in stride(from: -(getHashValue * 10.0) + getHashValue, through: getHashValue * 10.0, by: 1) {
            pointLine.addLine(to: cartToPoints(
                CGPoint(
                    x: point,
                    y: solveStandardEquation(slope: slope, yIntercept: yIntercept, xValue: point)
                )))
        }
        pointLine.stroke()
    }
    
    //function to draw the line of the standard line equation
    func drawLine(slope: Double, yIntercept: Double) {
        
        let funcLine = UIBezierPath()
        funcLine.lineWidth = 1.0
        UIColor.blue.setStroke()
            
        funcLine.move(to: cartToPoints(
            CGPoint(
                x: -getHashValue * 10.0,
                y: solveStandardEquation(slope: slope, yIntercept: yIntercept, xValue: (-getHashValue * 10.0))
            )))
        for point in stride(from: -(getHashValue * 10.0) + getHashValue, through: getHashValue * 10.0, by: 1) {
            funcLine.addLine(to: cartToPoints(
                CGPoint(
                    x: point,
                    y: solveStandardEquation(slope: slope, yIntercept: yIntercept, xValue: point)
                )))
        }
        funcLine.stroke()
    }
    
    //function to draw the line of the quadratic equation
    func drawQuadraticLine(aValue: Double, bValue: Double, cValue: Double) {
        
        let quadLine = UIBezierPath()
        quadLine.lineWidth = 1.0
        UIColor.red.setStroke()
        
        quadLine.move(to: cartToPoints(
            CGPoint(
                x: -getHashValue * 10.0,
                y: solveQuadEquation(aValue: aValue, bValue: bValue, cValue: cValue, xValue: (-getHashValue * 10.0))
            )))
        for point in stride(from: -(getHashValue * 10.0) + getHashValue, through: getHashValue * 10.0, by: 0.1) {
            quadLine.addLine(to: cartToPoints(
                CGPoint(
                    x: point,
                    y: solveQuadEquation(aValue: aValue, bValue: bValue, cValue: cValue, xValue: point)
                )))
        }
        quadLine.stroke()
    }
    
}

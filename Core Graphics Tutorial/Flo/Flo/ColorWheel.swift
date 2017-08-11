//
//  ColourWheel.swift
//  Flo
//
//  Created by Carla on 2017/08/10.
//  Copyright © 2017 Carla. All rights reserved.
//
import UIKit

typealias Segment = (
    start: Int,
    startColor: UIColor
)


struct ColorPath {
    var color:UIColor
    var path:UIBezierPath
}

@IBDesignable
class ColorWheel: UIView {
//    @IBInspectable var size:CGSize=CGSize.zero { didSet { setNeedsDisplay()} }
//    @IBInspectable var sectors:Int = 360 { didSet { setNeedsDisplay()} }
//    

    override func draw(_ rect : CGRect) {
        
//                let color1 : UIColor = .red
//                let color2 : UIColor = .yellow
//                let color3 : UIColor = .green
//                let color4 : UIColor = .blue
        
        
//
        
        let color1 : UIColor = UIColor(colorLiteralRed: 1/255, green: 167/255, blue: 221/255, alpha: 1.0) //normal
        let color2 : UIColor = UIColor(colorLiteralRed: 33/255, green: 181/255, blue: 225/255, alpha: 1.0) //medium
        let color3 : UIColor = UIColor(colorLiteralRed: 101/255, green: 212/255, blue: 239/255, alpha: 1.0) //bright
        let color4 : UIColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)

        
        let colorPath = ColorPath(color: .clear, path: UIBezierPath())
        let arcWidth: CGFloat = 40
        let radius: CGFloat = max(bounds.width, bounds.height)/2 - arcWidth/2
        

        
        let segments = [
            Segment(start: 0, startColor: color4)
            ,Segment(start: 10, startColor: color4)
            ,Segment(start: 15, startColor: color2)
            ,Segment(start: 25, startColor: color2)
            ,Segment(start: 30, startColor: color1)
            ,Segment(start: 60, startColor: color1)
            ,Segment(start: 70, startColor: color2)
            ,Segment(start: 90, startColor: color2)
            ,Segment(start: 120, startColor: color3)
            ,Segment(start: 240, startColor: color3)
            ,Segment(start: 300, startColor: color4)]
        
        //we only count to segments.count - 1 because the last element is already accounted for in the 2nd last segment i.e. as the end of 2nd last element
        for index in stride(from: 0, to: (segments.count-1), by: 1) {
            let segment = segments[index]
            let nextSegment = segments[index+1]
        
            self.setColorForSector(startAngle: segment.start,
                                   endAngle: nextSegment.start,
                                   colorPath: colorPath,
                                   radius: radius,
                                   arcWidth: arcWidth,
                                   startColor: segment.startColor,
                                   endColor: nextSegment.startColor)
        }

        
    }
    
    
    func getGradient(color1: UIColor, color2: UIColor, percent: CGFloat) -> UIColor {
        let rgbColour1 = color1.colorComponents!
        let rgbColour2 = color2.colorComponents!
        
        let resultRed = rgbColour1.red + percent * (rgbColour2.red - rgbColour1.red);
        let resultGreen = rgbColour1.green + percent * (rgbColour2.green - rgbColour1.green);
        let resultBlue = rgbColour1.blue + percent * (rgbColour2.blue - rgbColour1.blue);
        
        return UIColor(colorLiteralRed: Float(resultRed), green: Float(resultGreen), blue: Float(resultBlue), alpha: 1.0)
    }
    
    func setColorForSector(startAngle: Int, endAngle:Int, colorPath: ColorPath, radius: CGFloat, arcWidth: CGFloat, startColor: UIColor, endColor: UIColor) {
        for sector in stride(from: CGFloat(startAngle), to: CGFloat(endAngle), by: 0.1) {
            let percent = (CGFloat(sector) - CGFloat(startAngle))/(CGFloat(endAngle) - CGFloat(startAngle))
            let color = getGradient(color1: startColor,
                                    color2: endColor,
                                    percent: CGFloat(percent))
            self.setColorForSector(startAngle: sector, endAngle: (sector + 1.0), colorPath: colorPath, radius: radius, arcWidth:arcWidth, color: color)
        }
    }
    
    func setColorForSector(startAngle: CGFloat, endAngle:CGFloat, colorPath: ColorPath, radius: CGFloat, arcWidth: CGFloat, color: UIColor) {
        let startAngle = (CGFloat(startAngle) + 0.5) * π/180
        let endAngle = (CGFloat(endAngle) + 0.5) * π/180
        var colorPath = colorPath

        let point = CGPoint(x: frame.size.width/2,
                         y: frame.size.height/2)
        colorPath.path = UIBezierPath(arcCenter: point,
                                      radius: radius,
                                      startAngle: startAngle,
                                      endAngle:  endAngle,
                                      clockwise: true)
        
        colorPath.path.lineWidth = arcWidth
        
        color.setFill()
        color.setStroke()
        colorPath.path.fill()
        colorPath.path.stroke()
        colorPath.color = color
    }
    
    
}

extension UIColor {
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        guard let components = self.cgColor.components else { return nil }
        
        return (
            red: components[0],
            green: components[1],
            blue: components[2],
            alpha: components[3]
        )
    }
}


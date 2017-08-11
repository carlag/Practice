//
//  ColourWheel.swift
//  Flo
//
//  Created by Carla on 2017/08/10.
//  Copyright © 2017 Carla. All rights reserved.
//
import UIKit



@IBDesignable
class ColorWheel: UIView {
    @IBInspectable var size:CGSize=CGSize.zero { didSet { setNeedsDisplay()} }
    @IBInspectable var sectors:Int = 360 { didSet { setNeedsDisplay()} }
    
    
    private var image:UIImage?=nil
    //    var imageView:UIImageView?=nil
    var paths=[ColorPath]()

    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    func getGradient(color1: UIColor, color2: UIColor, percent: CGFloat) -> UIColor {
        let rgbColour1 = color1.colorComponents!
        let rgbColour2 = color2.colorComponents!
        
        let resultRed = rgbColour1.red + percent * (rgbColour2.red - rgbColour1.red);
        let resultGreen = rgbColour1.green + percent * (rgbColour2.green - rgbColour1.green);
        let resultBlue = rgbColour1.blue + percent * (rgbColour2.blue - rgbColour1.blue);
        
        return UIColor(colorLiteralRed: Float(resultRed), green: Float(resultGreen), blue: Float(resultBlue), alpha: 1.0)
    }

    func setColorForSector(startAngle: Int, endAngle:Int, colorPath: ColorPath, radius: CGFloat, startColor: UIColor, endColor: UIColor) {
//        for sector in startAngle...endAngle {
        for sector in stride(from: CGFloat(startAngle), to: CGFloat(endAngle), by: 0.1) {
            let percent = (CGFloat(sector) - CGFloat(startAngle))/(CGFloat(endAngle) - CGFloat(startAngle))
            let color = getGradient(color1: startColor,
                                    color2: endColor,
                                    percent: CGFloat(percent))
            print("sector: \(sector) -> \(color)")
            self.setColorForSector(startAngle: sector, endAngle: (sector + 1.0), colorPath: colorPath, radius: radius, color: color)
        }
    }
    
    func setColorForSector(startAngle: CGFloat, endAngle:CGFloat, colorPath: ColorPath, radius: CGFloat, color: UIColor) {
        let startAngle = (CGFloat(startAngle) + 0.5) * π/180
        let endAngle = (CGFloat(endAngle) + 0.5) * π/180
        let arcWidth: CGFloat = 20
        let radius: CGFloat = max(bounds.width, bounds.height)/2 - arcWidth/2
        var colorPath = colorPath
        
        colorPath.path = UIBezierPath(arcCenter: center,
                                      radius: radius,
                                      startAngle: startAngle,
                                      endAngle:  endAngle,
                                      clockwise: true)
        
//        colorPath.path.addLine(to: center)
        colorPath.path.lineWidth = arcWidth

//        colorPath.path.close()
        
        color.setFill()
        color.setStroke()
        colorPath.path.fill()
        colorPath.path.stroke()
        colorPath.color = color
        
        paths.append(colorPath)
    }
    
    
    override func draw(_ rect : CGRect) {
//                let color1 : UIColor = .red
//                let color2 : UIColor = .yellow
//                let color3 : UIColor = .green
//                let color4 : UIColor = .blue
//
        let color1 : UIColor = UIColor(colorLiteralRed: 1/255, green: 167/255, blue: 221/255, alpha: 1.0)
        let color2 : UIColor = UIColor(colorLiteralRed: 33/255, green: 181/255, blue: 225/255, alpha: 1.0)
        let color3 : UIColor = UIColor(colorLiteralRed: 101/255, green: 212/255, blue: 239/255, alpha: 1.0)
        let color4 : UIColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)

        
        let radius = CGFloat(min(frame.size.width, frame.size.height) / 2.1)
        let colorPath = ColorPath(color: .clear, path: UIBezierPath())
        
        center = CGPoint(x: frame.width / 2.0,
                         y: frame.height / 2.0)
        
        let segment1 = Segment(start: 0, end: 10, startColor: color4, endColor: color4)
        let segment2 = Segment(start: 10, end: 15, startColor: color4, endColor: color1)
        
        let segment3 = Segment(start: 15, end: 25, startColor: color1, endColor: color1)
        let segment4 = Segment(start: 25, end: 30, startColor: color1, endColor: color2)
        
        let segment5 = Segment(start: 30, end: 60, startColor: color2, endColor: color2)
        let segment6 = Segment(start: 60, end: 70, startColor: color2, endColor: color3)
        
        let segment7 = Segment(start: 70, end: 90, startColor: color3, endColor: color3)
        let segment8 = Segment(start: 90, end: 120, startColor: color3, endColor: color2)
        
        let segment9 = Segment(start: 120, end: 240, startColor: color2, endColor: color2)
        let segment10 = Segment(start: 240, end: 300, startColor: color2, endColor: color4)
        
        let segments = [segment1, segment2, segment3, segment4, segment5, segment6, segment7, segment8, segment9, segment10]

        for segment in segments {
            self.setColorForSector(startAngle: segment.start,
                                   endAngle: segment.end,
                                   colorPath: colorPath,
                                   radius: radius,
                                   startColor: segment.startColor,
                                   endColor: segment.endColor)
        }
//
        //0 - 10

//        //10 - 15
//        self.setColorForSector(startAngle: 10,
//                               endAngle: 15,
//                               colorPath: colorPath,
//                               radius: radius,
//                               startColor: color1,
//                               endColor: color2)
//        //15 - 30
//        self.setColorForSector(startAngle: 15,
//                               endAngle: 30,
//                               colorPath: colorPath,
//                               radius: radius,
//                               startColor: color2,
//                               endColor: color2)
//        
//        //30 - 50
//        self.setColorForSector(startAngle: 30,
//                               endAngle: 50,
//                               colorPath: colorPath,
//                               radius: radius,
//                               startColor: color2,
//                               endColor: color3)
        
        //30 - 50
        
        //
        //        print("FRAME")
        //        print(rect)
        //        print(self.bounds)
        //        print(self.frame)
        //
        //        print("CENTER")
        //        print(self.center)
        //        self.center = CGPoint( x: rect.width / 2.0, y: rect.height / 2.0 )
        //
        //
        ////        UIGraphicsBeginImageContextWithOptions(CGSize(width:bounds.size.width, height:bounds.size.height),true, 0)
        ////        UIColor.white.setFill()
        ////        UIRectFill(frame)
        //
//                let segment1 = Segment(start: 0, end: 10)
//                let segment2 = Segment(start: 10, end: 15)
//                let segment3 = Segment(start: 15, end: 25)
//                let segment4 = Segment(start: 25, end: 30)
//                let segment5 = Segment(start: 30, end: 60)
//                let segment6 = Segment(start: 60, end: 70)
//                let segment7 = Segment(start: 70, end: 90)
//                let segment8 = Segment(start: 90, end: 120)
//                let segment9 = Segment(start: 120, end: 240)
//                let segment10 = Segment(start: 240, end: 300)
//        //
//                var segments = [segment1, segment2, segment3, segment4, segment5, segment6, segment7, segment8, segment9, segment10]
        ////        var segments = [Segment(start: 0, end: 10), Segment(start:30, end:300)]
        //        var beziers = [UIBezierPath]()
        //
        //        let arcWidth: CGFloat = 20
        //        let radius: CGFloat = max(bounds.width, bounds.height)/2 - arcWidth/2
        //
        //        for segment in segments {
        //            let path = UIBezierPath(arcCenter: self.center,
        //                                    radius: radius,
        //                                    startAngle: CGFloat(segment.start)*π/180,
        //                                    endAngle: CGFloat(segment.end)*π/180,
        //                                    clockwise: true)
        //
        //            path.lineWidth = arcWidth
        //            beziers.append(path)
        //        }
        //
        //        var colorPath1 = ColorPath(startColor: color4, endColor: color4, path: beziers[0], segment: segments[0])
        //        var colorPath2 = ColorPath(startColor: color4, endColor: color1, path: beziers[1], segment: segments[1])
        //        var colorPath3 = ColorPath(startColor: color1, endColor: color1, path: beziers[2], segment: segments[2])
        //        var colorPath4 = ColorPath(startColor: color1, endColor: color2, path: beziers[3], segment: segments[3])
        //        var colorPath5 = ColorPath(startColor: color2, endColor: color2, path: beziers[4], segment: segments[4])
        //        var colorPath6 = ColorPath(startColor: color2, endColor: color1, path: beziers[5], segment: segments[5])
        //        var colorPath7 = ColorPath(startColor: color1, endColor: color1, path: beziers[6], segment: segments[6])
        //        var colorPath8 = ColorPath(startColor: color1, endColor: color3, path: beziers[7], segment: segments[7])
        //        var colorPath9 = ColorPath(startColor: color3, endColor: color3, path: beziers[8], segment: segments[8])
        //        var colorPath10 = ColorPath(startColor: color3, endColor: color4, path: beziers[9], segment: segments[9])
        //
        //        colorPath1.draw(center: center, radius: radius, arcWidth: arcWidth)
        //        colorPath2.draw(center: center, radius: radius, arcWidth: arcWidth)
        //        colorPath3.draw(center: center, radius: radius, arcWidth: arcWidth)
        //        colorPath4.draw(center: center, radius: radius, arcWidth: arcWidth)
        //        colorPath5.draw(center: center, radius: radius, arcWidth: arcWidth)
        //        colorPath6.draw(center: center, radius: radius, arcWidth: arcWidth)
        //        colorPath7.draw(center: center, radius: radius, arcWidth: arcWidth)
        //        colorPath8.draw(center: center, radius: radius, arcWidth: arcWidth)
        //        colorPath9.draw(center: center, radius: radius, arcWidth: arcWidth)
        //        colorPath10.draw(center: center, radius: radius, arcWidth: arcWidth)
        ////
        ////        image = UIGraphicsGetImageFromCurrentImageContext()
        ////        UIGraphicsEndImageContext()
        ////
        ////        imageView = UIImageView (image: image)
        ////        self.addSubview(imageView!)
        
    }
    
    
}



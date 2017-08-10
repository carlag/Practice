////
////  ColourWheel.swift
////  Flo
////
////  Created by Carla on 2017/08/10.
////  Copyright © 2017 Carla. All rights reserved.
////
//import UIKit
//
//
//struct ColorPath {
//    var Path:UIBezierPath
//    var Color:UIColor
//}
//
//
//@IBDesignable
//class ColorBezier :  {
////    @IBInspectable var size:CGSize=CGSize.zero { didSet { setNeedsDisplay()} }
////    @IBInspectable var sectors:Int = 360 { didSet { setNeedsDisplay()} }
//    
//    private var image:UIImage?=nil
//    var imageView:UIImageView?=nil
//    var paths=[ColorPath]()
//    
//    
//    
//    func colorAtPoint ( point: CGPoint) -> UIColor {
//        for colorPath in 0..<paths.count {
//            if paths[colorPath].Path.contains(point) {
//                return paths[colorPath].Color
//            }
//        }
//        return UIColor.clear
//    }
//    
//    
//    
//    // Only override drawRect: if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect : CGRect) {
//        
//        let radius = CGFloat ( min(bounds.size.width, bounds.size.height) / 2.0 ) * 0.90
//        let angle:CGFloat = CGFloat(2.0) * CGFloat (π) / CGFloat(sectors)
//        var colorPath:ColorPath = ColorPath(Path: UIBezierPath(), Color: UIColor.clear)
//        
//        let center = CGPoint(x: self.bounds.width / 2.0, y: self.bounds.height / 2.0 )
//        
//        UIGraphicsBeginImageContextWithOptions(CGSize(width:bounds.size.width, height:bounds.size.height),true, 0)
//        UIColor.white.setFill()
//        UIRectFill(frame)
//        
//        for sector in 0..<sectors {
//            
//            let center = self.center
//            
//            colorPath.Path = UIBezierPath(arcCenter: center,
//                                          radius: radius,
//                                          startAngle: CGFloat(sector) * angle,
//                                          endAngle: (CGFloat(sector) + CGFloat(1)) * angle,
//                                          clockwise: true)
//            colorPath.Path.addLine(to: center)
//            colorPath.Path.close()
//            
//            
//            let bolusInsulin_color : UIColor = .red//UIColor(colorLiteralRed: 1/255, green: 167/255, blue: 221/255, alpha: 1.0)
//            let bolusInsulinMedium_color : UIColor = .yellow//UIColor(colorLiteralRed: 33/255, green: 181/255, blue: 225/255, alpha: 1.0)
//            let bolusInsulinBright_color : UIColor = .green//UIColor(colorLiteralRed: 101/255, green: 212/255, blue: 239/255, alpha: 1.0)
//            let blank_color : UIColor = .blue
//            
//            var color : UIColor = bolusInsulin_color
//            switch sector {
//            case _ where sector<10:
//                color = bolusInsulin_color
//                break
//            case _ where sector<90:
//                let percent = CGFloat(sector-10)/CGFloat(80)
//                color = getGradient(color1: bolusInsulin_color, color2: bolusInsulinMedium_color, percent: percent)
//                break
//            case _ where sector<180:
//                color = bolusInsulinMedium_color
//                break
//            case _ where sector<270:
//                //bright
//                color = bolusInsulinBright_color
//            default:
//                //white
//                color = blank_color
//            }
//            
//            print("sector: \(sector) -> color: \(color)")
//            
//            color.setFill()
//            color.setStroke()
//            
//            colorPath.Path.fill()
//            colorPath.Path.stroke()
//            colorPath.Color = color
//            
//            paths.append(colorPath)
//        }
//        
//        image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        imageView = UIImageView (image: image)
//        self.addSubview(imageView!)
//        
//    }
//    
//    func getGradient(color1: UIColor, color2: UIColor, percent: CGFloat) -> UIColor {
//        let rgbColour1 = color1.colorComponents!
//        let rgbColour2 = color2.colorComponents!
//        
//        let resultRed = rgbColour1.red + percent * (rgbColour2.red - rgbColour1.red);
//        //    print("red: \(resultRed), percent: \(percent)")
//        let resultGreen = rgbColour1.green + percent * (rgbColour2.green - rgbColour1.green);
//        
//        let resultBlue = rgbColour1.blue + percent * (rgbColour2.blue - rgbColour1.blue);
//        
//        return UIColor(colorLiteralRed: Float(resultRed), green: Float(resultGreen), blue: Float(resultBlue), alpha: 1.0)
//    }
//}
//
//extension UIColor {
//    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
//        guard let components = self.cgColor.components else { return nil }
//        
//        return (
//            red: components[0],
//            green: components[1],
//            blue: components[2],
//            alpha: components[3]
//        )
//    }
//}

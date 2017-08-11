//
//  CircleView.swift
//  Flo
//
//  Created by Carla on 2017/08/10.
//  Copyright © 2017 Carla. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class AnimatedCircleView : UIView {
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    var circleLayer: CAShapeLayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func animateCircle(duration: TimeInterval) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = 1
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = 1.0
        
        // Do the actual animation
        circleLayer.add(animation, forKey: "animateCircle")
    }

    override func draw(_ rect: CGRect) {
        self.backgroundColor = UIColor.clear
        
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0,
//                                                         y: frame.size.height / 2.0),
//                                      radius: (frame.size.width - 70)/2,
//                                      startAngle: 0.0,
//                                      endAngle: CGFloat(π),
//                                      clockwise: true)
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let arcWidth: CGFloat = 76
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        
        let circlePath = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = arcWidth;
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
        gradientLayer.frame = bounds;
        gradientLayer.startPoint = CGPoint(x:0, y:0.5);
        gradientLayer.endPoint = CGPoint(x:1,y:0.5);
    
        layer.addSublayer(gradientLayer)
        gradientLayer.mask = circleLayer;
    }
    
//    override func draw(_ rect: CGRect) {
//        
//        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
//        let radius = self.frame.size.width/2
//        let arcWidth: CGFloat = 76
//
//        let path = UIBezierPath(arcCenter: center,
//                                radius: radius - arcWidth/2,
//                                startAngle: π,
//                                endAngle: 2*π,
//                                clockwise: true)
//        
//        path.lineWidth = arcWidth
//        counterColor.setStroke()
//        path.stroke()
//        
//
//        
//    }
}

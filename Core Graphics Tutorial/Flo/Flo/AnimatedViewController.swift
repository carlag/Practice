//
//  AnimatedViewController.swift
//  Flo
//
//  Created by Carla on 2017/08/10.
//  Copyright © 2017 Carla. All rights reserved.
//

import UIKit
import Foundation

class AnimatedViewController : UIViewController {
    
    @IBOutlet weak var arcView: CircleView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        arcView.animateCircle(duration: 1.0)

    }
    
}

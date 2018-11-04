//
//  PhotoViewController.swift
//  ConcurrencyAndNetworking
//
//  Created by Carla on 04/11/2018.
//  Copyright © 2018 Carla. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    var photo: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = photo
    }
}

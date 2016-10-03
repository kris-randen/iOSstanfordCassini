//
//  ImageViewController.swift
//  Cassini
//
//  Created by Kris Rajendren on Oct/3/16.
//  Copyright © 2016 Campus Coach. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController
{
    var imageURL: NSURL? {
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            if let imageData = NSData(contentsOf: url as URL) {
                image = UIImage(data: imageData as Data)
            }
        }
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        //imageURL = DemoURL.NASAImageNamed(imageName: "Saturn")
        imageURL = NSURL(string: DemoURL.Stanford)
    }
}

//
//  ImageViewController.swift
//  Cassini
//
//  Created by Kris Rajendren on Oct/3/16.
//  Copyright © 2016 Campus Coach. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate
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
    
    @IBOutlet weak var scrollView: UIScrollView!
    {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.05
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
        
    }
}

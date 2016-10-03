//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Kris Rajendren on Oct/3/16.
//  Copyright © 2016 Campus Coach. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController
{
    private struct Storyboard {
        static let SegueShowImage = "Show Image"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Storyboard.SegueShowImage {
            if let ivc = segue.destination.content as? ImageViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageURL = DemoURL.NASAImageNamed(imageName: imageName)
                ivc.title = imageName
            }
        }
    }
}

extension UIViewController {
    var content: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}

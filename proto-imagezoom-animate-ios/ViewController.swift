//
//  ViewController.swift
//  proto-imagezoom-animate-ios
//
//  Created by Santosh Krishnamurthy on 3/30/23.
//

import UIKit

class ViewController: UIViewController {

    let imageView = UIImageView()
    let startFrame = CGRect(x: 0, y: 0, width: 200, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // set the image frame
        imageView.frame = startFrame
        // set the image
        imageView.image = UIImage(named: "Background-Euro")
        // set the content mode
        imageView.contentMode = .scaleAspectFill
        // image will go beyond the bounds if not clipped
        imageView.clipsToBounds = true
        // user interaction is by default disabled
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(imageView)
        
        // create a Tap gesture and add it to view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func handleTap(){
        animate()
    }
    
    func animate() -> Void {
        UIView.animate(withDuration: 0.5) {
            // find the acpect ratio of the original frame
            let aspectRatio = self.startFrame.height / self.startFrame.width
            // calculate the new height
            let newHeight = aspectRatio * self.view.frame.width
            
            self.imageView.frame  = CGRect(x: 0, y: 0, width: self.view.frame.width, height: newHeight)
            
            // move the frame to the center of the view
            self.imageView.center.y = self.view.center.y
            
            self.view.backgroundColor = .black
            
        } completion: { (done) in
            print("animation completed")
        }

    }


}


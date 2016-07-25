//
//  DraggableImageView.swift
//  coderTinder
//
//  Created by hoaqt on 7/25/16.
//  Copyright © 2016 com.noron. All rights reserved.
//

import UIKit

class DraggableImageView : UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    var imageCenter: CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        imageCenter = profileImage.center
            
            // custom initialization logic
    }
    
    override func awakeFromNib() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onMovingImage))
        self.addGestureRecognizer(gesture)
        self.userInteractionEnabled = true
    }
    
    func onMovingImage(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translationInView(profileImage)

        switch gesture.state {
        case .Began:
            break
        case .Changed:
            profileImage.center.x = imageCenter.x + translation.x
            let angle = translation.x / 150

            if (translation.x > 50) {
                print(translation)
                profileImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4) * angle)
            } else if (translation.x < -50) {
                profileImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4) * angle)

            }
        case .Ended:
            profileImage.transform = CGAffineTransformMakeRotation(0)
            break
        default:
            break
        }
        
    }
    
}

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
            
            // custom initialization logic
    }
    
    override func awakeFromNib() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onMovingImage))
        self.addGestureRecognizer(gesture)
        self.userInteractionEnabled = true
    }
    
    func onMovingImage(gesture: UIPanGestureRecognizer) {
        let point = gesture.locationInView(self)
        
        if gesture.state == UIGestureRecognizerState.Changed {
            profileImage.center = point
        }
    }
    
}

//
//  ViewController.swift
//  coderTinder
//
//  Created by hoaqt on 7/25/16.
//  Copyright © 2016 com.noron. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var ryanImage: UIImageView!
    
    @IBAction func onSpanRyan(gesture: UIPanGestureRecognizer) {
        print ("spanning")
        
        let point = gesture.locationInView(view)
        
        if gesture.state == UIGestureRecognizerState.Changed {
            ryanImage.center = point
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


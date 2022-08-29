//
//  AnimationViewController.swift
//  Animation App
//
//  Created by Apple Macbook Pro 13 on 26.08.22.
//

import UIKit
import Spring

class AnimationViewController: UIViewController {
    @IBOutlet var viewCollection: [SpringView]!
    
    @IBAction func buttonAction() {
        for view in viewCollection {
            AnimationService.makeRandomAnimation(view: view)
            view.animate()
        }
    }
}

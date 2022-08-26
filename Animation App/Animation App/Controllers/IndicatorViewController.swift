//
//  IndicatorViewController.swift
//  Animation App
//
//  Created by Apple Macbook Pro 13 on 26.08.22.
//

import UIKit
import NVActivityIndicatorView
import NVActivityIndicatorViewExtended

class IndicatorViewController: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var randomIndicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomIndicator.startAnimating()
    }
    
    @IBAction func changeIndicator() {
        randomIndicator.stopAnimating()
        let type = NVActivityIndicatorType.allCases.randomElement()!
        startAnimating(message: "Changing...", type: type)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating()
            self.randomIndicator.type = type
            self.randomIndicator.startAnimating()
        }
    }
}

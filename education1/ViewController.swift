//
//  ViewController.swift
//  education1
//
//  Created by 배현빈 on 2018. 8. 20..
//  Copyright © 2018년 purplebeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    struct Keys {
        static let index = "index"
    }
    
    var imageIndex : Int = 1 {
        didSet {
            label.text = "\(imageIndex) / 5"
            imageView.image = UIImage(named : "Cat\(imageIndex)")
            prevButton.isEnabled = imageIndex > 1
            nextButton.isEnabled = imageIndex < 5
            UserDefaults.standard.set(imageIndex, forKey: Keys.index)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let idx = UserDefaults.standard.integer(forKey: Keys.index)
        print("idx = \(idx)")
        if 1 <= idx && idx <= 5 {
            imageIndex = idx
        } else {
            imageIndex = 1
        }
    }
    
    @IBAction func onButtonPrev(_ sender: UIButton) {
        imageIndex -= 1
    }
    @IBAction func onButtonNext(_ sender: UIButton) {
        imageIndex += 1
    }
}


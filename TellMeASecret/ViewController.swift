//
//  ViewController.swift
//  TellMeASecret
//
//  Created by Charles Martin Reed on 9/12/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var secretLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if there's a user secret, load it into the label, else keep the label hidden
        if let labelString = UserDefaults.standard.object(forKey: "userSecret") as? String {
            secretLabel.text = "You told me: \(labelString). Don't worry, it's still our little secret ;)"
            secretLabel.isHidden = false
        } else {
            secretLabel.isHidden = true
        }
    }

    @IBAction func submitSecret(_ sender: UIButton) {
        
        if textView.text != "" {
            guard let secret = textView.text else { return }
            UserDefaults.standard.set(secret, forKey: "userSecret")
            
            let alert = UIAlertController(title: "Secret received", message: "Don't worry, it's just between you and me!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It'd better be!", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
}


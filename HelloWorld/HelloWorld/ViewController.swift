//
//  ViewController.swift
//  HelloWorld
//
//  Created by 모설아 on 24/02/2019.
//  Copyright © 2019 Snow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeBackToWhite(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
    @IBAction func changeBackToPurple(_ sender: Any) {
        view.backgroundColor = UIColor.purple
    }
    
    @IBAction func changeBackToBlack(_ sender: Any) {
        view.backgroundColor = UIColor.black
    }
}

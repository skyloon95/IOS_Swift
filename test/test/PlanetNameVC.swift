//
//  PlanetNameVC.swift
//  test
//
//  Created by 모설아 on 01/03/2019.
//  Copyright © 2019 Snow. All rights reserved.
//

import UIKit

class PlanetNameVC: UIViewController{
    
    var planetarySystem1: PlanetSystem? = nil
    
    @IBOutlet weak var planetNameTF: UITextField!
    @IBOutlet weak var planetNameTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planetarySystem1 = ViewController.planetSystem
    }
    
    @IBAction func thirdButton(_ sender: Any) {
        let planets: [Planet] = planetarySystem1!.planets
        for planet in planets{
            if(planet.name.elementsEqual(planetNameTF.text!)){
                planetNameTV.text = "You arrived on \(planet.name)!\nThis planet is \(planet.description)"
            }
        }
    }
    
}

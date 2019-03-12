//
//  ViewController.swift
//  test
//
//  Created by 모설아 on 25/02/2019.
//  Copyright © 2019 Snow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diameterOfEarth : Float = 23859.92
    static let planetSystem:PlanetSystem = PlanetSystem(name: "Solar system", planets: [Planet]())
    
    let mercury = Planet(name: "Mercury", description: "hot planet.")
    let venus = Planet(name: "Venus", description: "hot and highly atmospheric pressure.")
    let earth = Planet(name: "Earth", description: "blue and water planet.")
    let mars = Planet(name: "Mars", description: "red planet.")
    let jupiter = Planet(name: "Jupiter", description: "giant gas planet.")
    let neptune = Planet(name: "Neptune", description: "cold planet, has a ring.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.planetSystem.planets.append(mercury)
        ViewController.planetSystem.planets.append(venus)
        ViewController.planetSystem.planets.append(earth)
        ViewController.planetSystem.planets.append(mars)
        ViewController.planetSystem.planets.append(jupiter)
        ViewController.planetSystem.planets.append(neptune)
        
        start()
    }
    
    func start(){
        firstTextView.text = "Welcome to our \(ViewController.planetSystem.name)!\nThere are \(ViewController.planetSystem.planets.count) planets to explore.\nYou are currently on Earth, whitch has a circumference of \(diameterOfEarth) miles."

        myLabel.text = "What's your name?"
        secondTextView.text = "Shall I randomly choose a planet for you to visit? (Y or N)"
    }
  
    @IBOutlet weak var firstTextView: UITextView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextView: UITextView!
    @IBOutlet weak var secondTextField: UITextField!

    @IBAction func firstButton(_ sender: Any) {
        let name = firstTextField.text!
        myLabel.text = "Nice to meet you, \(name)!"
    }

    @IBAction func secondButton(_ sender: Any) {
        if(secondTextField.text == "y"||secondTextField.text == "Y"){
            secondTextView.text = "OK! Traveling to..."

            let count = UInt32(ViewController.planetSystem.planets.count)
            let index = Int(arc4random_uniform(count))

            secondTextView.text = "You arrived \(index+1)th planet!\nThe name is \(ViewController.planetSystem.planets[index].name) and this planet is \(ViewController.planetSystem.planets[index].description)"

        } else if(secondTextField.text == "n"||secondTextField.text == "N"){
            performSegue(withIdentifier: "show", sender: self)
        } else{
            secondTextView.text = "Sorry I didn't get that."
        }
    }
}


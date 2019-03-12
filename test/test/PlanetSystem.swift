//
//  PlanetSystem.swift
//  test
//
//  Created by 모설아 on 01/03/2019.
//  Copyright © 2019 Snow. All rights reserved.
//

import Foundation

class PlanetSystem {
    var name: String
    var planets: [Planet]
    
    init(name : String, planets: [Planet]){
        self.name = name
        self.planets = planets
    }
}

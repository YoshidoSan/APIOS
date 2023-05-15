//
//  Kosmos.swift
//  InvadersDemo
//
//  Created by apios on 08/12/2022.
//  Copyright © 2022 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class Kosmos: SKScene {
    
    let ship = StarShip()
    
    override func didMove(to view: SKView) {
        // Wczytanie emitera do sceny
        let starField = SKEmitterNode(fileNamed: "FallingStrars")
        starField?.position = CGPoint(x: size.width/2, y: size.height/2)
        starField?.zPosition = -1000
        
        // Dodanie emitera do sceny
        addChild(starField!)
        
        // Dodanie statku do sceny
        ship.position = CGPoint(x:self.frame.midX, y:ship.size.height/2 + 10)
        addChild(ship)
        
    }
    
    
    // obsluga tapnięcia i przesuwania palcem
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let nodes = self.nodes(at: touch.location(in: self))
            for node in nodes {
                if node.isKind(of: StarShip.self) {
                    self.ship.move(touch.location(in: self).x)
                }
            }
        }
    }

 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ship.fire(scene: self)
    }

}

//
//  Kosmos.swift
//  InvadersDemo
//
//  Created by apios on 14/01/2020.
//  Copyright © 2020 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class Kosmos: SKScene {
    let ship = SpaceShip()

    override func didMove(to view: SKView) {
        let starField = SKEmitterNode(fileNamed: "MyParticle")
        starField?.position = CGPoint(x: size.width/2, y: size.height/2)
        starField?.zPosition = -1000

        // Dodanie emitera do sceny
        addChild(starField!)
        
        ship.position = CGPoint(x:self.frame.midX, y:ship.size.height/2 + 10)
        addChild(ship)
        
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let nodes = self.nodes(at: touch.location(in: self))
            for node in nodes {
                if node.isKind(of: SpaceShip.self) {
                    self.ship.move(touch.location(in: self).x)
                }
            }
        }
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ship.fire(scene: self)
    }

}

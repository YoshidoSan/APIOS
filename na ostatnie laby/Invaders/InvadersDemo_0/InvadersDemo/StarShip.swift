//
//  StarShip.swift
//  InvadersDemo
//
//  Created by apios on 08/12/2022.
//  Copyright © 2022 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class StarShip: SKSpriteNode {

    init() {
        let texture = SKTexture(imageNamed: "ship1")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())

        let shipTextures:[SKTexture] = [SKTexture(imageNamed: "ship1"), SKTexture(imageNamed: "ship2")]
        self.run(SKAction.repeatForever( SKAction.animate(with: shipTextures, timePerFrame: 0.1)))

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func fire(scene: SKScene){
        // Utworzenie pocisku
        let bullet = ShipBullet()
        bullet.position.x = self.position.x
        bullet.position.y = self.position.y + self.size.height/2
        scene.addChild(bullet) // dodanie pocisku do sceny
        
        bullet.animate(scene)
    }

    
    
    // przesuwanie statku do nowego położenia X
    func move(_ newX: CGFloat){
        run(SKAction.move(to: CGPoint(x: newX, y: self.position.y ), duration: 0.001))
    }

 
}

//
//  ShipBullet.swift
//  InvadersDemo
//
//  Created by apios on 08/12/2022.
//  Copyright © 2022 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class ShipBullet: Bullet {
    init(){
        super.init(imageName: "bullet", bulletSound: "bullet.mp3")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // Animacja lecącej kuli
    func animate(_ scene: SKScene){
        let moveBulletAction = SKAction.move(
            to: CGPoint(x:self.position.x, y:scene.size.height + self.size.height),
            duration: 1.0)
        run(SKAction.sequence([moveBulletAction, SKAction.removeFromParent()]))
    }
}

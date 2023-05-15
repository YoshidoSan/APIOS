//
//  Bullet.swift
//  InvadersDemo
//
//  Created by apios on 08/12/2022.
//  Copyright © 2022 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class Bullet: SKSpriteNode {

    init(imageName: String, bulletSound: String?) {
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        
        if(bulletSound != nil){ run(SKAction.playSoundFileNamed(bulletSound!, waitForCompletion: false)) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

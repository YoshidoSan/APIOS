//
//  Created by Adam Wojtasik on 30/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class Invader: SKSpriteNode {

	var invaderRow:Int
	var invaderColumn:Int

	init(_ row: Int,_ col: Int) {
		invaderRow = row
		invaderColumn = col
		let texture = SKTexture(imageNamed: "invader")
		super.init(texture: texture, color: SKColor.clear, size: texture.size())
		self.name = "invader"

		// Parametry do obsługi kolizji
		physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
		physicsBody?.isDynamic = true
		physicsBody?.usesPreciseCollisionDetection = false
		physicsBody?.categoryBitMask = Collision.Invader
		physicsBody?.contactTestBitMask = Collision.ShipBullet | Collision.Ship
		physicsBody?.collisionBitMask = 0x0
	}
 
	required init?(coder aDecoder: NSCoder) {
		invaderRow = 0
		invaderColumn = 0
		super.init(coder: aDecoder)
	}

	// Strzelanie
	func fire(scene: SKScene){
		let bullet = InvaderBullet()
		bullet.position.x = self.position.x
		bullet.position.y = self.position.y - self.size.height/2
		scene.addChild(bullet)

		bullet.animate(scene,true,2.0)
	}

}

//
//  Created by Adam Wojtasik on 30/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit


// klasa pocisku (bazowa)
class Bullet: SKSpriteNode {

	init(imageName: String, bulletSound: String?) {
		let texture = SKTexture(imageNamed: imageName)
		super.init(texture: texture, color: SKColor.clear, size: texture.size())
		if(bulletSound != nil){ run(SKAction.playSoundFileNamed(bulletSound!, waitForCompletion: false)) }

		// Parametry do obsługi kolizji
		physicsBody = SKPhysicsBody(texture: self.texture!, size:self.size)
		physicsBody?.isDynamic = true
		physicsBody?.usesPreciseCollisionDetection = false
		physicsBody?.collisionBitMask = 0x0
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// Animacja lecącej kuli
	func animate(_ scene: SKScene,_ direction:Bool,_ duration:Double){
		var point:CGPoint
		if direction{ point = CGPoint(x:self.position.x, y: 0 - self.size.height) }
		else{ point = CGPoint(x:self.position.x, y:scene.size.height + self.size.height) }

		let moveBulletAction = SKAction.move(to: point, duration: duration)
		run(SKAction.sequence([moveBulletAction, SKAction.removeFromParent()]))
	}
}

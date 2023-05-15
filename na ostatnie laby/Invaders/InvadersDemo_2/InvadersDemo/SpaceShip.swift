//
//  Created by Adam Wojtasik on 30/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class SpaceShip: SKSpriteNode {
	private var invincible = false
	private var lives = 3 {
		didSet {
			if lives < 0 { gameOver() }
			else{ hit() }
		}
	}

	private var canFire = true

	init() {
		let texture = SKTexture(imageNamed: "ship1")
		super.init(texture: texture, color: SKColor.clear, size: texture.size())
		self.name = "ship"

// Parametry do obsługi kolizji
		physicsBody = SKPhysicsBody(texture: self.texture!, size:self.size)
		physicsBody?.isDynamic = true
		physicsBody?.usesPreciseCollisionDetection = false
		physicsBody?.categoryBitMask = Collision.Ship
		physicsBody?.contactTestBitMask = Collision.InvBullet | Collision.Invader
		physicsBody?.collisionBitMask = 0x0

		// Uruchomoienie "na zawsze" akcji wymieniania rysunków statku (zawartych w tablicy): animacja statku
		let shipTextures:[SKTexture] = [SKTexture(imageNamed: "ship1"), SKTexture(imageNamed: "ship2")]
		self.run(SKAction.repeatForever( SKAction.animate(with: shipTextures, timePerFrame: 0.1)))
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}


	// przesuwanie statku do nowego położenia X
	func move(_ newX: CGFloat){
		run(SKAction.move(to: CGPoint(x: newX, y: self.position.y ), duration: 0.001))
	}

	func fire(scene: SKScene){
		if canFire {
			canFire = false
			// Utworzenie pocisku
			let bullet = ShipBullet()
			bullet.position.x = self.position.x
			bullet.position.y = self.position.y + self.size.height/2
			scene.addChild(bullet) // dodanie pocisku do sceny
			
			bullet.animate(scene,false,1)

			// Następny strzał dopiero po pewnym czasie
			run(SKAction.wait(forDuration: 0.5), completion:{ self.canFire = true })
		}
	}

	func gameOver(){
		// tu wstawić kod dla game over
	}

	// obsługa trafienia w statek
	func die(){ if(invincible == false){ lives -= 1 } }
	func hit(){
		invincible = true
		canFire = false
		let fadeOutIn = SKAction.repeat(SKAction.sequence([
			SKAction.fadeOut(withDuration: 0.4),
			SKAction.fadeIn (withDuration: 0.4)]), count: 3)
		
		run(SKAction.sequence([fadeOutIn, SKAction.run( {
			self.invincible = false
			self.canFire = true
		})]))
	}
}

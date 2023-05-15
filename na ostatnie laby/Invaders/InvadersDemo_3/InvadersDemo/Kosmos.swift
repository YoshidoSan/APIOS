//
//  Created by Adam Wojtasik on 30/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

// Flagi obiektów, których zderzenia nas interesują
struct Collision{
	static let Invader:    UInt32 = 0x1 << 0
	static let Ship:       UInt32 = 0x1 << 1
	static let InvBullet:  UInt32 = 0x1 << 2
	static let ShipBullet: UInt32 = 0x1 << 3
}


class Kosmos: SKScene, SKPhysicsContactDelegate {
	
	static var currInvaderRow = 2
	static var currInvaderCol = 3
	

	let ship = SpaceShip()
	var invaders:InvaderMatrix?
	
	override func didMove(to view: SKView) {
		
		self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
		self.physicsWorld.contactDelegate = self

		// Utworzenie emitera
		let starField = SKEmitterNode(fileNamed: "FallingStars")
		starField?.position = CGPoint(x: size.width/2, y: size.height/2)
		starField?.zPosition = -1000

		// Dodanie emitera do sceny
		addChild(starField!)
		
		// Dodanie statku do sceny
		ship.position = CGPoint(x:self.frame.midX, y:ship.size.height/2 + 10)
		addChild(ship)

		// Dodanie napastników do sceny
		Kosmos.currInvaderRow += 1
		Kosmos.currInvaderCol += 2
		invaders = InvaderMatrix(self, Kosmos.currInvaderRow, Kosmos.currInvaderCol)
	}

	override func update(_ currentTime: TimeInterval) {
		invaders?.move(self)
	}

	// Obsługa dotknięć
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		ship.fire(scene: self)
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

	// Obsługa kolizji
	func didBegin(_ contact: SKPhysicsContact) {
		var first = contact.bodyA
		var sec = contact.bodyB
		if contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask {
			first = contact.bodyB
			sec = contact.bodyA
		}
		
		if (first.categoryBitMask & Collision.Ship != 0) && (sec.categoryBitMask & Collision.InvBullet != 0) {
			ship.die()
		}
		
		if (first.categoryBitMask & Collision.Invader != 0) && (sec.categoryBitMask & Collision.Ship != 0) {
			ship.gameOver()
		}
		
		if (first.categoryBitMask & Collision.Invader != 0) && (sec.categoryBitMask & Collision.ShipBullet != 0){
			if (contact.bodyA.node?.parent == nil || contact.bodyB.node?.parent == nil) { return }
			
			self.invaders?.remove(self, first.node as! Invader)

			// Usunięcie pocisku ze sceny
			sec.node?.removeFromParent()
		}
	}

}

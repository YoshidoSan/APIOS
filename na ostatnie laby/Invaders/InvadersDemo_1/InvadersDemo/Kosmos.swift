//
//  Created by Adam Wojtasik on 30/11/2016.
//  Last changes: 29.04.2021
//  Copyright © 2016-2021 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit


class Kosmos: SKScene {

	let ship = SpaceShip()
	var invaders:InvaderMatrix?
	
	override func didMove(to view: SKView) {

		// Utworzenie emitera
		let starField = SKEmitterNode(fileNamed: "FallingStars")
		starField?.position = CGPoint(x: size.width/2, y: size.height/2)
		starField?.zPosition = -1000 // Emiter "na samym dnie"

		// Dodanie emitera do sceny
		addChild(starField!)
		
		// Dodanie statku do sceny
		ship.position = CGPoint(x:self.frame.midX, y:ship.size.height/2 + 10)
		addChild(ship)
    
        // Utworzenie napastników
		invaders = InvaderMatrix(self, 4, 5)
	}

    // Napastnicy mają się poruszać "automatycznie"
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

}

//
//  Created by Adam Wojtasik on 30/11/2016.
//  Last changes: 29.04.2021
//  Copyright © 2016-20121 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Foundation
import SpriteKit

class InvaderMatrix{
	var invadersWhoCanFire:[Invader] = []
	var invaderSpeed = 4
	let leftBounds = CGFloat(10)
	var rightBounds:CGFloat
	var moveDirection = true
	var moveCount = 0

	init(_ scene: SKScene, _ rows: Int,_ cols: Int){
		rightBounds = scene.size.width - 10

		// Wypełnianie matrycy napastnikami
		for i in 1...rows {
			for j in 1...cols {

				let newInvader = Invader(i, j)
				let invaderHalfWidth = newInvader.size.width/2
				let xPositionStart = scene.size.width/2 - invaderHalfWidth - (CGFloat(cols) * newInvader.size.width) + 10
				newInvader.position = CGPoint(x:xPositionStart + ((newInvader.size.width + 10)*(CGFloat(j-1))),
				                              y:CGFloat(scene.size.height - CGFloat(i) * (newInvader.size.height + 10)))
				scene.addChild(newInvader)
				if(i == rows){ invadersWhoCanFire.append(newInvader) }
			}
		}

// Organizacja strzelania
		let fireAction = SKAction.run(){ self.fire(scene) }
		let waitToNextFire = SKAction.wait(forDuration: 2)
		scene.run(SKAction.repeatForever(SKAction.sequence([fireAction,waitToNextFire])))
	
	}
	
	func fire(_ scene: SKScene){
		if(invadersWhoCanFire.isEmpty){
			// tu trzeba wstawić kod kończący - wszyscy napastnicy są zniszczeni
		}
		else{
			let randomInvader = invadersWhoCanFire.randomElement()
			randomInvader.fire(scene: scene)
		}
	}

	// Przesuwanie napastników
	func move(_ scene: SKScene){
		if moveDirection{ // przesuwanie w poziomie
            // Przejrzenie wszystkich węzłów sceny będących napastnikami
			scene.enumerateChildNodes(withName: "invader") {
                node, stop
                in
				let invader = node as! SKSpriteNode
				let invaderHalfWidth = invader.size.width/2
				invader.position.x -= CGFloat(self.invaderSpeed)
            
				if(invader.position.x > self.rightBounds - invaderHalfWidth || invader.position.x < self.leftBounds + invaderHalfWidth){
					self.moveDirection = false
				}
			}
		}
		else{ // przesuwanie w pionie
			scene.enumerateChildNodes(withName: "invader") {
                node, stop
                in
				let invader = node as! SKSpriteNode
				invader.position.y -= 2
			}
			self.moveCount += 1
			if(self.moveCount > 20){
				self.moveDirection = true
				self.invaderSpeed *= -1
				self.moveCount = 0
			}
		}
	}
}

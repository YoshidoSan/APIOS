//
//  Created by Adam Wojtasik on 30/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class SpaceShip: SKSpriteNode {
	init() {
		let texture = SKTexture(imageNamed: "ship1")
		super.init(texture: texture, color: SKColor.clear, size: texture.size())

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
		// Utworzenie pocisku
		let bullet = ShipBullet()
		bullet.position.x = self.position.x
		bullet.position.y = self.position.y + self.size.height/2
		scene.addChild(bullet) // dodanie pocisku do sceny
		
		bullet.animate(scene)
	}

}

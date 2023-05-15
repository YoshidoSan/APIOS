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
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

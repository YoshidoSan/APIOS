//
//  Created by Adam Wojtasik on 30/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class ShipBullet: Bullet {

	init(){
		super.init(imageName: "bullet", bulletSound: "bullet.mp3")

		// Parametry do obsługi kolizji
		physicsBody?.categoryBitMask = Collision.ShipBullet
		physicsBody?.contactTestBitMask = Collision.InvBullet
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

//
//  InvaderBullet.swift
//  InvadersDemo
//
//  Created by Adam Wojtasik on 30/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class InvaderBullet: Bullet {

	init(){
		super.init(imageName: "bullet", bulletSound: nil)

		// Parametry do obsługi kolizji
		physicsBody?.categoryBitMask = Collision.InvBullet
		physicsBody?.contactTestBitMask = Collision.Ship
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

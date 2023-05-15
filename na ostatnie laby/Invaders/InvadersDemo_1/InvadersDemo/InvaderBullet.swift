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
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	// Animacja lecącej kuli
	func animate(_ scene: SKScene){
		let moveBulletAction = SKAction.move(
			to: CGPoint(x:self.position.x, y: 0 - self.size.height),
			duration: 2.0)
		run(SKAction.sequence([moveBulletAction, SKAction.removeFromParent()]))
	}

}

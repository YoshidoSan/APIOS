//
//  Created by Adam Wojtasik on 01/12/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class NextLevel: SKScene {

	override func didMove(to view: SKView) {
		self.backgroundColor = SKColor.black
		let startGameButton = SKSpriteNode(imageNamed: "nextlevel")
		startGameButton.position = CGPoint(x: size.width/2, y: size.height/2 - 100)
		startGameButton.name = "nextlevel"
		addChild(startGameButton)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first
		let touchedNode = self.atPoint((touch?.location(in: self))!)
		if(touchedNode.name == "nextlevel"){
			let nextLevel = Kosmos(size: size)
			nextLevel.scaleMode = scaleMode
			view?.presentScene(nextLevel,transition: SKTransition.flipHorizontal(withDuration: 0.5))
		}
	}
}

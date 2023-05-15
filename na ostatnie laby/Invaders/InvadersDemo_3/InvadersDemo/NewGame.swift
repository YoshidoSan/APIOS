//
//  Created by Adam Wojtasik on 01/12/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit

class NewGame: SKScene {

	override func didMove(to view: SKView) {
		backgroundColor = SKColor.black
		let startGameButton = SKSpriteNode(imageNamed: "newgame")
		startGameButton.position = CGPoint(x: size.width/2,y: size.height/2 - 100)
		startGameButton.name = "startgame"
		addChild(startGameButton)
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first
		let touchLocation = touch?.location(in: self)
		let touchedNode = self.atPoint(touchLocation!)
		if(touchedNode.name == "startgame"){
			let gameScene = Kosmos(size: size)
			gameScene.scaleMode = scaleMode
			let transitionType = SKTransition.flipHorizontal(withDuration: 1.0)

			view?.presentScene(gameScene,transition: transitionType)
		}
	}

}

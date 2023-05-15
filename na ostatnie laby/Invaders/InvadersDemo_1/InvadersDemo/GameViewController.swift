//
//  Created by Adam Wojtasik on 30/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let scene = Kosmos(size: view.bounds.size) // Utworzenie sceny
		let skView = view as! SKView

		// Komunikaty kontyrolne
		skView.showsFPS = true
		skView.showsNodeCount = true
		
		// Szybkość renderingu
		skView.ignoresSiblingOrder = true
		
		scene.scaleMode = .resizeFill // Ma zajmować cały ekran
		
		// Wyświetlenie sceny
		skView.presentScene(scene)
	}

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

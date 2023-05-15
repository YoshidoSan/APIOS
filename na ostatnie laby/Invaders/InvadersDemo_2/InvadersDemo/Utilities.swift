//
//  Created by Adam Wojtasik on 30/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Foundation

extension Array {
	func randomElement() -> Element {
        let index = Int.random(in: 0..<self.count)
		return self[index]
	}
}

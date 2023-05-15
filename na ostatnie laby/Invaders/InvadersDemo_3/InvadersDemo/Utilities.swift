//
//  Created by Adam Wojtasik on 30/11/2016.
//  Last changes: 29.04.2021
//  Copyright © 2016-2021 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Foundation

extension Array {
	func randomElement() -> Element {
        let index = Int.random(in: 0..<self.count)
		return self[index]
	}
}

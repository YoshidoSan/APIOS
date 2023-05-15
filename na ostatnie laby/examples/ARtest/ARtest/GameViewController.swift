//
//  GameViewController.swift
//  ARtest
//
//  Created by apios on 08/12/2021.
//

import AppKit
import RealityKit

class GameViewController: NSViewController {
    
    @IBOutlet var arView: ARView!
    
    override func awakeFromNib() {
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}

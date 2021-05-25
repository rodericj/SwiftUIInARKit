//
//  ViewController.swift
//  SwiftUIInAR
//
//  Created by Roderic Campbell on 5/23/21.
//

import UIKit
import SceneKit
import ARKit
import SwiftUI

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
          
        if let imagesToTrack = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources",
                                                                bundle: Bundle.main) {
              
            configuration.trackingImages = imagesToTrack
                
          // this tells ARKit how many images it is supposed to track simultaneously,
          //ARKit can do upto 100
            configuration.maximumNumberOfTrackedImages = 1
          }
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate

    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        // Cast the found anchor as image anchor
        if let imageAnchor = anchor as? ARImageAnchor {
           return handleImageAnchor(imageAnchor: imageAnchor)
        }
        return nil
    }
}

//
//  ViewController.swift
//  Majin
//
//  Created by Rohit Nair on 4/19/18.
//  Copyright © 2018 Rohit Nair. All rights reserved.
//

import ARKit
import AVFoundation
import SceneKit
import UIKit
import Speech

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Debug - View the initial position and feature points for reference
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        // MARK: Scene setup
        // Set the view's delegate
        sceneView.delegate = self
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/Iron_Man/Iron_Man.scn")!
        // Set the scene to the view
        sceneView.scene = scene
        
        // Play audio file
        PlayAudioFile(fileName: "sample", fileExtension: "mp3")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SpeakText(text: TextConstants.WelcomeMsg)
        
//        do {
//            SpeakText(text: "Trying start 2")
//            try sceneView.audioEngine.start()
//            SpeakText(text: "start 2 done")
//        }
//        catch {
//            SpeakText(text: TextConstants.ErrorMsg)
//        }
        
    }
    
    // Speak on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SpeakText(text: TextConstants.TouchFeedback)
    }
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

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

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let synth = AVSpeechSynthesizer()
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
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
        let utterance = AVSpeechUtterance(string: TextConstants.WelcomeMsg)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synth.speak(utterance)
    }
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    /* Add a 2D ball on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let results = sceneView.hitTest(touch.location(in: sceneView), types: [ARHitTestResult.ResultType.featurePoint])
        guard let hitFeature = results.last else { return }
        let hitTransform = hitFeature.worldTransform
        let hitPosition = SCNVector3Make(hitTransform.columns.3.x,
                                         hitTransform.columns.3.y,
                                         hitTransform.columns.3.z)
        createBall(hitPosition: hitPosition)
    }
     
    func createBall(hitPosition : SCNVector3) {
        let newBall = SCNSphere(radius: 0.01)
        let newBallNode = SCNNode(geometry: newBall)
        newBallNode.position = hitPosition
        self.sceneView.scene.rootNode.addChildNode(newBallNode)
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let utterance = AVSpeechUtterance(string: TextConstants.TouchFeedback)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synth.speak(utterance)
    }
    
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

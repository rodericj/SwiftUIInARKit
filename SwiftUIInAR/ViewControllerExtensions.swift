import ARKit
import SceneKit
import SwiftUI

extension ViewController {
    func handleImageAnchor(imageAnchor: ARImageAnchor) -> SCNNode? {
        let node = SCNNode()
        // Check if the name of the detected image is the one you want
        // get the name of the image from the anchor
        guard let imageName = imageAnchor.name else { return nil }
        if imageName == "IMG_2582" {
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width,
                                 height: imageAnchor.referenceImage.physicalSize.height)
            
            
            let planeNode = SCNNode(geometry: plane)
            // When a plane geometry is created, by default it is oriented vertically
            // so we have to rotate it on X-axis by -90 degrees to
            // make it flat to the image detected
            planeNode.eulerAngles.x = -.pi / 2
            planeNode.position = SCNVector3(0.1, 0.1, 0)
            createHostingController(for: planeNode)
            
            node.addChildNode(planeNode)
            return node
        }
        return nil
    }
    
    private func createHostingController(for node: SCNNode) {
        // create a hosting controller with SwiftUI view
        let arVC = UIHostingController(rootView: ARCardView())
        
        // Do this on the main thread
        DispatchQueue.main.async {
            arVC.willMove(toParent: self)
            // make the hosting VC a child to the main view controller
            self.addChild(arVC)
            
            // set the pixel size of the Card View
            arVC.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
            arVC.view.clipsToBounds = false
            // add the ar card view as a subview to the main view
            self.view.addSubview(arVC.view)
            self.view.clipsToBounds = false
            
            // render the view on the plane geometry as a material
            self.show(hostingVC: arVC, on: node)
        }
    }
    
    func show(hostingVC: UIHostingController<ARCardView>, on node: SCNNode) {
        // create a new material
        let material = SCNMaterial()
        
        // this allows the card to render transparent parts the right way
        hostingVC.view.isOpaque = false
        
        // set the diffuse of the material to the view of the Hosting View Controller
        material.diffuse.contents = hostingVC.view
        
        // Set the material to the geometry of the node (plane geometry)
        node.geometry?.materials = [material]
        
        hostingVC.view.backgroundColor = UIColor.clear
    }
}

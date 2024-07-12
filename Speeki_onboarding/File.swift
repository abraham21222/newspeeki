
import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        SceneView(
            scene: {
                let scene = SCNScene(named: "untitled.usdz")!
                
                // Add ambient light
                let ambientLight = SCNNode()
                ambientLight.light = SCNLight()
                ambientLight.light?.type = .ambient
                ambientLight.light?.intensity = 100
                ambientLight.light?.color = UIColor.white
                scene.rootNode.addChildNode(ambientLight)
                
                // Add directional light
                let directionalLight = SCNNode()
                directionalLight.light = SCNLight()
                directionalLight.light?.type = .directional
                directionalLight.light?.intensity = 1000
                directionalLight.light?.color = UIColor.white
                directionalLight.position = SCNVector3(x: 0, y: 10, z: 10)
                directionalLight.eulerAngles = SCNVector3(x: -Float.pi / 4, y: 0, z: 0)
                scene.rootNode.addChildNode(directionalLight)
                
                return scene
            }(),
            options: [.allowsCameraControl]
        )
        .ignoresSafeArea()
    }
}

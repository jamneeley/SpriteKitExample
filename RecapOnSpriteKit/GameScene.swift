//
//  GameScene.swift
//  RecapOnSpriteKit
//
//  Created by James Neeley on 9/10/19.
//  Copyright © 2019 JamesNeeley. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    //MARK: - Init
    

    let _player: Player
    let _cameraNode: SKCameraNode
    var landscapes = [Landscape]()
    var touching: Bool = false
    var lastUpdateTime: CFTimeInterval = 0
    
    override init(size: CGSize) {
        _player = Player()
        _cameraNode = SKCameraNode()
        
        
        super.init(size: size)
        setup()
    }
    
    
    //MARK: - Setup
    
    
    func setup() {
        physicsWorld.contactDelegate = self
        addChild(_player)
        _player.position.x = size.width / 2
        _player.position.y = size.height / 2
        _player.zPosition = 1
        
        addChild(_cameraNode)
        camera = _cameraNode
        _cameraNode.position.x = size.width / 2
        _cameraNode.position.y = size.height / 2
        
        for i in 0 ..< 2 {
            let landscape = Landscape(size: size)
            landscape.position.x = CGFloat(i) * size.width
            landscapes.append(landscape)
            addChild(landscape)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        _player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 40))
        touching = true
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touching = false
    }
    
    
    
    //MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        //called roughly 60 times a second. its like onDraw
    
        var deltaTime = currentTime - lastUpdateTime
        if (deltaTime > 1) {
            deltaTime = 1 / 60
        }
        
        
        if (touching) {
            _player.physicsBody?.applyForce(CGVector(dx: 0, dy: 300))
        }
        
        
//        _player.physicsBody?.velocity = CGVector(dx: 3000 * deltaTime, dy: 0)
        _player.position.x += 100 * CGFloat(deltaTime)
//        _player.physicsBody?.applyForce(CGVector(dx: 40, dy: 0))
        
        _cameraNode.position.x = _player.position.x
        
        scrollLandscapes()
        lastUpdateTime = currentTime
    }
    

    func scrollLandscapes() {
        for landscape in landscapes {
            let dx = landscape.position.x - _cameraNode.position.x

            let offScreen = -(landscape.size.width + self.size.width / 2)

            if dx <  offScreen {
                landscape.position.x += (landscape.size.width * 2)
                landscape.reconfigureLandscape()
                
            }
        }
    }
    
    
    
    //MARK: - Physics Delegate
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        print("THIS IS HIT")
        if (collision == PhysicsCatagory.Coin | PhysicsCatagory.Player) {
            print("contact player and coin")
        } else if (collision == PhysicsCatagory.Enemy | PhysicsCatagory.Player){
            print("YOU DIED")
        }
    }
}

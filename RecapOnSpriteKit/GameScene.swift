//
//  GameScene.swift
//  RecapOnSpriteKit
//
//  Created by James Neeley on 9/10/19.
//  Copyright © 2019 JamesNeeley. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {    
    //MARK: - Init
    
    
    let _player: Player
    let _ground: Ground
    
    var touching: Bool = false
    
    override init(size: CGSize) {
        _player = Player()
        _ground = Ground(size: size)
        
        
        super.init(size: size)
        setup()
    }
    
    
    //MARK: - Setup
    
    
    func setup() {
        addChild(_player)
        addChild(_ground)
        
        _player.position.x = size.width / 2
        _player.position.y = size.height / 2
        
        _ground.position.x = size.width / 2
        _ground.position.y = _ground.size.height / 2
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
    
    override func update(_ currentTime: TimeInterval) {
        //called roughly 60 times a second. its like onDraw
        if (touching) {
            _player.physicsBody?.applyForce(CGVector(dx: 0, dy: 300))
        }

    }
    
}

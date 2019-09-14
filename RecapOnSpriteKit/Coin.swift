//
//  Coin.swift
//  RecapOnSpriteKit
//
//  Created by James Neeley on 9/13/19.
//  Copyright © 2019 JamesNeeley. All rights reserved.
//

import SpriteKit
class Coin: SKSpriteNode {

    //MARK: - init
    
    init() {
        let coinSize = CGSize(width: 20, height: 20)
        super.init(texture: nil, color: UIColor.yellow, size: coinSize)
    
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup
    
    func setup() {
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody?.isDynamic = false
        
        physicsBody?.categoryBitMask = PhysicsCatagory.Coin
        physicsBody?.collisionBitMask = PhysicsCatagory.Ground
        physicsBody?.contactTestBitMask = PhysicsCatagory.Player
    }
    
    
    //MARK: - helper functions
}

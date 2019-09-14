//
//  Enemy.swift
//  RecapOnSpriteKit
//
//  Created by James Neeley on 9/14/19.
//  Copyright © 2019 JamesNeeley. All rights reserved.
//

import SpriteKit

class Enemy: SKSpriteNode {
    
    
    //MARK: - init
    init() {
        let width = CGFloat(arc4random() % 5) * 20 + 40
        let height = CGFloat(arc4random() % 5) * 20 + 40
        let enemySize = CGSize(width: width, height: height)
        super.init(texture: nil, color: UIColor.red, size: enemySize)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - setup
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = PhysicsCatagory.Enemy
        physicsBody?.collisionBitMask = PhysicsCatagory.None
        physicsBody?.contactTestBitMask = PhysicsCatagory.Player
    }
}

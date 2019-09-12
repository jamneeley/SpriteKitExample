//
//  Player.swift
//  RecapOnSpriteKit
//
//  Created by James Neeley on 9/11/19.
//  Copyright © 2019 JamesNeeley. All rights reserved.
//

import SpriteKit


class Player: SKSpriteNode {
    
    //MARK: - Init
    
    init() {
        let playerSize = CGSize(width: 30, height: 60)
        super.init(texture: nil, color: UIColor.cyan, size:    playerSize)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - setup
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        
        
        
    }
}

//
//  Ground.swift
//  RecapOnSpriteKit
//
//  Created by James Neeley on 9/11/19.
//  Copyright © 2019 JamesNeeley. All rights reserved.
//

import SpriteKit

class Ground: SKSpriteNode {
    
    
    
    init(size: CGSize) {
        let groundSize = CGSize(width: size.width, height: 40   )
        super.init(texture: nil, color: UIColor.brown, size: groundSize)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = false //static and is not affected by things like gravity
        
    }
    
}

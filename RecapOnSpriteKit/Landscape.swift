//
//  Landscape.swift
//  RecapOnSpriteKit
//
//  Created by James Neeley on 9/12/19.
//  Copyright © 2019 JamesNeeley. All rights reserved.
//

import SpriteKit
class Landscape: SKNode {
    
    let background : SKSpriteNode
    let ground: Ground
    let size: CGSize
    //MARK: - init
    
    init(size: CGSize) {
        self.size = size

        let hue = CGFloat(arc4random() % 1000) / 1000
        background = SKSpriteNode(color: UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1), size: size)
        
        ground = Ground(size: CGSize(width: size.width, height: 40))
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - setup
    
    func setup() {
        addChild(background)
        addChild(ground)
        background.anchorPoint = CGPoint(x: 0, y: 0)
        ground.position.x = size.width / 2
        ground.position.y = ground.size.height / 2
        ground.zPosition = 1
        
    }
    

    

    
    //MARK: - Helper functions
    func reconfigureLandscape() {
        background.color = randomColor()
        //other stuff
        
    }
    
    func randomColor() -> UIColor {
        return UIColor(hue: CGFloat(arc4random() % 1000) / 1000, saturation: 1, brightness: 1, alpha: 1)
    }
    

}

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
    let contentNode: SKNode
    let ground: Ground
    let size: CGSize
    //MARK: - init
    
    init(size: CGSize) {
        self.size = size

        let hue = CGFloat(arc4random() % 1000) / 1000
        background = SKSpriteNode(color: UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1), size: size)
        
        ground = Ground(size: CGSize(width: size.width, height: 40))
        
        contentNode = SKNode()
        
        
        
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
        
        
        addChild(contentNode)
        
    }
    

    

    
    //MARK: - Helper functions
    func reconfigureLandscape() {
        background.color = randomColor()
        contentNode.removeAllChildren()
        
        let n = arc4random() % 2
        
        switch n {
        case 0:
            let coin = Coin()
            contentNode.addChild(coin)
            coin.position.x = CGFloat(arc4random() % UInt32(size.width))
            coin.position.y = CGFloat(arc4random() % UInt32(size.height - 100)) + 40
            break
        default:
            let enemy = Enemy()
            contentNode.addChild(enemy)
            enemy.position.x = CGFloat(arc4random() % UInt32(size.width  - enemy.size.width)) + enemy.size.width / 2
            enemy.position.y = CGFloat(arc4random() % UInt32(size.height - 100)) + 40
            break
        }
    
    }
    
    func randomColor() -> UIColor {
        return UIColor(hue: CGFloat(arc4random() % 1000) / 1000, saturation: 1, brightness: 1, alpha: 1)
    }
    

}

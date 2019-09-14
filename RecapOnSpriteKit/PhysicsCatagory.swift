//
//  PhysicsCatagory.swift
//  RecapOnSpriteKit
//
//  Created by James Neeley on 9/13/19.
//  Copyright © 2019 JamesNeeley. All rights reserved.
//

import Foundation


struct PhysicsCatagory {
    static let None: UInt32 = 0         //0000000
    static let Player: UInt32 = 0b1     //0000001
    static let Ground: UInt32 = 0b10    //0000010
    static let Coin: UInt32 = 0b100     //0000100
    static let Enemy: UInt32 = 0b1000   //0001000
}

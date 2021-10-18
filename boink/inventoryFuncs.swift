//
//  inventoryFuncs.swift
//  boink
//
//  Created by Dylan Dang on 10/9/21.
//

import SpriteKit
import GameplayKit
import AVFoundation


func equipSkin(){
    
    if userDefaults.value(forKey:"playerLookDown") == nil{
        userDefaults.setValue("default", forKey: UDKey.playerLookDown)
        userDefaults.setValue("default_TR", forKey: UDKey.playerTopRight)
        userDefaults.setValue("default_TL", forKey: UDKey.playerTopLeft)
        userDefaults.setValue("default_BL", forKey: UDKey.playerBottomLeft)
        userDefaults.setValue("default_BR", forKey: UDKey.playerBottomRight)
    }
    
    playerTopRight = SKTexture(imageNamed: userDefaults.value(forKey: UDKey.playerTopRight) as! String)
    playerTopLeft = SKTexture(imageNamed: userDefaults.value(forKey: UDKey.playerTopLeft) as! String)
    playerBottomLeft = SKTexture(imageNamed: userDefaults.value(forKey: UDKey.playerBottomLeft) as! String)
    playerBottomRight = SKTexture(imageNamed: userDefaults.value(forKey: UDKey.playerBottomRight) as! String)
    playerLookDown = SKTexture(imageNamed: userDefaults.value(forKey: UDKey.playerLookDown) as! String)
    
}



func addInventory(self:SKScene){
    if userDefaults.value(forKey: UDKey.inventory) == nil{
        userDefaults.setValue([PlayerSkin](), forKey: UDKey.inventory)
    }
    
    for skin in (userDefaults.value(forKey: UDKey.inventory) as! [PlayerSkin]){
        print("hi")
    }
}

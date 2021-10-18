//
//  publicclasses.swift
//  boink
//
//  Created by Dylan Dang on 9/29/21.
//

import SpriteKit
import GameplayKit
import AVFoundation

let diameter = screenHeight/25
public class ShopItem: NSObject {
    
    //node and name
    var shopNode = SKSpriteNode(color: .blue, size: CGSize(width: diameter, height: diameter))

    
    //price and condition
    var priceLabel = SKLabelNode()
    var bought = false
    var price:Int
    
    
    //order array based on QUADRANTS
    init(shopItemTexture:String, price:Int){
        
        //node setup
        self.shopNode.texture = SKTexture(imageNamed: shopItemTexture)
        
        self.price = price
        //price
        self.priceLabel.text = String(price)
        self.priceLabel.fontColor = .black
        self.priceLabel.fontSize = screenHeight/55
    }
    
    
    func setPosition(point:CGPoint, self:SKScene){
        shopNode.position = point
        priceLabel.position = CGPoint(x: point.x, y: point.y - screenHeight/25)
        
        self.addChild(shopNode)
        self.addChild(priceLabel)
    }
}



public class PlayerSkin : NSObject{
    
    var skinNode = SKSpriteNode(color: .green, size: CGSize(width: diameter, height: diameter))
    
    var topRight: String
    var topLeft: String
    var bottomLeft: String
    var bottomRight: String
    var lookDown: String
    
    var userDefaultsKey:String
    var bought:Bool
    
    
    
    //audio, background, enemy texture, borders, all textures??!?!
    
    
    
    //FOR shopItemTextureNames: 0th face down, 1 TR, 2TL, 3BL, 4BR like quadrants
    init(shopItemTextureNames:[String], userDefaultsKey:String){

        
        
        //node setup
        self.skinNode.texture = SKTexture(imageNamed: shopItemTextureNames[0])
        
        //turning textures
        self.topRight = shopItemTextureNames[1]
        self.topLeft = shopItemTextureNames[2]
        self.bottomLeft = shopItemTextureNames[3]
        self.bottomRight = shopItemTextureNames[4]
        self.lookDown = shopItemTextureNames[0]
        
        
        self.userDefaultsKey = userDefaultsKey
        userDefaults.setValue(false, forKey: userDefaultsKey)
        self.bought = false

    }
    
    func turnTopRight(){
        Player.texture = SKTexture(imageNamed:topRight)
    }
    func turnTopLeft(){
        Player.texture = SKTexture(imageNamed:topLeft)
    }
    func turnBottomLeft(){
        Player.texture = SKTexture(imageNamed:bottomLeft)
    }
    func turnBottomRight(){
        Player.texture = SKTexture(imageNamed:bottomRight)
    }
    func makeLookDown(){
        Player.texture = skinNode.texture
    }
    
    func changeToBought(){
        userDefaults.setValue(true, forKey: userDefaultsKey)
        bought = true
    }
    
    func equip(){
        userDefaults.setValue(topRight, forKey: UDKey.playerTopRight)
        userDefaults.setValue(topLeft, forKey: UDKey.playerTopLeft)
        userDefaults.setValue(bottomLeft, forKey: UDKey.playerBottomLeft)
        userDefaults.setValue(bottomRight, forKey: UDKey.playerBottomRight)
        userDefaults.setValue(lookDown, forKey: UDKey.playerLookDown)
        
        equipSkin()
    }
    
    
    func setPosition(point:CGPoint, self:SKScene){
        skinNode.position = point
        
        self.addChild(skinNode)
    }
}





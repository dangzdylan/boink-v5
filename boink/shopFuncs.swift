//
//  shop.swift
//  boink
//
//  Created by Dylan Dang on 9/11/21.
//

import SpriteKit
import GameplayKit


//TO SHOPSCENE
func addShopButton(self:SKScene){
    
    let shopButtonSize = screenHeight / 25
    shopButton = SKSpriteNode(color: .blue, size: CGSize(width: shopButtonSize, height: shopButtonSize))
    shopButton.position  = CGPoint(x: Player.position.x, y: Player.position.y - screenHeight/10)
    shopButton.texture = SKTexture(imageNamed: "shopButtonIcon")
    
    self.addChild(shopButton)
}





//AWAY FROM SHOPSCENE
func addBackToGameButton(self:SKScene){
    let backButtonSize = screenHeight / 25
    backToGameButton = SKSpriteNode(color: .purple, size: CGSize(width: backButtonSize, height: backButtonSize))
    backToGameButton.position = CGPoint(x: 0, y: -self.frame.height/2 + screenHeight/10)
    backToGameButton.texture = SKTexture(imageNamed: "lightGrayBall")
    self.addChild(backToGameButton)
    
}




//COINS LABEL
func addCoinPurseText(self:SKScene){
    if userDefaults.value(forKey: UDKey.coinPurse) == nil{
        userDefaults.setValue(0, forKey: UDKey.coinPurse)
    }
    let coinPurse:Int = userDefaults.value(forKey: UDKey.coinPurse) as! Int
    displayedCoinPurse = SKLabelNode(text: "Coins: " + String(coinPurse))
    displayedCoinPurse.fontSize = screenHeight / 50
    displayedCoinPurse.fontColor = .black
    
    let margins = screenHeight / 20
    displayedCoinPurse.position = CGPoint(x:-self.frame.width / 2 + margins, y: self.frame.height/2 - margins)
    
    
    self.addChild(displayedCoinPurse)
}




//RESET BUTTON
func addResetDataButton(self:SKScene){
    let diameter = screenHeight / 30
    resetDataButton = SKSpriteNode(color: .red, size: CGSize(width:diameter, height: diameter))
    resetDataButton.position = CGPoint(x:-self.frame.width / 2 + screenHeight / 25, y: backToGameButton.position.y)
    
    self.addChild(resetDataButton)
    
}

func resetButton(){
    userDefaults.setValue(0, forKey: UDKey.coinPurse)
    userDefaults.setValue(0, forKey: "highScore")
    displayedCoinPurse.text = "Coins: 0"
}



//ARE YOU SURE???
func confirmBuyShopItem(self:SKScene){
    confirmMenuActive = true

    
    let margins = screenHeight/30
    makeMenuBox(self: self)

    areYouLabel = SKLabelNode(text: "ARE YOU")
    areYouLabel.fontSize = screenHeight/30
    areYouLabel.position = CGPoint(x: menuBox.position.x, y: menuBox.position.y + screenHeight/20)
    areYouLabel.zPosition = menuBox.zPosition + 1
    
    sureLabel = SKLabelNode(text: "SURE?")
    sureLabel.fontSize = screenHeight/20
    sureLabel.position = menuBox.position
    sureLabel.zPosition = menuBox.zPosition + 1
    
    let buttonSize = menuBox.size.width/5
    
    confirmButton = SKSpriteNode(color: .green, size: CGSize(width:buttonSize, height: buttonSize))
    confirmButton.position = CGPoint(x: menuBox.position.x-margins, y: menuBox.position.y - (margins * 1.3))
    confirmButton.zPosition = menuBox.zPosition + 1
    
    declineButton = SKSpriteNode(color: .red, size: CGSize(width:buttonSize, height: buttonSize))
    declineButton.position = CGPoint(x: menuBox.position.x + margins, y: menuBox.position.y - (margins * 1.3))
    declineButton.zPosition = menuBox.zPosition + 1
    
    let nodeArr = [confirmButton, areYouLabel, sureLabel, declineButton, menuBox]
    
    for sprite in nodeArr{
        self.addChild(sprite)
        let spriteMove = SKAction.moveTo(y: sprite.position.y - menuBoxY, duration: 1)
        spriteMove.timingMode = .easeOut
        sprite.run(spriteMove)
    }
    
}




//ITEMS
func addShopItems(self:SKScene){
    
    basicChest.setPosition(point: shopItemPositions[0], self: self)
    
}


func attemptBuyShopItem(self:SKScene, item:ShopItem){
    let purse = userDefaults.value(forKey: UDKey.coinPurse) as! Int
    if purse >= item.price{
        confirmBuyShopItem(self:self)
        currentItemPurchase = item
    }
        
}






//TAKE FROM PURSE

func takefromPurse(){
    let value = userDefaults.value(forKey: UDKey.coinPurse) as! Int
    userDefaults.setValue(value - currentItemPurchase.price, forKey: UDKey.coinPurse)
    
    displayedCoinPurse.text = "Coins: " + String(userDefaults.value(forKey: UDKey.coinPurse) as! Int)
}





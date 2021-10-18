//
//  shopScene.swift
//  boink
//
//  Created by Dylan Dang on 9/11/21.
//

import SpriteKit
import GameplayKit



class ShopScene:SKScene{
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .blue
        addBackToGameButton(self: self)
        addCoinPurseText(self: self)
        addShopItems(self: self)
        //addResetDataButton(self: self)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)

            //back button
            if backToGameButton.contains(location) && !confirmMenuActive{
                let temp = GameScene(fileNamed: "GameScene")
                self.scene?.view?.presentScene(temp!, transition:SKTransition.fade(withDuration: 1))
            }else if resetDataButton.contains(location){
                resetButton()
            }
            
            //basic chest
            if basicChest.shopNode.contains(location) && !confirmMenuActive{
                attemptBuyShopItem(self: self, item:basicChest)
                }
            
            
            //confirm menu
            if confirmMenuActive{
                if confirmButton.contains(location) || declineButton.contains(location){
                    menuExit(self: self, boxArr: [confirmButton, areYouLabel, sureLabel, declineButton, menuBox])
                    confirmMenuActive = false
                    if confirmButton.contains(location){
                        takefromPurse()
                        
                        //transition
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: false){timer in
                            
                            let temp = UnboxingScene(fileNamed: "UnboxingScene")
                            self.scene?.view?.presentScene(temp!, transition:SKTransition.fade(withDuration: 1))
                        }

                    }
                }
            }
            
            //line
            
            
            
        }
    }
}

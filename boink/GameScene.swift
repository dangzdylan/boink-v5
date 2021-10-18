//
//  GameScene.swift
//  boink
//
//  Created by Dylan Dang on 8/20/21.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = .black
        self.physicsWorld.contactDelegate = self
        
        
        
        gameHasStarted = false
        addStartLabels(self: self)
        equipSkin()
        addBorders(self:self)
        addPlayer(self:self)
        addCoinObject(self: self)
        addSpawner(self: self)
        addHighScore(self: self)
        addShopButton(self: self)
        addCreaterName(self: self)
        
        //addLevelLabel(self: self)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //start game
        var breakForShop = false
        if !gameHasStarted{
            for touch in touches{
                let location = touch.location(in: self)
                if shopButton.contains(location){
                    let temp = ShopScene(fileNamed: "ShopScene")
                    self.scene?.view?.presentScene(temp!, transition:SKTransition.fade(withDuration: 1))
                    breakForShop = true
                }else{
                    gameHasStarted = true
                    startGame(self: self)
                }
            }
        }
        
        if !breakForShop{
            movePlayer(self:self)
        }
        
        //call game menu if game has ended
        if gameHasEnded{
            for touch in touches{
                let location = touch.location(in: self)
                if playAgain.contains(location) && playAgainButtonActive{
                    playAgainButtonActive = false
                    menuExit(self: self, boxArr: [menuBox, playAgain, scoreWordLabel, scoreNumberLabel])
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false){timer in
                        let temp = GameScene(fileNamed: "GameScene")
                        self.scene?.view?.presentScene(temp!, transition: SKTransition.fade(withDuration: 1))
                    }
                }
            
            }
        }
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision:UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        
        //rotate player texture and change direction
        if collision == ColliderType.Player | ColliderType.topBorder{
            goingUp = !goingUp
            PlayerTouchBorder(borderBit: ColliderType.topBorder)
        } else if collision == ColliderType.Player | ColliderType.bottomBorder{
            goingUp = !goingUp
            PlayerTouchBorder(borderBit: ColliderType.bottomBorder)
        } else if collision == ColliderType.Player | ColliderType.rightBorder{
            goingRight = !goingRight
            PlayerTouchBorder(borderBit: ColliderType.rightBorder)
        } else if collision == ColliderType.Player | ColliderType.leftBorder{
            goingRight = !goingRight
            PlayerTouchBorder(borderBit: ColliderType.leftBorder)
        }
        
        //ensure monster is body A
        var bodyA = contact.bodyA
        var bodyB = contact.bodyB
        if bodyB.categoryBitMask == ColliderType.Monster{
            bodyA = contact.bodyB
            bodyB = contact.bodyA
        }
        
        //monster vs borders
        if bodyA.categoryBitMask == ColliderType.Monster{
            monsterMovement(bodyA:bodyA, collision:collision)
        }
        
        //player vs monster
        if collision == ColliderType.Player | ColliderType.Monster && !gameHasEnded{
            
            gameOverAnimation(self:self)
            
            //game over
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false){timer in
                gameOver(self: self)
                
            }
        }
        //player vs coin
        if collision == ColliderType.Player | ColliderType.coin{
            touchCoin(self:self)
        }
        
        
        
    }


    
}




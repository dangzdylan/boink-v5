//
//  startpage.swift
//  dodge2
//
//  Created by Dylan on 8/9/21.
//  Copyright © 2021 S-Crew. All rights reserved.
//

import SpriteKit
import GameplayKit

func addStartLabels(self: GameScene){
    
    //dec
    tapToLabel = SKLabelNode(text: "Tap to")
    startLabel = SKLabelNode(text: "start")
    
    //attributes
    tapToLabel.fontSize = screenHeight/30
    startLabel.fontSize = screenHeight/30
    
    tapToLabel.position = CGPoint(x: 0, y: screenHeight/30)
    startLabel.position = CGPoint(x: 0, y: -screenHeight/20)
    
    tapToLabel.fontColor = labelColor
    startLabel.fontColor = labelColor
    
    //add to scene
    self.addChild(tapToLabel)
    self.addChild(startLabel)
}


func startGame(self:GameScene){
    
    score.isHidden = false
    //hide start labels
    tapToLabel.isHidden = true
    startLabel.isHidden = true
    
    
    goingRight = false
    goingUp = true
    
    //set gamestate
    gameHasStarted = true
    gameHasEnded = false
    
    //reset spawn monster ind
    spawnArrInd = 0
    
    //call funcs
    addScoreLabel(self: self)
    spawnMonster(self: self)
    
    //hide highscore
    highScoreWordLabel.isHidden = true
    
    //remove shop button
    shopButton.removeFromParent()

}


func addCreaterName(self:SKScene){
    DylanDanglabel = SKLabelNode(text: "By Dylan Dang")
    
    DylanDanglabel.fontSize = screenHeight/100
    DylanDanglabel.fontColor = .white
    
    DylanDanglabel.position = CGPoint(x: self.frame.width/2 - screenHeight/30, y: -self.frame.height/2 + screenHeight/60)
    
    self.addChild(DylanDanglabel)
}

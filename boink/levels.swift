//
//  levels.swift
//  boink
//
//  Created by Dylan Dang on 9/19/21.
//

import SpriteKit
import GameplayKit
import AVFoundation



func addLevelLabel(self:SKScene){
    
    if userDefaults.value(forKey: "currentLevel") == nil{
        userDefaults.setValue(1, forKey: "currentLevel")
    }
    
    let levelString = String(userDefaults.value(forKey: "currentLevel") as! Int)
    currentLevelLabel = SKLabelNode(text: "Level " + levelString)
    currentLevelLabel.fontSize = screenHeight/52
    currentLevelLabel.fontColor = .white
    currentLevelLabel.position = CGPoint(x: xPointBorder - currentLevelLabel.fontSize, y: yPointBorder + screenHeight/90)
    
    self.addChild(currentLevelLabel)
                    
}




func checkForChangeLevel(self:SKScene){
    
    
    if scoreNum == 10{
        secondLevel(self:self)
    }else if scoreNum == 20{
        thirdLevel(self:self)
    }else if scoreNum == 30{
        fourthLevel(self:self)
    }else if scoreNum == 40{
        fifthLevel(self:self)
    }
}




func secondLevel(self:SKScene){
    spawnMonster(self: self)
}

func thirdLevel(self:SKScene){
    spawnMonster(self: self)
}

func fourthLevel(self:SKScene){
    monsterArray[0].removeFromParent()
    monsterSpeed *= 1.1
}

func fifthLevel(self:SKScene){
    monsterSpeed *= 1.1
    playerSpeed *= 1.1
}

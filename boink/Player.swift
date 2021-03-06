//
//  Player.swift
//  dodge2
//
//  Created by Dylan on 8/2/21.
//  Copyright © 2021 S-Crew. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation


func addPlayer(self:SKScene){
    
    let diameter = screenHeight/52
    Player = SKSpriteNode(color: .gray, size: CGSize(width: diameter, height: diameter))
    
    Player.texture = playerLookDown
    Player.zRotation = 0
    
    Player.position = CGPoint(x: 0, y: 0)

    //player physics
    Player.physicsBody = SKPhysicsBody(circleOfRadius: diameter / 2)
    
    Player.physicsBody?.categoryBitMask = ColliderType.Player
    Player.physicsBody?.contactTestBitMask = ColliderType.coin | ColliderType.topBorder | ColliderType.bottomBorder | ColliderType.Monster | ColliderType.rightBorder | ColliderType.leftBorder
    Player.physicsBody?.collisionBitMask = ColliderType.topBorder | ColliderType.bottomBorder | ColliderType.leftBorder | ColliderType.rightBorder
    Player.physicsBody?.isDynamic = true
    Player.physicsBody?.affectedByGravity = false
    Player.physicsBody?.angularDamping = 0
    Player.physicsBody?.linearDamping = 0
    Player.physicsBody?.restitution = 1
    Player.physicsBody?.friction = 0

    self.addChild(Player)
}


func movePlayer(self:SKScene){
        if goingUp == true{
            if !goingRight{
                playerVelo = CGVector(dx: playerSpeed, dy: playerSpeed)
                Player.texture = playerTopRight
            }else{
                playerVelo = CGVector(dx: -playerSpeed, dy: playerSpeed)
                Player.texture = playerTopLeft
            }
        }else{
            if !goingRight{
                playerVelo = CGVector(dx: playerSpeed, dy: -playerSpeed)
                Player.texture = playerBottomRight
            }else{
                playerVelo = CGVector(dx: -playerSpeed, dy: -playerSpeed)
                Player.texture = playerBottomLeft
            }
        }
        goingRight = !goingRight
    
    
        Player.physicsBody?.velocity = CGVector(dx:0, dy:0)
        Player.physicsBody?.applyImpulse(playerVelo)
    
        //play sound
    if Player.physicsBody?.isDynamic == true{
        //playSound(soundName:"playerMove", type:"mp3", volume:1)
    }
}

//TODO
func PlayerTouchBorder(borderBit:UInt32){
    
    if borderBit == ColliderType.topBorder{
        if Player.texture == playerTopLeft{
            Player.texture = playerBottomLeft
        }else{
            Player.texture = playerBottomRight
        }
    }else if borderBit == ColliderType.bottomBorder{
        if Player.texture == playerBottomLeft{
            Player.texture = playerTopLeft
        }else{
            Player.texture = playerTopRight
        }
    }else if borderBit == ColliderType.rightBorder{
        if Player.texture == playerBottomRight{
            Player.texture = playerBottomLeft
        }else{
            Player.texture = playerTopLeft
        }
    }else if borderBit == ColliderType.leftBorder{
        if Player.texture == playerBottomLeft{
            Player.texture = playerBottomRight
        }else{
            Player.texture = playerTopRight
        }
    }
}

//TODO FIX ERROR
func movePlayerSound(){
    let path = Bundle.main.path(forResource: "playerMove.mp3", ofType: nil)!
    let url = URL(fileURLWithPath: path)
    var audioPlayer = AVAudioPlayer()
    
    do{
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer.play()
    }catch{
        print("PLAYER MOVE SOUND ERROR")
    }
}




//
//  textures.swift
//  boink
//
//  Created by Dylan Dang on 8/22/21.
//

import SpriteKit
import GameplayKit


//monster
public var monsterBottomLeft = SKTexture(imageNamed: "monsterBottomLeft")
public var monsterBottomRight = SKTexture(imageNamed: "monsterBottomRight")
public var monsterTopLeft = SKTexture(imageNamed: "monsterTopLeft")
public var monsterTopRight = SKTexture(imageNamed: "monsterTopRight")

//player
public var playerTopRight = SKTexture()
public var playerTopLeft = SKTexture()
public var playerBottomLeft = SKTexture()
public var playerBottomRight = SKTexture()
public var playerLookDown = SKTexture()




//skins
public var defaultSkin = PlayerSkin(shopItemTextureNames: ["default", "default_TR", "default_TL", "default_BL", "default_BR"], userDefaultsKey: "defaultSkin")

//public var blackbirdSkin = PlayerSkin(shopItemTextureNames: ["blackBird", "blackBird_TR", "blackBird_TL", "blackBird_BL", "blackBird_BR"], userDefaultsKey: "blackbirdSkin")

//public var oldManSkin = PlayerSkin(shopItemTextureNames: ["oldMan", "oldMan_TR", "oldMan_TL", "oldMan_BL", "oldMan_BR"], userDefaultsKey: "oldManSkin")




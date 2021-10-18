//
//  shopvars.swift
//  boink
//
//  Created by Dylan Dang on 9/20/21.
//

import SpriteKit
import GameplayKit
import AVFoundation



//shop
public var shopButton = SKSpriteNode()
public var backToGameButton = SKSpriteNode()
public var displayedCoinPurse = SKLabelNode()
public var resetDataButton = SKSpriteNode()



//shop items
public var basicChest = ShopItem(shopItemTexture: "grayBall", price: 1)
public var shopItemPositions = [CGPoint(x:0, y:0)]



//confirm purchase
public var confirmMenuActive = false
public var areYouLabel = SKLabelNode()
public var sureLabel = SKLabelNode()
public var confirmButton = SKSpriteNode()
public var declineButton = SKSpriteNode()
public var currentItemPurchase = basicChest



//make dictionary for objects and decide how and what to store
//make function that takes in appropriate arguments and makes new shop item object (position, textures, etc)
//use bools to save data on whether you have shop item

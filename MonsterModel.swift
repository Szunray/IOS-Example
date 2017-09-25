//
//  MonsterModel.swift
//  MonsterRoster
//
//  Created by user128720 on 7/31/17.
//  Copyright © 2017 djbcn6. All rights reserved.
//
import UIKit
struct Monster{
    let name: String
    let animation: [UIImage]
    let behindAnimation: [UIImage]
    let mirrorAnim: [UIImage]
    let mirrorAway: [UIImage]
    let index: Int
    init ( Name type: String, _ frames: Int, _ num: Int){
        name=type
        index=num
        var anim = [UIImage]()
        var inverseAnim = [UIImage]()
        var awayAnim = [UIImage]()
        var awayAndRight=[UIImage]()
        for i in 1...frames{
            let imageString = "\(name)_0\(i).png"
            print (imageString)
            let reverseString = "\(name)B_0\(i).png"
            print (reverseString)
            
            if let frame = (UIImage(named: imageString)){
            anim.append(frame)
                let inverseFrame = flipImageLeftRight(frame)
            inverseAnim.append(inverseFrame!)
                
                if let backFrame = (UIImage(named: reverseString)){
                    awayAnim.append(backFrame)
                    let newFrame = flipImageLeftRight(backFrame)
                    awayAndRight.append(newFrame!)
                    print("away anims found")
                    
                }
                print("Success")
            }
            
            
        }
    
        animation = anim
        behindAnimation = awayAnim
        mirrorAway = awayAndRight
        mirrorAnim = inverseAnim
        
    }
    
}

func flipImageLeftRight(_ image: UIImage) -> UIImage? {
    
    UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
    let context = UIGraphicsGetCurrentContext()!
    context.translateBy(x: image.size.width, y: image.size.height)
    context.scaleBy(x: -image.scale, y: -image.scale)
    
    context.draw(image.cgImage!, in: CGRect(origin:CGPoint.zero, size: image.size))
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return newImage
}

class MonsterModel{
    public var bestiary = [Monster]()
    public var monsters = [Monster]()
    init(){
        //bestiary.append(Monster(Name: "SpriteTest",6,0))
        bestiary.append(Monster(Name: "Harpy",7,1))
        bestiary.append(Monster(Name: "Ifrit",6,2))
        bestiary.append(Monster(Name: "Scarab",6,3))
        bestiary.append(Monster(Name: "Mermaid",4,4))//monsters.append(bestiary[1])
    }
    func addMonster(){
        let newMonster=(bestiary[Int(arc4random_uniform(UInt32(bestiary.count)))])
        monsters.append(newMonster)
        print("\(newMonster.name) added!")
        
    }
}
import Foundation

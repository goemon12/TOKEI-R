//
//  ViewController.swift
//  TOKEI-R
//
//  Created by ただひろ on 2018/11/03.
//  Copyright © 2018年 Goemon. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    var scene: SKScene!

    var lblH: [UILabel] = []
    var lblM: [UILabel] = []
    var lblS: [UILabel] = []
    var fmtH: DateFormatter!
    var fmtM: DateFormatter!
    var fmtS: DateFormatter!
    
    func makeH() {
        for i in 0 ..< 24 {
            let tmp = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            tmp.font = UIFont(name: "Courier", size: 50)
            tmp.textAlignment = .center
            tmp.text = "\(i)"
            self.view.addSubview(tmp)
            
            lblH.append(tmp)
        }
    }
    
    func makeM() {
        for i in 0 ..< 60 {
            let tmp = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            tmp.font = UIFont(name: "Courier", size: 50)
            tmp.textAlignment = .center
            tmp.text = "\(i)"
            self.view.addSubview(tmp)

            lblM.append(tmp)
        }
    }
    
    func makeS() {
        for i in 0 ..< 60 {
            let tmp = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            tmp.font = UIFont(name: "Courier", size: 50)
            tmp.textAlignment = .center
            tmp.text = "\(i)"
            self.view.addSubview(tmp)
            
            lblS.append(tmp)
        }
    }

    func dispH() {
        let strH = fmtH.string(from: Date())
        let intH = Int(strH)!
        let w: CGFloat = self.view.frame.width
        let h: CGFloat = self.view.frame.height
        let r: CGFloat = 300
        
        for i in 0 ..< 24 {
            let t = CGFloat.pi * 2 / 24 * CGFloat(i - intH)
            let x = cos(t) * r + w / 2 - r - 100
            let y = sin(t) * r + h / 2
            lblH[i].center = CGPoint(x: x, y: y)
            lblH[i].transform = CGAffineTransform(rotationAngle: t)
        }
    }

    func dispM() {
        let strM = fmtM.string(from: Date())
        let intM = Int(strM)!
        let w: CGFloat = self.view.frame.width
        let h: CGFloat = self.view.frame.height
        let r: CGFloat = 400

        for i in 0 ..< 60 {
            let t = CGFloat.pi * 2 / 60 * CGFloat(i - intM)
            let x = cos(t) * r + w / 2 - r
            let y = sin(t) * r + h / 2
            lblM[i].center = CGPoint(x: x, y: y)
            lblM[i].transform = CGAffineTransform(rotationAngle: t)
        }
    }

    func dispS() {
        let strS = fmtS.string(from: Date())
        let intS = Int(strS)!
        let w: CGFloat = self.view.frame.width
        let h: CGFloat = self.view.frame.height
        let r: CGFloat = 500

        for i in 0 ..< 60 {
            let t = CGFloat.pi * 2 / 60 * CGFloat(i - intS)
            let x = cos(t) * r + w / 2 - r + 100
            let y = sin(t) * r + h / 2
            lblS[i].center = CGPoint(x: x, y: y)
            lblS[i].transform = CGAffineTransform(rotationAngle: t)
        }
    }
    
    func makeH2() {
        let tmp = SKNode()
        
        let tmp1 = SKShapeNode(circleOfRadius: 100)
        tmp1.position = CGPoint(x: 0, y: 0)
        tmp1.fillColor = UIColor.lightGray
        tmp1.strokeColor = UIColor.white
        tmp.addChild(tmp1)
        
        for i in 0 ..< 24 {
            let tmp2 = SKLabelNode(fontNamed: "Courier")
            tmp2.text = String(format: "%02d", i)
            tmp2.fontSize = 20.0
            tmp2.fontColor = UIColor.black
            tmp2.verticalAlignmentMode = .center
            tmp2.horizontalAlignmentMode = .center
            
            
            let t = CGFloat.pi * 2 / 24 * CGFloat(i)
            let x = cos(t) * 90
            let y = sin(t) * 90
            tmp2.position = CGPoint(x: x, y: y)
            tmp2.zRotation = t
            tmp.addChild(tmp2)
        }
        
        tmp.position = CGPoint(x: 160, y: 160)
        scene.addChild(tmp)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scene = SKScene(size: CGSize(width: 320, height: 320))
        scene.scaleMode = .aspectFit
        let skView = self.view as! SKView
        skView.presentScene(scene)        
        
        fmtH = DateFormatter()
        fmtM = DateFormatter()
        fmtS = DateFormatter()
        fmtH.dateFormat = "HH"
        fmtM.dateFormat = "mm"
        fmtS.dateFormat = "ss"
        
        makeH2()

        /*
        makeM()
        makeH()
        makeS()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            _ in
            self.dispH()
            self.dispM()
            self.dispS()
        })
 */
    }
}

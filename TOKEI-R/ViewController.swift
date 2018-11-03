//
//  ViewController.swift
//  TOKEI-R
//
//  Created by ただひろ on 2018/11/03.
//  Copyright © 2018年 Goemon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lblH: [UILabel] = []
    var lblM: [UILabel] = []
    var lblS: [UILabel] = []
    
    func makeH() {
        for i in 0 ..< 24 {
            let tmp = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            tmp.font = UIFont(name: "Courier", size: 20)
            tmp.textAlignment = .center
            tmp.text = "\(i)"
            self.view.addSubview(tmp)
            
            lblH.append(tmp)
        }
    }
    
    func makeM() {
        for i in stride(from: 0, to: 60, by: 5) {
            let tmp = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            tmp.font = UIFont(name: "Courier", size: 20)
            tmp.textAlignment = .center
            tmp.text = "\(i)"
            self.view.addSubview(tmp)

            lblM.append(tmp)
        }
    }
    
    func makeS() {
        for i in stride(from: 0, to: 60, by: 5) {
            let tmp = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            tmp.font = UIFont(name: "Courier", size: 20)
            tmp.textAlignment = .center
            tmp.text = "\(i)"
            self.view.addSubview(tmp)
            
            lblS.append(tmp)
        }
    }

    func dispH() {
        for i in 0 ..< 24 {
            let t = CGFloat.pi * 2 / 24 * CGFloat(i)
            let x = cos(t) * (self.view.frame.width / 2 - 75) + self.view.center.x
            let y = sin(t) * (self.view.frame.width / 2 - 75) + self.view.center.y
            lblH[i].center = CGPoint(x: x, y: y)
            lblH[i].transform = CGAffineTransform(rotationAngle: t)
        }
    }

    func dispM() {
        for i in stride(from: 0, to: 60, by: 5) {
            let t = CGFloat.pi * 2 / 60 * CGFloat(i)
            let x = cos(t) * (self.view.frame.width / 2 - 45) + self.view.center.x
            let y = sin(t) * (self.view.frame.width / 2 - 45) + self.view.center.y
            lblM[i / 5].center = CGPoint(x: x, y: y)
            lblM[i / 5].transform = CGAffineTransform(rotationAngle: t)
        }
    }

    func dispS() {
        for i in stride(from: 0, to: 60, by: 5) {
            let t = CGFloat.pi * 2 / 60 * CGFloat(i)
            let x = cos(t) * (self.view.frame.width / 2 - 15) + self.view.center.x
            let y = sin(t) * (self.view.frame.width / 2 - 15) + self.view.center.y
            lblS[i / 5].center = CGPoint(x: x, y: y)
            lblS[i / 5].transform = CGAffineTransform(rotationAngle: t)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        makeH()
        makeM()
        makeS()
        dispH()
        dispM()
        dispS()
    }


}


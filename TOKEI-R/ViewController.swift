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
    var fmtH: DateFormatter!
    var fmtM: DateFormatter!
    var fmtS: DateFormatter!
    
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
        for i in 0 ..< 60 {
            let tmp = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            if (i % 5 == 0) {
                tmp.font = UIFont(name: "Courier", size: 20)
            }
            else {
                tmp.font = UIFont(name: "Courier", size: 14)
            }
            tmp.textAlignment = .center
            tmp.text = "\(i)"
            self.view.addSubview(tmp)

            lblM.append(tmp)
        }
    }
    
    func makeS() {
        for i in 0 ..< 60 {
            let tmp = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            if (i % 5 == 0) {
                tmp.font = UIFont(name: "Courier", size: 20)
            }
            else {
                tmp.font = UIFont(name: "Courier", size: 14)
            }
            tmp.textAlignment = .center
            tmp.text = "\(i)"
            self.view.addSubview(tmp)
            
            lblS.append(tmp)
        }
    }

    func dispH() {
        let strH = fmtH.string(from: Date())
        let intH = Int(strH)!
        
        for i in 0 ..< 24 {
            let t = CGFloat.pi * 2 / 24 * CGFloat(i - intH)
            let x = cos(t) * (self.view.frame.width / 2 - 75) + self.view.center.x
            let y = sin(t) * (self.view.frame.width / 2 - 75) + self.view.center.y
            lblH[i].center = CGPoint(x: x, y: y)
            lblH[i].transform = CGAffineTransform(rotationAngle: t)
        }
    }

    func dispM() {
        let strM = fmtM.string(from: Date())
        let intM = Int(strM)!

        for i in 0 ..< 60 {
            let t = CGFloat.pi * 2 / 60 * CGFloat(i - intM)
            let x = cos(t) * (self.view.frame.width / 2 - 45) + self.view.center.x
            let y = sin(t) * (self.view.frame.width / 2 - 45) + self.view.center.y
            lblM[i].center = CGPoint(x: x, y: y)
            lblM[i].transform = CGAffineTransform(rotationAngle: t)
        }
    }

    func dispS() {
        let strS = fmtS.string(from: Date())
        let intS = Int(strS)!

        for i in 0 ..< 60 {
            let t = CGFloat.pi * 2 / 60 * CGFloat(i - intS)
            let x = cos(t) * (self.view.frame.width / 2 - 15) + self.view.center.x
            let y = sin(t) * (self.view.frame.width / 2 - 15) + self.view.center.y
            lblS[i].center = CGPoint(x: x, y: y)
            lblS[i].transform = CGAffineTransform(rotationAngle: t)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fmtH = DateFormatter()
        fmtM = DateFormatter()
        fmtS = DateFormatter()
        fmtH.dateFormat = "HH"
        fmtM.dateFormat = "mm"
        fmtS.dateFormat = "ss"
        
        makeH()
        makeM()
        makeS()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            _ in
            self.dispH()
            self.dispM()
            self.dispS()
        })
    }


}


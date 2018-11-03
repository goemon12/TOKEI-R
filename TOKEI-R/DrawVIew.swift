//
//  DrawVIew.swift
//  TOKEI-R
//
//  Created by ただひろ on 2018/11/03.
//  Copyright © 2018年 Goemon. All rights reserved.
//

import UIKit

class DrawVIew: UIView {

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(UIColor.white.cgColor)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(2.0)
        
        context?.beginPath()
        
        context?.addArc(
            center: CGPoint(x: self.center.x, y: self.center.y),
            radius: self.frame.width / 2,
            startAngle: 0,
            endAngle: CGFloat.pi * 2,
            clockwise: false)
        
        context?.addArc(
            center: CGPoint(x: self.center.x, y: self.center.y),
            radius: self.frame.width / 2 - 28,
            startAngle: CGFloat.pi * 2,
            endAngle: 0,
            clockwise: true)

        context?.fillPath()
        
        context?.beginPath()
        
        context?.addArc(
            center: CGPoint(x: self.center.x, y: self.center.y),
            radius: self.frame.width / 2 - 30,
            startAngle: 0,
            endAngle: CGFloat.pi * 2,
            clockwise: false)
        
        context?.addArc(
            center: CGPoint(x: self.center.x, y: self.center.y),
            radius: self.frame.width / 2 - (30 + 28),
            startAngle: CGFloat.pi * 2,
            endAngle: 0,
            clockwise: true)
        
        context?.fillPath()

        context?.beginPath()
        
        context?.addArc(
            center: CGPoint(x: self.center.x, y: self.center.y),
            radius: self.frame.width / 2 - 60,
            startAngle: 0,
            endAngle: CGFloat.pi * 2,
            clockwise: false)
        
        context?.addArc(
            center: CGPoint(x: self.center.x, y: self.center.y),
            radius: self.frame.width / 2 - (60 + 28),
            startAngle: CGFloat.pi * 2,
            endAngle: 0,
            clockwise: true)
        
        context?.fillPath()
        
        context?.stroke(CGRect(x: self.frame.width - 90, y: self.center.y - 20, width: 90, height: 40))
    }
}

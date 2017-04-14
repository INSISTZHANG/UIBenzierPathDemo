//
//  CoreGraphicsView.swift
//  UIBezierPathDemo
//
//  Created by zhangji on 2017/4/5.
//  Copyright © 2017年 张基. All rights reserved.
//  CoreGraphics绘制图形

import UIKit

class CoreGraphicsView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
//        let rectAngel: CGRect = CGRect(x: 80, y: 400, width: 160, height: 60)
//        let ctx: CGContext = UIGraphicsGetCurrentContext()!
//        ctx.addRect(rectAngel)
//        ctx.setFillColor(UIColor.lightGray.cgColor)
//        ctx.fillPath()
        
        drawCircle(x: self.bounds.size.width / 2 , y: 300)
        drawEyeCircle(x: self.bounds.size.width / 2 - 90, y: 200)
        drawEyeCircle(x: self.bounds.size.width / 2 + 50, y: 200)
        drawTrialAngle()
        
    }
    //绘制圆形
    func drawCircle(x: CGFloat, y: CGFloat) {
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.addArc(center: CGPoint(x: x, y: y), radius: 150, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        ctx.setFillColor(UIColor.yellow.cgColor)
        ctx.fillPath()
    }
    //绘制椭圆
    func drawEyeCircle(x: CGFloat,y: CGFloat){
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.addEllipse(in: CGRect(x: x, y: y, width: 60, height: 30))
        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fillPath()
    }
    
    
    // 绘制三角形
    func drawTrialAngle() {
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.beginPath()
        ctx.move(to: CGPoint(x: self.bounds.size.width / 2, y: 120))
        ctx.addLine(to: CGPoint(x: self.bounds.size.width / 2 - 30, y: 120 + 30))
        ctx.addLine(to: CGPoint(x: self.bounds.size.width / 2 + 30, y: 120 + 30))
        ctx.closePath()
        ctx.setFillColor(UIColor.blue.cgColor)
        ctx.fillPath()
    }
    
    
    //绘制弧度
//    func createHudu() {
//        let ctx: CGContext = UIGraphicsGetCurrentContext()!
//        ctx.beginPath()
//        ctx.addQuadCurve(to: CGPoint(), control: <#T##CGPoint#>)
//        
//        
//        
//    }
    
    
    
    
    
    
    
    

}

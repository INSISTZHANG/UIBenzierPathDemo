//
//  YYInnerView.swift
//  UIBezierPathDemo
//
//  Created by zhangji on 2017/4/5.
//  Copyright © 2017年 张基. All rights reserved.
//

import UIKit
import CoreGraphics

class YYInnerView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        //设置画笔颜色
        UIColor.red.setFill()
        //画笔范围大小
        UIRectFill(CGRect(x: 20, y: 20, width: 50, height: 50))
        let color = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0.5, alpha: 1)
        //设置线条颜色
        color.set()
        let path = UIBezierPath(rect: CGRect(x: 20, y: 100, width: 50, height: 50))
        //圆形
//        let path = UIBezierPath(ovalIn: CGRect(x: 20, y: 100, width: 50, height: 50))
        //椭圆
//        let path = UIBezierPath(ovalIn: CGRect(x: 20, y: 100, width: 50, height: 20))
        path.lineWidth = 8
        //线条拐角处理
        path.lineCapStyle = .butt
        
        
        //线条终点处理
        path.lineJoinStyle = .bevel
        
        
        path.stroke()
        
        
        
        let si = self.bounds.size
        
        let margin: CGFloat = 10
        
        //rintf 四舍五入函数
        
        //半径
        let radius: CGFloat = rint(min(si.height - margin, si.width - margin) / 4)
        
        
        var xOffSet,yOffSet: CGFloat
        
        let offffSet: CGFloat = 50
        
//        if offffSet > 0 {
            xOffSet = rint(margin / 2)
            yOffSet = rint(offffSet)
//        } else {
//            xOffSet = -offffSet
//            yOffSet = rint(margin / 2)
//        }
        let path2 = UIBezierPath()
        //圆心点，半径，开始角度，结束角度，顺时针
        path2.addArc(withCenter: CGPoint(x: radius * 2 + xOffSet, y: radius + yOffSet), radius: radius, startAngle: -(CGFloat)(Double.pi), endAngle: 0, clockwise: true)
        
        
        path2.addArc(withCenter: CGPoint(x: radius * 3 + xOffSet, y: radius * 2 + yOffSet), radius: radius, startAngle: -(CGFloat)(M_PI_2), endAngle: CGFloat(M_PI_2), clockwise: true)
        path2.addArc(withCenter: CGPoint(x: radius * 2 + xOffSet, y: radius * 3 + yOffSet), radius: radius, startAngle: 0, endAngle: CGFloat(M_PI), clockwise: true)
        path2.addArc(withCenter: CGPoint(x: radius + xOffSet, y: radius * 2 + yOffSet), radius: radius, startAngle: CGFloat(M_PI_2), endAngle: -(CGFloat)(M_PI_2), clockwise: true)
        
        
       path2.close()
        
        
        path2.fill()
        
        //
        
        
        
        
        
        let rectAngel: CGRect = CGRect(x: 80, y: 200, width: 160, height: 60)
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        
        ctx.addRect(rectAngel)
        ctx.setFillColor(UIColor.lightGray.cgColor)
        ctx.fillPath()
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    override func awakeFromNib() {
        
        self.contentMode = .redraw
    }
    
    override func layoutSubviews() {
        self.backgroundColor = UIColor.white
 
        
    }
    
    
    

}

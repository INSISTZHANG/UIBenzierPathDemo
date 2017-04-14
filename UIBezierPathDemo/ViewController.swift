//
//  ViewController.swift
//  UIBezierPathDemo
//
//  Created by zhangji on 2017/3/29.
//  Copyright © 2017年 张基. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var layer6: CAShapeLayer? = nil
    var tempView: UIView? = nil
    var layer0: CALayer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createBenzierLine()
 
    }

    func createBenzierLine()  {
        tempView = UIView(frame: self.view.bounds)
        tempView?.frame.size = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height  - 100)
//        tempView?.frame.origin = CGPoint(x: 0, y: 100)
        tempView?.backgroundColor = UIColor.yellow
        self.view.addSubview(tempView!)
        
        tempView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(click(_ :))))
        
        
        
        // 矩形的layer
        let path = UIBezierPath(rect: CGRect(x: 50, y: 50, width: 50, height: 50))
        let layer0 = CAShapeLayer()
        layer0.path = path.cgPath
        layer0.fillColor = UIColor.clear.cgColor
        layer0.strokeColor = UIColor.brown.cgColor
        tempView?.layer.addSublayer(layer0)
        
        // 四个角带圆角的矩形layer
        let path1 = UIBezierPath(roundedRect: CGRect(x: 50, y: 120, width: 50, height: 50), cornerRadius: 25)
        let layer1 = CAShapeLayer()
        layer1.path = path1.cgPath
        layer1.strokeColor = UIColor.brown.cgColor
        self.view.layer.addSublayer(layer1)
        
        // 控制单个圆角的矩形layer
        let path2 = UIBezierPath(roundedRect: CGRect(x: 50, y: 180, width: 100, height: 100), byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: 10, height: 10))
        let layer2 = CAShapeLayer()
        layer2.path = path2.cgPath
        layer2.strokeColor = UIColor.red.cgColor
        self.view.layer.addSublayer(layer2)
        
        //贝塞尔曲线
        let startPoint = CGPoint(x: 50, y: 300)
        let endPoint = CGPoint(x: 300, y: 300)
        let controlPoint = CGPoint(x: 170, y: 150)
        
        let layer3 = CALayer()
        layer3.frame = CGRect(x: startPoint.x, y: startPoint.y, width: 5, height: 5)
        layer3.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(layer3)
        
        let layer4 = CALayer()
        layer4.frame = CGRect(x: endPoint.x, y: endPoint.y, width: 5, height: 5)
        layer4.backgroundColor  = UIColor.red.cgColor
        self.view.layer.addSublayer(layer4)
        
        let layer5 = CALayer()
        layer5.frame = CGRect(x: controlPoint.x, y: controlPoint.y, width: 5, height: 5)
        layer5.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(layer5)
        
        let shapePath = UIBezierPath()
        let shapelayer = CAShapeLayer()
        
        shapePath.move(to: startPoint)
//        shapePath.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        shapePath.addCurve(to: endPoint, controlPoint1: CGPoint(x: 150, y: 300), controlPoint2: CGPoint(x: 250, y: 500))
        shapelayer.path = shapePath.cgPath
        shapelayer.strokeColor = UIColor.black.cgColor
        shapelayer.fillColor = UIColor.clear.cgColor
        
        self.view.layer.addSublayer(shapelayer)
        
//        animation1(shapelayer)
        animation2(shapelayer)
//        animation3(shapelayer)
        
        //
        layer6 = CAShapeLayer()
        layer6?.fillColor = UIColor.cyan.cgColor
        layer6?.strokeColor = UIColor.red.cgColor
        let topLeftPoint = CGPoint(x: 50, y: 400)
        let bottomLeftPoint = CGPoint(x: 50, y: 500)
        let bottomRightPoint = CGPoint(x: 300, y: 500)
        let topRightPoint = CGPoint(x: 300, y: 400)
        
        let benzierpath = UIBezierPath()
        //开始点
        benzierpath.move(to: topLeftPoint)
        benzierpath.addLine(to: bottomLeftPoint)
        benzierpath.addLine(to: bottomRightPoint)
        benzierpath.addLine(to: topRightPoint)
        benzierpath.addQuadCurve(to: topLeftPoint, controlPoint: CGPoint(x: 50 + 250 / 2, y: 300))

        
        //画直线用 addLine,画弧度用addQuadCurve
        
        layer6?.path = benzierpath.cgPath
        tempView?.layer.addSublayer(layer6!)
        animation1(layer6!)
    }
    
    //MARK: - CAShapeLayer 添加点击事件
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let point: CGPoint = touch.location(in: self.view)
        if (layer6?.path?.contains(point))! {
            print("finish")
        } else {
            self.navigationController?.pushViewController(EyeAnimationTableViewController(), animated: true)
        }
        

    }
    
    func click(_ tap:UITapGestureRecognizer) {
        let po = tap .location(in: tap.view)
        if (layer6?.path?.contains(po))! {
//            print("click")
            
        }
        
        
        
    }
        
    
    
    func animation1(_ layer: CAShapeLayer)  {
        //一条路径从0到1慢慢出现
//        let animate = CABasicAnimation(keyPath: "strokeEnd")
//        animate.fromValue = 0
//        animate.toValue = 1
//        animate.duration = 2
//        layer.add(animate, forKey: "")
        
        //一条路径从1到0慢慢消失
        let animate = CABasicAnimation(keyPath: "strokeEnd")
        animate.fromValue = 1
        animate.toValue = 0
        animate.duration = 2
        layer.add(animate, forKey: "")
        
        
        //一条路径从0到1慢慢消失
//        let animate = CABasicAnimation(keyPath: "strokeStart")
//        animate.fromValue = 0
//        animate.toValue = 1
//        animate.duration = 2
//        layer.add(animate, forKey: "")
        
        //一条路径从1到0慢慢出现
//        let animate = CABasicAnimation(keyPath: "strokeStart")
//        animate.fromValue = 1
//        animate.toValue = 0
//        animate.duration = 2
//        layer.add(animate, forKey: "")
        
    }
    
    func animation2(_ layer: CAShapeLayer)  {
        //
        layer.strokeStart = 0.5
        layer.strokeEnd = 0.5
        
        //从中间点绘制到开始点
        let animate = CABasicAnimation(keyPath: "strokeStart")
        animate.fromValue = 0.5
        animate.toValue = 0
        animate.duration = 2
        animate.isRemovedOnCompletion = false

        
        //从中间点绘制到结束点
        let animate2 = CABasicAnimation(keyPath: "strokeEnd")
        animate2.fromValue = 0.5
        animate2.toValue = 1
        animate2.duration = 2
        
        //2个动画不能同时存在，异常
        layer.add(animate, forKey: "strokeStartAnimation")
//        layer.add(animate2, forKey: "strokeEndAnimation")
    }
    
    func animation3(_ layer: CAShapeLayer)  {
        let animate = CABasicAnimation(keyPath: "lineWidth")
        animate.fromValue = 1
        animate.toValue = 10
        animate.duration = 2
        layer.add(animate, forKey: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


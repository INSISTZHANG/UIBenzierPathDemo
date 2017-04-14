//
//  XXViewController.swift
//  UIBezierPathDemo
//
//  Created by zhangji on 2017/3/31.
//  Copyright © 2017年 张基. All rights reserved.
//

import UIKit

class XXViewController: UIViewController {
    var layerView: UIView!
    var blueLayer: CALayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.initBlueLayer()

        // Do any additional setup after loading the view.
    }
    
    func initBlueLayer()
    {
        self.layerView = UIView()
        self.layerView.backgroundColor = UIColor.white
        self.layerView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        self.view.addSubview(self.layerView)
        self.blueLayer = CALayer()
        self.blueLayer.frame = CGRect(x: 20, y: 20, width: 160, height: 160)
        self.blueLayer.backgroundColor = UIColor.blue.cgColor
        self.layerView.layer.addSublayer(self.blueLayer)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first! as UITouch
        let point = touch.location(in: self.view)
        let layer = self.layerView.layer.hitTest(point)
        if layer == self.blueLayer
        {
            print("Inside Blue Layer")
        }else if layer == self.layerView.layer
        {
            print("Inside White layer")
        }else{
            print("123")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

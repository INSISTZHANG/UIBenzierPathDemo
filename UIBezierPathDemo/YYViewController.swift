//
//  YYViewController.swift
//  UIBezierPathDemo
//
//  Created by zhangji on 2017/4/5.
//  Copyright © 2017年 张基. All rights reserved.
//

import UIKit

class YYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(YYInnerView(frame: CGRect(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height - 64)))
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.navigationController?.pushViewController(CoreGraphicsViewController(), animated: true)
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

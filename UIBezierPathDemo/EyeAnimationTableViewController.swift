//
//  EyeAnimationTableViewController.swift
//  UIBezierPathDemo
//
//  Created by zhangji on 2017/3/30.
//  Copyright © 2017年 张基. All rights reserved.
//

import UIKit

class EyeAnimationTableViewController: UITableViewController {

    var firstEyeLayer: CAShapeLayer?
    var secondEyeLayer: CAShapeLayer?
    var eyeBallLayer: CAShapeLayer?
    var topEyeSocketLayer: CAShapeLayer?
    var bottomEyeSocketLayer: CAShapeLayer?
    
    
    
    var screenRect: CGRect {
        
        return self.view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.view.backgroundColor = UIColor.black
        
        firstEyeLayer = CAShapeLayer()
        let centerPoint = CGPoint(x: self.view.frame.width / 2, y: -50)
        let path1 = UIBezierPath(arcCenter: centerPoint, radius: 10, startAngle: CGFloat((230.0 / 180.0) * Double.pi), endAngle: CGFloat((265 / 180) * Double.pi), clockwise: true)
        firstEyeLayer?.borderColor = UIColor.black.cgColor
        firstEyeLayer?.lineWidth = 5
        firstEyeLayer?.path = path1.cgPath
        firstEyeLayer?.fillColor = UIColor.clear.cgColor
        firstEyeLayer?.strokeColor = UIColor.red.cgColor
        self.tableView.layer.addSublayer(firstEyeLayer!)
        
        secondEyeLayer = CAShapeLayer()
        let path2 = UIBezierPath(arcCenter: centerPoint, radius: 10, startAngle: CGFloat((211.0 / 180.0) * Double.pi), endAngle: CGFloat((220.0/180.0) * Double.pi), clockwise: true)
        secondEyeLayer?.borderColor = UIColor.black.cgColor
        secondEyeLayer?.lineWidth = 5
        secondEyeLayer?.path = path2.cgPath
        secondEyeLayer?.fillColor = UIColor.clear.cgColor
        secondEyeLayer?.strokeColor = UIColor.yellow.cgColor
        self.tableView.layer.addSublayer(secondEyeLayer!)
        
        eyeBallLayer = CAShapeLayer()
        let path3 = UIBezierPath(arcCenter: centerPoint, radius: 10, startAngle: CGFloat((0.0/180.0) * Double.pi), endAngle: CGFloat((360.0/180.0) * Double.pi), clockwise: true)
        eyeBallLayer?.borderColor = UIColor.black.cgColor
        eyeBallLayer?.lineWidth = 1
        eyeBallLayer?.path = path3.cgPath
        eyeBallLayer?.fillColor = UIColor.clear.cgColor
        eyeBallLayer?.strokeColor = UIColor.green.cgColor
        eyeBallLayer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.tableView.layer.addSublayer(eyeBallLayer!)
        
        topEyeSocketLayer = CAShapeLayer()
        let topEyeScockerPath = UIBezierPath()
        topEyeScockerPath.move(to: CGPoint(x: 150, y: -50))
        topEyeScockerPath.addQuadCurve(to: CGPoint(x: screenRect.width - 150, y: -50), controlPoint: CGPoint(x: screenRect.width / 2, y: -100))
        topEyeSocketLayer?.borderColor = UIColor.black.cgColor
        topEyeSocketLayer?.lineWidth = 1
        topEyeSocketLayer?.path = topEyeScockerPath.cgPath
        topEyeSocketLayer?.fillColor = UIColor.clear.cgColor
        topEyeSocketLayer?.strokeColor = UIColor.yellow.cgColor
        self.tableView.layer.addSublayer(topEyeSocketLayer!)
        
        
        
        bottomEyeSocketLayer = CAShapeLayer()
        let bottomSocketPath = UIBezierPath()
        bottomSocketPath.move(to: CGPoint(x: 150, y: -50))
        bottomSocketPath.addQuadCurve(to: CGPoint(x: screenRect.width - 150, y: -50), controlPoint: CGPoint(x: screenRect.width / 2, y: 0))
        bottomEyeSocketLayer?.borderColor = UIColor.black.cgColor
        bottomEyeSocketLayer?.lineWidth = 1
        bottomEyeSocketLayer?.path = bottomSocketPath.cgPath
        bottomEyeSocketLayer?.fillColor = UIColor.clear.cgColor
        bottomEyeSocketLayer?.strokeColor = UIColor.yellow.cgColor
        self.tableView.layer.addSublayer(bottomEyeSocketLayer!)
        
        firstEyeLayer?.lineWidth = 0
        secondEyeLayer?.lineWidth = 0
        eyeBallLayer?.opacity = 0
        topEyeSocketLayer?.strokeStart = 0.5
        topEyeSocketLayer?.strokeEnd = 0.5
        bottomEyeSocketLayer?.strokeStart = 0.5
        bottomEyeSocketLayer?.strokeEnd = 0.5
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")

        cell.selectionStyle = .none
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(YYViewController(), animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offSet: CGFloat = scrollView.contentOffset.y
        print(offSet)
        if offSet < -135 {
            if (firstEyeLayer?.lineWidth)! < CGFloat(5)  {
                firstEyeLayer?.lineWidth += 1
            }
            if (secondEyeLayer?.lineWidth)! < CGFloat(5) {
                secondEyeLayer?.lineWidth += 1
            }
        }
        if offSet > -135 {
            if (firstEyeLayer?.lineWidth)! > CGFloat(0) {
                firstEyeLayer?.lineWidth -= 1
                secondEyeLayer?.lineWidth -= 1
            }
        }
        if offSet < -135 - 20 {
            if (eyeBallLayer?.opacity)! < Float(1) {
                eyeBallLayer?.opacity += 0.1
            }
        }
        
        
        
        if offSet > -135-20 {
            if (eyeBallLayer?.opacity)! > 0 {
                eyeBallLayer?.opacity -= 0.1
                
            }
        }
        
        
        
        
        if offSet < -135-40 {
            //strokeEnd 趋于1，strokeStart趋于0，完全显示
            if (topEyeSocketLayer?.strokeEnd)! < 1,(topEyeSocketLayer?.strokeStart)! > 0 {
                topEyeSocketLayer?.strokeEnd += 0.1
                topEyeSocketLayer?.strokeStart -= 0.1
                
                
                
                bottomEyeSocketLayer?.strokeEnd += 0.1
                bottomEyeSocketLayer?.strokeStart -= 0.1
            }
        }
        if offSet > -135-40 {
            if (topEyeSocketLayer?.strokeEnd)! > 0.5,(topEyeSocketLayer?.strokeStart)! < 0.5 {
                
                
                
                topEyeSocketLayer?.strokeEnd -= 0.1
                topEyeSocketLayer?.strokeStart += 0.1
                
                
                
                
                bottomEyeSocketLayer?.strokeEnd -= 0.1
                bottomEyeSocketLayer?.strokeStart += 0.1
            }
        }
        
    
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

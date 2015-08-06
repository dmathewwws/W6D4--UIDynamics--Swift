//
//  ViewController.swift
//  W6D4- UIDynamics- Swift
//
//  Created by Daniel Mathews on 2015-08-06.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator:UIDynamicAnimator!
    var alertView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animator = UIDynamicAnimator(referenceView: view)
        
    }
    
    @IBAction func showAlertPressed(sender: UIButton) {
    
        if alertView == nil {
            createAlertView()
        }
        
        let snapBehaviour = UISnapBehavior(item: alertView!, snapToPoint: view.center)
        animator.addBehavior(snapBehaviour)
    }
    
    func createAlertView() {
        
        alertView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        alertView?.backgroundColor = UIColor.redColor()
        alertView?.layer.cornerRadius = 10
        alertView?.layer.shadowColor = UIColor.blackColor().CGColor
        alertView?.layer.shadowOffset = CGSize(width: 5, height: 10)
        alertView?.layer.shadowOpacity = 0.7
        alertView?.layer.shadowRadius = 5.0
        
        view.addSubview(alertView!)
        
        let button = UIButton(type: .System)
        button.frame = CGRect(x: (alertView?.frame.size.width)!-20, y: 0, width: 20, height: 20)
        button.setTitle("X", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.addTarget(self, action: "dismissAlertView:", forControlEvents: UIControlEvents.TouchUpInside)
        alertView?.addSubview(button)
        
    }
    
    func dismissAlertView(sender:UIButton){
        
        animator.removeAllBehaviors()
        
        let gravityBehaviour = UIGravityBehavior(items: [alertView!])
        animator.addBehavior(gravityBehaviour)
        
        let itemBehaviour = UIDynamicItemBehavior(items: [alertView!])
        itemBehaviour.addAngularVelocity(CGFloat(-M_PI), forItem: alertView!)
        animator.addBehavior(itemBehaviour)
        
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            alertView?.alpha=0
            }) { (success) -> Void in
                self.alertView?.removeFromSuperview()
                self.alertView = nil
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


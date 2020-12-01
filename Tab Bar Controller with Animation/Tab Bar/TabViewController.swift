//
//  TabViewController.swift
//  Tab Bar Controller with Animation
//
//  Created by Adwait Barkale on 01/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    var image1 : UIImageView!
    var image2 : UIImageView!
    var image3 : UIImageView!
    var image4 : UIImageView!
    var image5 : UIImageView!
    var image6 : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        //makeTabBarTransparent()
        
        var itemView = self.tabBar.subviews[0]
        self.image1 = itemView.subviews.first as? UIImageView
        self.image1.contentMode = .center
        
        itemView = self.tabBar.subviews[1]
        self.image2 = itemView.subviews.first as? UIImageView
        self.image2.contentMode = .center
        
        itemView = self.tabBar.subviews[2]
        self.image3 = itemView.subviews.first as? UIImageView
        self.image3.contentMode = .center
        
        itemView = self.tabBar.subviews[3]
        self.image4 = itemView.subviews.first as? UIImageView
        self.image4.contentMode = .center
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1
        {
            //self.image1.transform = CGAffineTransform(rotationAngle: 360)
            self.image1.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5) {
                self.image1.transform = .identity
                //self.image1.transform =  CGAffineTransform(rotationAngle: .pi/2)
            }
        }else if item.tag == 2{
            self.image1.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5) {
                self.image1.transform = .identity
                self.image1.transform =  CGAffineTransform(rotationAngle: .pi/2)
            }
        }else if item.tag == 3{
            self.image1.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5) {
                self.image1.transform = .identity
                self.image1.transform =  CGAffineTransform(rotationAngle: .pi/2)
            }
        }else if item.tag == 4{
            self.image1.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5) {
                self.image1.transform = .identity
                self.image1.transform =  CGAffineTransform(rotationAngle: .pi/2)
            }
        }
    }
    
    func makeTabBarTransparent()
    {
        let transperentBlackColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        transperentBlackColor.setFill()
        UIRectFill(rect)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            tabBar.backgroundImage = image
        }
        
        UIGraphicsEndImageContext()
    }
}


extension TabViewController : UITabBarControllerDelegate
{
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return TabViewAnimation()
    }
    
}

class TabViewAnimation: NSObject, UIViewControllerAnimatedTransitioning
{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.view(forKey: .to) else { return }
        
        //Down to Top
        //destination.transform = CGAffineTransform(translationX: 0, y: destination.frame.height)
        
        //Right to Left
        destination.transform = CGAffineTransform(translationX: destination.frame.width, y: 0)
        
        transitionContext.containerView.addSubview(destination)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            destination.transform = .identity
        }, completion: { transitionContext.completeTransition($0)})
    }
    
}



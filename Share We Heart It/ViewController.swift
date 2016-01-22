//
//  ViewController.swift
//  Share We Heart It
//
//  Created by Rafael K. Streit on 22/01/16.
//  Copyright © 2016 We Heart It. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonShare: UIButton!
    
    // MARK: View Controller Life Cycle
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isInstalled() {
            buttonShare.setTitle("Install We Heart It", forState: .Normal)
        }
    }
    
    
    // MARK: Installation checks
    
    private func isInstalled() -> Bool {
        let url = NSURL(string: "whi://")!
        return UIApplication.sharedApplication().canOpenURL(url)
    }
    
    
    // MARK: IBAction
    
    @IBAction func buttonPressed(sender: AnyObject) {
        // If the app isn't installed, go to the App Store
        if !isInstalled() {
            let url = NSURL(string: "itms-apps://itunes.apple.com/ca/app/whi/id539124565?mt=8")!
            UIApplication.sharedApplication().openURL(url)
            return
        }
        
        // Put some image in the clipboard image property
        let image = UIImage(named: "Dog")
        UIPasteboard.generalPasteboard().image = image
        
        // Open WHI app
        let url = NSURL(string: "whi://native_share?tags=foo,bar,baz&caption=Caption%20of%20Image&via=MyApp")!
        UIApplication.sharedApplication().openURL(url)
    }
    
}


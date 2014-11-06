//
//  AppDelegate.swift
//  Chorizo
//
//  Created by Vandad NP on 11/5/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    let array1 = ["Vandad", "Nahavandipoor"]
    let array2 = array1.attachTo(["Sara", "Lindstedt"])
    
    return true
  }
}


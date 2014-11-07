//
//  ChorizoPlist.swift
//  Chorizo
//
//  Created by Vandad NP on 11/7/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation

enum ChorizoPlistKey: String{
  case BundleName = "CFBundleName"
  case BundleVersion = "CFBundleVersion"
}

struct ChorizoPlist{
  
  static func valueForKeyPath(path: String) -> AnyObject{
    return NSBundle.mainBundle().infoDictionary![path]!
  }
  
  static func bundleName() -> String{
    return self.valueForKeyPath(ChorizoPlistKey.BundleName.rawValue) as String
  }
  
  static func bundleVersion() -> String{
    return self.valueForKeyPath(ChorizoPlistKey.BundleVersion.rawValue) as String
  }
  
}
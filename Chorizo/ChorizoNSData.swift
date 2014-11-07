//
//  ChorizoNSData.swift
//  Chorizo
//
//  Created by Vandad NP on 11/7/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation

extension NSData{
  
  func toString() -> String{
    return self.toStringWithEncoding(0)
  }
  
  func toStringWithEncoding(encoding: UInt) -> String{
    return NSString(data: self, encoding: encoding) as String
  }
  
}
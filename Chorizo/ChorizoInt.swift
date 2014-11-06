//
//  ChorizoInt.swift
//  Chorizo
//
//  Created by Vandad Nahavandipoor on 06/11/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation

extension Int{
  
  func toString() -> String{
    return "\(self)"
  }
  
  func toArray() -> [Int]{
    return [self]
  }
  
  func toArray(repeat: Int) -> [Int]{
    return [Int](count: repeat, repeatedValue: self)
  }
  
}
//
//  ChorizoDouble.swift
//  Chorizo
//
//  Created by Vandad NP on 11/6/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation

extension Double{
  
  func toString() -> String{
    return "\(self)"
  }
  
  func toArray() -> [Double]{
    return [self]
  }
  
  func toArray(repeat: Int) -> [Double]{
    return [Double](count: repeat, repeatedValue: self)
  }
  
  func and(anotherDouble: Double) -> [Double]{
    return [self, anotherDouble]
  }
  
  func and(anotherObject: Any) -> [Any]{
    return [self, anotherObject]
  }
  
  func and(otherObjects: Any ...) -> [Any]{
    var array = [Any]()
    
    for item in otherObjects{
      array.append(item)
    }
    
    return array
  }
  
}
//
//  ChorizoArray.swift
//  Chorizo
//
//  Created by Vandad NP on 11/6/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

extension Array{
  
  func attachTo(array: Array) -> Array{
    
    var newArray = Array<T>(self)
    
    for object in array{
      newArray.append(object)
    }
    
    return newArray
    
  }
  
  func separatedBy(separator: String) -> String{
    
    var finalString = ""
    
    for obj in self{
      if let string = obj as? String{
        finalString += string
        if let theLast = self.last as? String{
          finalString += separator
        }
      }
    }
    
    return finalString
    
  }
  
}

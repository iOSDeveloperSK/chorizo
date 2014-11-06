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
  
}

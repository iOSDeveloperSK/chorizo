//
//  ChorizoUrlBuilder.swift
//  Chorizo
//
//  Created by Vandad NP on 11/12/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation

//TODO: code this
class ChorizoUrlBuilder{
  
  var baseUrl: NSURL
  
  init(baseUrl: NSURL){
    self.baseUrl = baseUrl
  }
  
  func append(urlPart: String) -> Self{
    return self
  }
  
  func append(parameterName: String, value: String) -> Self{
    return self
  }
  
  func toUrl() -> NSURL{
    return NSURL()
  }
  
}
//
//  ChorizoString.swift
//  Chorizo
//
//  Created by Vandad NP on 11/5/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation

extension String{
  
  public func toArray() -> [String]{
    return [self]
  }
  
  public func and(anotherString: String) -> [String]{
    return [self, anotherString]
  }
  
}
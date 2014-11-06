//
//  ChorizoString.swift
//  Chorizo
//
//  Created by Vandad NP on 11/5/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation
import UIKit

extension String{
  
  func toArray() -> [String]{
    return [self]
  }
  
  func and(anotherString: String) -> [String]{
    return [self, anotherString]
  }
  
}

/* Downloading */

extension String{
  
  /**
  Downloads and returns the data. Good for returning images and stuff like that
  */
  func download(completionBlock: (data: NSData?) -> ()) -> String{
    
    ChorizoAsyncUrlConnection(url: self).onSuccess { (data: NSData) -> () in
      completionBlock(data: data)
      }
      .onFailure { (error: NSError) -> () in
        completionBlock(data: nil)
      }
      .start()
    
    return self
  }
  
  /**
  Downloads self and returns the downloaded data as string.
  Good for downloading a web page
  */
  func download(completionBlock: (string: String?) -> ()) -> String{
    
    self.download { (data: NSData?) -> () in
      if let data = data{
        let string = NSString(data: data, encoding: 0)
        completionBlock(string: string)
      } else {
        completionBlock(string: nil)
      }
    }
    
    return self
  }
  
  func download(completionBlock: (image: UIImage?) -> ()) -> String{
    
    self.download { (data: NSData?) -> () in
      if let data = data{
        let image = UIImage(data: data)
        completionBlock(image: image)
      } else {
        completionBlock(image: nil)
      }
    }
    
    return self
  }
  
}
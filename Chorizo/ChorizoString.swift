//
//  ChorizoString.swift
//  Chorizo
//
//  Created by Vandad NP on 11/5/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation
import UIKit

/* Syntax helpers */
extension String{
  func and(anotherString: String) -> [String]{
    return [self, anotherString]
  }
  func and(int: Any) -> [Any]{
    return [self, int]
  }
}

/* Conversions */
extension String{
  
  func toFloat() -> Float{
    return (self as NSString).floatValue
  }
  
  func toDouble() -> Double{
    return (self as NSString).doubleValue
  }
  
  func toArray() -> [String]{
    return [self]
  }
  
  func toUrl() -> NSURL{
    return NSURL(string: self)!
  }
  
  func toUrlRequest() -> NSURLRequest{
    return NSURLRequest(URL: self.toUrl())
  }
  
  func toUrlRequest() -> NSMutableURLRequest{
    return NSMutableURLRequest(URL: self.toUrl())
  }
  
}

/* Finding */
extension String{
  
  /* Case sensitive */
  func isIn(array: Array<Any>) -> Bool{
    return self.isIn(array, caseSensitive: true)
  }
  
  func isIn(array: Array<Any>, caseSensitive: Bool) -> Bool{
    
    for item in array{
      if let str = item as? String{
        
        if caseSensitive{
          if str == self{
            return true
          }
        } else {
          if str.caseInsensitiveCompare(self) == .OrderedSame{
            return true
          }
        }
        
      }
    }
    
    return false
    
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
  
  func downloadInto(imageView: UIImageView) -> String{
    
    self.download { (image: UIImage?) -> () in
      imageView.image = image
    }
    
    return self
  }
  
}




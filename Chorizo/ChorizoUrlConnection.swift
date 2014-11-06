//
//  ChorizoUrlConnection.swift
//  Chorizo
//
//  Created by Vandad Nahavandipoor on 06/11/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation

class ChorizoAsyncUrlConnection{
    
    typealias ChorizoUrlConnectionSuccessBlock = (data: NSData) -> ()
    typealias ChorizoUrlConnectionFailureBlock = (error: NSError) -> ()
    
    private var request = NSMutableURLRequest()
    var timeout: NSTimeInterval = 20.0
    var successBlock: ChorizoUrlConnectionSuccessBlock?
    var failureBlock: ChorizoUrlConnectionFailureBlock?
    
    var url: NSURL{
        set{
            self.request.URL = newValue
        }
        get{
            return self.request.URL!
        }
    }
    
    init(url: String){
        self.url = NSURL(string: url)!
    }
    
    func setBody(data: NSData) -> Self{
        self.request.HTTPBody = data
        return self
    }
    
    func setHeaders(headers: [NSObject : AnyObject]) -> Self{
        self.request.allHTTPHeaderFields = headers
        return self
    }
    
    func onSuccess(successBlock: ChorizoUrlConnectionSuccessBlock) -> Self{
        self.successBlock = successBlock
        return self
    }
    
    func onFailure(failureBlock: ChorizoUrlConnectionFailureBlock) -> Self{
        self.failureBlock = failureBlock
        return self
    }
    
    func start() -> Self{
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            if error != nil{
                self.failureBlock?(error: error)
            } else {
                self.successBlock?(data: data)
            }
            
        }
        
        return self
    }
    
}
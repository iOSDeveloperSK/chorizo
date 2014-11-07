//
//  ChorizoTasks.swift
//  Chorizo
//
//  Created by Vandad NP on 11/7/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation

/**
One execution class to rule them all (concurrent, serial, async, sync execution). Whatever you wish:

example:

  ChorizoTasks().perform {
    println("1 - \(NSThread.currentThread())")
  }
  .perform {
    println("2 - \(NSThread.currentThread())")
  }
  .perform {
    println("3 - \(NSThread.currentThread())")
  }
  .perform {
    println("4 - \(NSThread.currentThread())")
  }
  .start(executionType: ChorizoTasks.ChorizoTaskExecutionType.Concurrent, threadingType: ChorizoTasks.ChorizoTaskThreadingType.CurrentQueue)

*/

class ChorizoTasks{
  
  typealias ChorizoTask = () -> Void
  
  private lazy var tasks: [ChorizoTask] = {
    return [ChorizoTask]()
    }()
  
  enum ChorizoTaskExecutionType{
    case Serial
    case Concurrent
  }
  
  enum ChorizoTaskThreadingType{
    case BackgroundQueue
    case CurrentQueue
  }
  
  func perform(task: ChorizoTask) -> Self{
    tasks.append(task)
    return self
  }
  
  func start(#executionType: ChorizoTaskExecutionType, threadingType: ChorizoTaskThreadingType) -> Self{
    
    var operationQueue: NSOperationQueue!
    
    switch threadingType{
    case .BackgroundQueue:
      operationQueue = NSOperationQueue()
    default:
      operationQueue = NSOperationQueue.currentQueue()!
    }
    
    operationQueue.suspended = true
    
    switch executionType{
    case .Concurrent:
      operationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount
    case .Serial:
      
      operationQueue.maxConcurrentOperationCount = 1
    }
    
    for task in tasks{
      operationQueue.addOperationWithBlock(task)
    }
    operationQueue.suspended = false
    
    return self
  }
  
}
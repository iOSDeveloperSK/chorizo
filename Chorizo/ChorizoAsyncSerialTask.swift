//
//  ChorizoAsyncSerialTask.swift
//  Chorizo
//
//  Created by Vandad NP on 11/6/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//

import Foundation

/**
Use this class to execute tasks in a serial way, each task on its own thread, executed
one after the other. Usage:

  ChorizoAsyncSerialTask()
    .beginWith {
      println("task 1 \(NSThread.currentThread())")
    }
    .then {
      println("task 2 \(NSThread.currentThread())")
    }
    .then {
      println("task 3 \(NSThread.currentThread())")
    }
    .then {
      println("task 4 \(NSThread.currentThread())")
    }
    .start()

*/
class ChorizoAsyncSerialTask{
  
  typealias ChorizoAsyncSerialTaskBlock = () -> Void
  
  private lazy var tasks: [ChorizoAsyncSerialTaskBlock] = {
    return [ChorizoAsyncSerialTaskBlock]()
  }()
  
  convenience init(initialTask: ChorizoAsyncSerialTaskBlock){
    self.init()
    self.tasks.append(initialTask)
  }
  
  init(){
    
  }
  
  func beginWith(task: ChorizoAsyncSerialTaskBlock) -> Self{
    self.tasks.removeAll(keepCapacity: false)
    return then(task)
  }
  
  func then(task: ChorizoAsyncSerialTaskBlock) -> Self{
    self.tasks.append(task)
    return self
  }
  
  func start() -> Self{
    
    let queue = NSOperationQueue()
    queue.maxConcurrentOperationCount = 1
    queue.suspended = true
    for (count, task) in enumerate(self.tasks){
      let operation = NSBlockOperation(block: task)
      queue.addOperation(operation)
    }
    queue.suspended = false
    
    return self
  }
  
}
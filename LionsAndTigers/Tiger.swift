//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Kenneth Wilcox on 9/15/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
  var age = 0
  var name = ""
  var breed = ""
  var image = UIImage(CGImage:nil)
  
  func chuff() {
    println("\(self.name): Chuff Chuff")
  }
  
  func chuffANumberOfTimes(numberOfTimes:Int) {
    for var chuff = 0; chuff < numberOfTimes; ++chuff {
      self.chuff()
    }
  }
  
  func chuffANumberOfTimes(numberOfTimes: Int, isLoud:Bool) {
    for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
      if isLoud {
        self.chuff()
      }
      else {
        println("\(self.name): purr purr")
      }
    }
  }
}
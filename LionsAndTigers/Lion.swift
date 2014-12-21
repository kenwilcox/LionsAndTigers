//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Kenneth Wilcox on 12/20/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import Foundation
import UIKit

class Lion {
  var age = 0
  var isAlphaMale = false
  var image = UIImage(named:"")
  var name = ""
  var subspecies = ""
  
  func roar () {
    println("Lion: Roar Roar")
  }
  
  func changeToAlphaMale() {
    self.isAlphaMale = true
  }
}
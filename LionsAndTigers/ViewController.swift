//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Kenneth Wilcox on 9/15/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var breedLabel: UILabel!
  
  var myTigers:[Tiger] = []
  var currentIndex = 0
  
  func randomTransition() -> UIViewAnimationOptions {
    var ret = UIViewAnimationOptions.TransitionCrossDissolve
    
    // Several different transitions are rather jaring
    
//    let random = Int(arc4random_uniform(UInt32(7)))
//    
//    switch(random) {
//    case 0: ret = UIViewAnimationOptions.TransitionFlipFromLeft
//    case 1: ret = UIViewAnimationOptions.TransitionFlipFromRight
//    case 2: ret = UIViewAnimationOptions.TransitionCurlUp
//    case 3: ret = UIViewAnimationOptions.TransitionCurlDown
//    case 4: ret = UIViewAnimationOptions.TransitionCrossDissolve
//    case 5: ret = UIViewAnimationOptions.TransitionFlipFromTop
//    case 6: ret = UIViewAnimationOptions.TransitionFlipFromBottom
//    default: println("Default Called \(random)"); ret = UIViewAnimationOptions.TransitionCrossDissolve
//    }
    
    return ret
  }
  
  func displayTiger(tiger:Tiger, withTransition: Bool) {
    if (withTransition) {
      UIView.transitionWithView(self.view, duration: 1, options: randomTransition(), animations: {
        self.imageView.image = tiger.image
        self.nameLabel.text = tiger.name
        self.ageLabel.text = "\(tiger.age)"
        self.breedLabel.text = tiger.breed
        }, completion: { (finished: Bool) -> () in
      })
    }
    else {
      imageView.image = tiger.image
      nameLabel.text = "Name: \(tiger.name)"
      ageLabel.text = "Age: \(tiger.age)"
      breedLabel.text = "Breed: \(tiger.breed)"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var myTiger = Tiger()
    myTiger.name = "Tigger"
    myTiger.breed = "Bengal Tiger"
    myTiger.age = 3
    myTiger.image = UIImage(named:"BengalTiger.jpg")
    
    myTigers.append(myTiger)
    
    displayTiger(myTiger, withTransition: false)
    
    var secondTiger = Tiger()
    secondTiger.name = "Tigress"
    secondTiger.breed = "Indochinese Tiger"
    secondTiger.age = 2
    secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
    
    var thirdTiger = Tiger()
    thirdTiger.name = "Jacob"
    thirdTiger.breed = "Malayan Tiger"
    thirdTiger.age = 4
    thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
    
    var fourthTiger = Tiger()
    fourthTiger.name = "Spar"
    fourthTiger.breed = "Siberian Tiger"
    fourthTiger.age = 5
    fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
    
    myTigers += [secondTiger, thirdTiger, fourthTiger]

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
    var randomIndex: Int
    do {
      randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
    } while currentIndex == randomIndex
    currentIndex = randomIndex
    
    let tiger = myTigers[randomIndex]
    displayTiger(tiger, withTransition: true)
    tiger.chuffANumberOfTimes(1)
  }
}


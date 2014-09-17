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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var myTiger = Tiger()
    myTiger.name = "Tigger"
    myTiger.breed = "Bengal Tiger"
    myTiger.age = 3
    myTiger.image = UIImage(named:"BengalTiger.jpg")
    
    myTigers.append(myTiger)
    
    imageView.image = myTiger.image
    nameLabel.text = "Name: \(myTiger.name)"
    ageLabel.text = "Age: \(myTiger.age)"
    breedLabel.text = "Breed: \(myTiger.breed)"
    
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
    println("\(myTigers)")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
    println("Next Button Pressed")
  }
}


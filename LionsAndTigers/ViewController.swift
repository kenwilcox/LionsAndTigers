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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var myTiger = Tiger()
    myTiger.name = "Tigger"
    myTiger.breed = "Bengal"
    myTiger.age = 3
    myTiger.image = UIImage(named:"BengalTiger.jpg")
    
    println("My Tiger's name is: \(myTiger.name), it's age is \(myTiger.age), its' breed is \(myTiger.breed), and the image is \(myTiger.image)")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
    println("Next Button Pressed")
  }
}


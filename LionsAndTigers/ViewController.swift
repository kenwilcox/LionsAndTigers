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
  @IBOutlet weak var factLabel: UILabel!
  
  var myTigers:[Tiger] = []
  var lions:[Lion] = []
  var lionCubs:[LionCub] = []
  
  var currentAnimal = (species: "Tiger", index: 0)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var myTiger = Tiger()
    myTiger.name = "Tigger"
    myTiger.breed = "Bengal Tiger"
    myTiger.age = 3
    myTiger.image = UIImage(named:"BengalTiger.jpg")
    
    self.myTigers.append(myTiger)
    
    updateView()
    
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
    
    self.myTigers += [secondTiger, thirdTiger, fourthTiger]
    
    let lion = Lion()
    lion.age = 4
    lion.isAlphaMale = false
    lion.image = UIImage(named: "Lion.jpg")
    lion.name = "Mufasa"
    lion.subspecies = "West African"
    
    let lioness = Lion()
    lioness.age = 3
    lioness.isAlphaMale = false
    lioness.image = UIImage(named: "Lioness.jpg")
    lioness.name = "Sarabi"
    lioness.subspecies = "Barbary"
    
    lion.roar()
    lioness.roar()
    
    lion.changeToAlphaMale()
    println(lion.isAlphaMale)
    
    self.lions += [lion, lioness]
    
    let lionCub = LionCub()
    lionCub.age = 1
    lionCub.name = "Simba"
    lionCub.image = UIImage(named: "LionCub1.jpg")
    lionCub.subspecies = "Masai"
    lionCub.isAlphaMale = true
    
    lionCub.roar()
    lionCub.rubLionCubsBelly()
    
    let femaleLionCub = LionCub()
    femaleLionCub.age = 1
    femaleLionCub.name = "Nala"
    femaleLionCub.image = UIImage(named: "LionCub2.jpg")
    femaleLionCub.subspecies = "Transvaal"
    femaleLionCub.isAlphaMale = false
    
    self.lionCubs += [lionCub, femaleLionCub]
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
    updateAnimal()
    updateView()
  }
  
  func updateAnimal() {
    var animal = "Tiger"
    var randomIndex = 0
    
    switch(self.currentAnimal) {
    case ("Tiger", _):
      randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
      animal = "Lion"
    case ("Lion", _):
      randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
      animal = "LionCub"
    default:
      randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
    }
    self.currentAnimal = (animal, randomIndex)
  }
  
  func updateView() {
    UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
      if self.currentAnimal.species == "Tiger" {
        
        let tiger = self.myTigers[self.currentAnimal.index]
        self.imageView.image = tiger.image
        self.nameLabel.text = "Name: \(tiger.name)"
        self.ageLabel.text = "Age: \(tiger.age)"
        self.breedLabel.text = "Breed: \(tiger.breed)"
        self.factLabel.text = tiger.randomFact()
        
      } else if self.currentAnimal.species == "Lion" {
        
        let lion = self.lions[self.currentAnimal.index]
        self.imageView.image = lion.image
        self.breedLabel.text = lion.subspecies
        self.ageLabel.text = "\(lion.age)"
        self.nameLabel.text = lion.name
        self.factLabel.text = lion.randomFact()
      
      }
      
      else if self.currentAnimal.species == "LionCub" {
      
        let lionCub = self.lionCubs[self.currentAnimal.index]
        self.imageView.image = lionCub.image
        self.breedLabel.text = lionCub.subspecies
        self.ageLabel.text = "\(lionCub.age)"
        self.nameLabel.text = lionCub.name
        self.factLabel.text = lionCub.randomFact()
        
      }
      
      self.factLabel.highlighted = false
      
      }, completion: {
        (finished: Bool) -> () in
    })
  }
}


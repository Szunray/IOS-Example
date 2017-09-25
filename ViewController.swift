//
//  ViewController.swift
//  MonsterRoster
//
//  Created by user128720 on 7/28/17.
//  Copyright © 2017 djbcn6. All rights reserved.
//

import UIKit
var Duration = 1.0
class ViewController: UIViewController {
    let Scarab = Monster(Name: "Scarab",6,0)
    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        Background.animationImages=Scarab.animation
        Background.animationDuration=Duration
        Background.startAnimating()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        Background.stopAnimating()
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            Duration = 0.55
            Background.animationImages=Scarab.animation
            Background.animationDuration = Duration
            Background.startAnimating()        case 1:
            Duration = 1.25
        Background.animationDuration = Duration
            Background.startAnimating()
        default:
            break;
        }
     
    }

    func kindredBackground(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"Kindred.jpg")!)
    }
    func golemBackground(){
         self.view.backgroundColor = UIColor(patternImage: UIImage(named:"Golem.jpg")!)    }
}


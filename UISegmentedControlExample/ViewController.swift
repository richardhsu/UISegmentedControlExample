//
//  ViewController.swift
//  UISegmentedControlExample
//
//  Created by Richard Hsu on 1/26/15.
//  Copyright (c) 2015 Richard Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /**
      Loads the view and in our case we override default loadView to provide
      custom SegmentedControl.
    */
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.purpleColor()
        
        println("Main view's loadView() called.")
        
        // Initialize
        let items = ["Purple", "Green", "Blue"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        
        // Set up Frame and SegmentedControl
        let frame = UIScreen.mainScreen().bounds
        customSC.frame = CGRectMake(frame.minX + 10, frame.minY + 50,
                                    frame.width - 20, frame.height*0.1)
        
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = UIColor.blackColor()
        customSC.tintColor = UIColor.whiteColor()
        
        // Add target action method
        customSC.addTarget(self, action: "changeColor:", forControlEvents: .ValueChanged)
        
        // Add this custom Segmented Control to our view
        self.view.addSubview(customSC)
    }
    
    /**
      Handler for when custom Segmented Control changes and will change the
      background color of the view depending on the selection.
     */
    func changeColor(sender: UISegmentedControl) {
        println("Change color handler is called.")
        print("Changing Color to ")
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.greenColor()
            println("Green")
        case 2:
            self.view.backgroundColor = UIColor.blueColor()
            println("Blue")
        default:
            self.view.backgroundColor = UIColor.purpleColor()
            println("Purple")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


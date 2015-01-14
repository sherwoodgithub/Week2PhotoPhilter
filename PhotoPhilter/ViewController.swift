//
//  ViewController.swift
//  PhotoPhilter
//
//  Created by Stephen on 1/13/15.
//  Copyright (c) 2015 Sherwood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
      let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: UIAlertControllerStyle.ActionSheet)
  
  override func loadView() {
    let rootView = UIView(frame: UIScreen.mainScreen().bounds)
    rootView.backgroundColor = UIColor.whiteColor()
    let photoButton = UIButton()
    photoButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    rootView.addSubview(photoButton)
    photoButton.setTitle("Photos", forState: .Normal)
    photoButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
    photoButton.addTarget(self, action: "photoButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    let views = ["photoButton" : photoButton]
    self.setupConstraintsOnRootView(rootView, forViews: views)
    self.view = rootView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let galleryOption = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default) { (action) -> Void in println("gallery pressed")
    }
    self.alertController.addAction(galleryOption)
  }
  
  
  
  
//MARK: Button Selectors
  func photoButtonPressed(sender : UIButton) {
    self.presentViewController(self.alertController, animated: true, completion: nil)
  }
  
//MARK: Autolayout Constraints
  func setupConstraintsOnRootView(rootView: UIView, forViews views : [String : AnyObject] ) {
    let photoButtonConstraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:[photoButton]-20-|", options: nil, metrics: nil, views: views)
    rootView.addConstraints(photoButtonConstraintVertical)
    let photoButton = views["photoButton"] as UIView!
    let photoButtonConstraintHorizontal = NSLayoutConstraint(item: photoButton, attribute: .CenterX, relatedBy: NSLayoutRelation.Equal, toItem: rootView, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
    rootView.addConstraint(photoButtonConstraintHorizontal)
  }


}


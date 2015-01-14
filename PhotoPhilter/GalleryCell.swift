//
//  GalleryCell.swift
//  PhotoPhilter
//
//  Created by Stephen on 1/13/15.
//  Copyright (c) 2015 Sherwood. All rights reserved.
//

import UIKit

class GalleryCell: UICollectionViewCell {
  let imageView = UIImageView()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(self.imageView)
    //make the subview (imageView) the same size as the frame
    
    imageView.frame = bounds
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
 
  
  ///COME ONNNNN
}

//
//  Thumbnail.swift
//  PhotoPhilter
//
//  Created by Stephen on 1/14/15.
//  Copyright (c) 2015 Sherwood. All rights reserved.
//

import UIKit

class Thumbnail {
  var originalImage : UIImage?
  var filteredImage : UIImage?
  var filterName : String
  var imageQueue : NSOperationQueue
  var gpuContext : CIContext
  
  init(filterName : String, operationQue : NSOperationQueue, context : CIContext) {
    self.filterName = filterName
    self.imageQueue = operationQue
    self.gpuContext = context
  }
  
  func generateFilteredImage() {
    let startImage = CIImage(image: self.originalImage)
    let filter = CIFilter(name: self.filterName)
    filter.setDefaults()
    filter.setValue(startImage, forKey: kCIInputImageKey)
    let result = filter.valueForKey(kCIOutputImageKey) as CIImage
    let extent = result.extent()
    let imageRef = self.gpuContext.createCGImage(result, fromRect: extent)
    self.filteredImage = UIImage(CGImage: imageRef)    
  }
}
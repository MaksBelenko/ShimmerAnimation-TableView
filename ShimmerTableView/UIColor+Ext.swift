//
//  UIColor+Ext.swift
//  ShimmerTableView
//
//  Created by Maksim on 25/07/2020.
//  Copyright © 2020 Maksim. All rights reserved.
//

import UIKit



//MARK: - Extension for UIColor hex color representation
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}


//MARK: - Custom App Colours
extension UIColor {
    static let bottomGray = UIColor(red: 232, green: 232, blue: 232)
    static let shimmerGray = UIColor(red: 245, green: 245, blue: 245)
}

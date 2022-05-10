//
//  Colors.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 01/05/22.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let greenDefault = UIColor.rgb(red: 0, green: 205, blue: 131)
    static let greenButtonPL = UIColor.rgb(red: 6, green: 172, blue: 75)
    static let whyCPFPopUp = UIColor.rgb(red: 242, green: 242, blue: 242)
    static let whyCPFPopUpText = UIColor.rgb(red: 127, green: 127, blue: 127)
    static let textFieldPlaceholders = UIColor.rgb(red: 82, green: 95, blue: 102)
}

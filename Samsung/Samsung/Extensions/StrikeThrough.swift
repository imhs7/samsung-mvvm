//
//  StrikeThrough.swift
//  Samsung
//
//  Created by Hemant Sharma on 05/08/21.
//

import Foundation
import UIKit

extension String {
    func strikeThroughText() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
               value: NSUnderlineStyle.single.rawValue,
                   range:NSMakeRange(0,attributeString.length))
        
        return attributeString
    }
}

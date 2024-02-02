//
//  UIFont+Extension.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 01.02.2024.
//

import UIKit

enum FontStyle {
    case body
    case title
    case large
    
    var fontSize: CGFloat {
        switch self {
        case .body:
            return 18.0
        case .title:
            return 22.0
        case .large:
            return 25.0
        }
    }
    
    var fontName: String {
        switch self {
        case .body:
            return "Inter Regular"
        case .title:
            return "Inter Bold"
        case .large:
            return "Inter Medium"
        }
    }
}

extension UIFont {
    static func font(style: FontStyle) -> UIFont {
        UIFont(name: style.fontName, size: style.fontSize) ?? UIFont.systemFont(ofSize: style.fontSize)
    }
    
    static func font(style: FontStyle, size: CGFloat) -> UIFont {
        UIFont(name: style.fontName, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

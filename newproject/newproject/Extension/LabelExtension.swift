//
//  LabelExtension.swift
//  newproject
//
//  Created by New User on 7/9/23.
//

import UIKit

extension UILabel{
    func label(title: String = "", textColor: UIColor = UIColor.black, lines: Int = 0, fontStyle: UIFont? = nil, allignment: NSTextAlignment = .center, backgroundColor: UIColor = .clear) -> UILabel{
        let finalFont = fontStyle?.withSize(UIDevice.current.userInterfaceIdiom == .pad ? fontStyle!.pointSize*1.5 : fontStyle!.pointSize)
        let label = UILabel()
        label.text = title
        label.textColor = textColor == .black ? UIColor.black : textColor
        label.backgroundColor = backgroundColor
        label.font = finalFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = lines
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = allignment
        return label
    }
}

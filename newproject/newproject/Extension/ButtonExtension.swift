//
//  ButtonExtension.swift
//  newproject
//
//  Created by New User on 7/9/23.
//

import UIKit

extension UIButton{
    func button(title: String? = nil, titleColor: UIColor = .white, backgroundImage: UIImage? = nil, backgroundColor: UIColor = .white, titleEdgeInsetsLeft: CGFloat = 0, tag: Int = 0, font: UIFont = UIFont.systemFont(ofSize: 15, weight: .regular), alpha: CGFloat = 1.0) -> UIButton{
        let finalFont = font.withSize(UIDevice.current.userInterfaceIdiom == .pad ? font.pointSize*1.5 : font.pointSize)
        let button = UIButton(type: .system)
        (title != nil ) ?  button.setTitle(title, for: .normal)  : button.setTitle(.none, for: .normal)
        (backgroundImage != nil ) ?  button.setImage(backgroundImage, for: .normal) : button.setImage(.none, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = backgroundColor
        button.titleEdgeInsets.left = titleEdgeInsetsLeft
        button.titleLabel?.font = finalFont
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tag = tag
        button.alpha = alpha
        return button
    }
}

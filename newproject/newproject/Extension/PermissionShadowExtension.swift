//
//  PermissionShadowExtension.swift
//  newproject
//
//  Created by New User on 8/8/23.
//

import Foundation
import UIKit


// MARK: - create PerMissionViewController extension

extension PerMissionViewController {
    func showGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = shadowView.bounds
        gradient.locations = [0.0, 1.0]
        gradient.colors = [UIColor.white.withAlphaComponent(0.15).cgColor, UIColor.white.withAlphaComponent(1).cgColor]
        shadowView.layer.insertSublayer(gradient, at:0)
    }
}

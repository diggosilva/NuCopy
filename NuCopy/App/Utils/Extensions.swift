//
//  Extensions.swift
//  NuCopy
//
//  Created by Diggo Silva on 31/10/25.
//

import UIKit

extension UIColor {
    static let roxinho = #colorLiteral(red: 0.5099446177, green: 0.03479245678, blue: 0.8188650012, alpha: 1)
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

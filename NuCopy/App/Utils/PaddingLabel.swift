//
//  PaddingLabel.swift
//  NuCopy
//
//  Created by Diggo Silva on 01/11/25.
//

import UIKit

final class PaddingLabel: UILabel {
    var contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: contentInset))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + contentInset.left + contentInset.right,
            height: size.height + contentInset.top + contentInset.bottom
        )
    }
}

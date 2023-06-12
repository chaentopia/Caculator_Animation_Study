//
//  otherButton.swift
//  Calculator_Animation_Study
//
//  Created by 정채은 on 2023/06/13.
//


import UIKit

import SnapKit
import SwiftyColor
import Then

class otherButton: UIButton {
    
    override var isHighlighted: Bool {
      didSet { self.animateWhenHighlighted() }
    }
    
    private func animateWhenHighlighted() {
        let animationBackgroundColor = self.isHighlighted ? 0xD9D9D9.color : 0xA5A5A5.color
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.2,
            options: .curveEaseIn,
          animations: {
              self.backgroundColor = animationBackgroundColor
          }
        )
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

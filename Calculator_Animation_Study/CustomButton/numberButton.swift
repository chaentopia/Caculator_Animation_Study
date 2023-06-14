//
//  numberButton.swift
//  Calculator_Animation_Study
//
//  Created by 정채은 on 2023/06/12.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class numberButton: UIButton {
    
    override var isHighlighted: Bool {
      didSet { self.animateWhenHighlighted() }
    }
    
    private func animateWhenHighlighted() {
        let animationBackgroundColor = self.isHighlighted ? 0x737373.color : 0x333333.color
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.2,
            options: .curveEaseIn,
          animations: {
              self.backgroundColor = animationBackgroundColor
          }
        )
    }
    
    init(text: String?) {
        super.init(frame: CGRect.zero)
        
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 39, weight: .regular)
        self.backgroundColor = 0x333333.color
        self.layer.cornerRadius = 39
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

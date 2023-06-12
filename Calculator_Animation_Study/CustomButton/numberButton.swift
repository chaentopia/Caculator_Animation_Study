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
    
    init(text: String?) {
        super.init(frame: CGRect.zero)
        
        self.setTitle(text, for: .normal)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = .systemFont(ofSize: 39, weight: UIFont.Weight(rawValue: 400))
        self.backgroundColor = 0x333333.color
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

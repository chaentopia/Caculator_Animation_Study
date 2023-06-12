//
//  CalculatorViewController.swift
//  Calculator_Animation_Study
//
//  Created by 정채은 on 2023/06/12.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

final class CalculatorViewController: UIViewController {
    
    private lazy var ACButton = UIButton().then {
        $0.setTitle("AC", for: .normal)
        $0.titleLabel?.textColor = .black
        $0.titleLabel?.font = .systemFont(ofSize: 35, weight: UIFont.Weight(rawValue: 500))
        $0.backgroundColor = 0xA5A5A5.color
        $0.layer.cornerRadius = 0.5 * $0.bounds.size.width
        $0.clipsToBounds = true
    }
    
    private lazy var signedButton = UIButton().then {
        $0.setImage(UIImage(named:"signed"), for: .normal)
        $0.backgroundColor = 0xA5A5A5.color
        $0.layer.cornerRadius = 0.5 * $0.bounds.size.width
        $0.clipsToBounds = true
    }
    
    private lazy var persentButton = UIButton().then {
        $0.setTitle("%", for: .normal)
        $0.titleLabel?.textColor = .black
        $0.titleLabel?.font = .systemFont(ofSize: 40, weight: UIFont.Weight(rawValue: 400))
        $0.backgroundColor = 0xA5A5A5.color
        $0.layer.cornerRadius = 0.5 * $0.bounds.size.width
        $0.clipsToBounds = true
    }
    
    private lazy var divideButton = signButton(text: "÷")
    private lazy var multiplyButton = signButton(text: "×")
    private lazy var minusButton = signButton(text: "-")
    private lazy var plusButton = signButton(text: "+")
    private lazy var equalButton = signButton(text: "=")

    private lazy var number1Button = numberButton(text: "1")
    private lazy var number2Button = numberButton(text: "2")
    private lazy var number3Button = numberButton(text: "3")
    private lazy var number4Button = numberButton(text: "4")
    private lazy var number5Button = numberButton(text: "5")
    private lazy var number6Button = numberButton(text: "6")
    private lazy var number7Button = numberButton(text: "7")
    private lazy var number8Button = numberButton(text: "8")
    private lazy var number9Button = numberButton(text: "9")
    private lazy var dotButton = numberButton(text: ".")
    
    private lazy var number0Button = UIButton().then {
        $0.setTitle("0", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.font = .systemFont(ofSize: 39, weight: UIFont.Weight(rawValue: 400))
        $0.backgroundColor = 0x333333.color
        $0.layer.cornerRadius = 50
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
}

extension CalculatorViewController {
    private func setUI() {
        view.backgroundColor = .black
    }
    
    private func setLayout() {
        
    }
}

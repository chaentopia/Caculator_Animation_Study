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
    
    var currentNumber : Double = 0
    var isPlus : Bool = false
    var endPlus : Bool = false
    var isMinus: Bool = false
    var endMinus : Bool = false
    var sum: Double = 0
    
    lazy var resultLabel = UILabel().then {
        $0.text = "0"
        $0.font = .systemFont(ofSize: 95, weight: .light)
        $0.textColor = .white
    }
    
    private lazy var ACButton = otherButton().then {
        $0.setTitle("AC", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        $0.backgroundColor = 0xA5A5A5.color
        $0.layer.cornerRadius = 39
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(ACButtonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var signedButton = otherButton().then {
        $0.setImage(UIImage(named:"signed"), for: .normal)
        $0.backgroundColor = 0xA5A5A5.color
        $0.layer.cornerRadius = 39
        $0.clipsToBounds = true
    }
    
    private lazy var persentButton = otherButton().then {
        $0.setTitle("%", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 40, weight: .regular)
        $0.backgroundColor = 0xA5A5A5.color
        $0.layer.cornerRadius = 39
        $0.clipsToBounds = true
    }
    
    private lazy var divideButton = signButton(text: "÷")
    private lazy var multiplyButton = signButton(text: "×")
    private lazy var minusButton = signButton(text: "-").then {
        $0.addTarget(self, action: #selector(minusButtonTapped(_:)), for: .touchUpInside)
    }
    private lazy var plusButton = signButton(text: "+").then {
        $0.addTarget(self, action: #selector(plusButtonTapped(_:)), for: .touchUpInside)
    }
    private lazy var equalButton = signButton(text: "=").then {
        $0.addTarget(self, action: #selector(equalButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    private func createNumberButton(title: String) -> numberButton {
        let button = numberButton(text: title)
        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    private lazy var number1Button = createNumberButton(title: "1")
    private lazy var number2Button = createNumberButton(title: "2")
    private lazy var number3Button = createNumberButton(title: "3")
    private lazy var number4Button = createNumberButton(title: "4")
    private lazy var number5Button = createNumberButton(title: "5")
    private lazy var number6Button = createNumberButton(title: "6")
    private lazy var number7Button = createNumberButton(title: "7")
    private lazy var number8Button = createNumberButton(title: "8")
    private lazy var number9Button = createNumberButton(title: "9")
    private lazy var dotButton = createNumberButton(title: ".")
    private lazy var number0Button = createNumberButton(title: "0").then {
        $0.setTitle("0", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.font = .systemFont(ofSize: 39, weight: .regular)
        $0.backgroundColor = 0x333333.color
        $0.layer.cornerRadius = 38
        $0.clipsToBounds = true
        $0.titleEdgeInsets = .init(top: 25, left: 26, bottom: 25, right: 120)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
}

extension CalculatorViewController {
    
    //TODO: 더하기 빼기 이퀄 구현
    
    @objc func numberButtonTapped(_ sender: UIButton) {
        let digit = sender.currentTitle!
        var calculateCurrent = resultLabel.text!
        ACButton.setTitle("C", for: .normal)
        
        if isPlus == true {
            sum += currentNumber
            calculateCurrent = ""
            isPlus.toggle()
            endPlus = true
        }
        
        if isMinus == true {
            sum += currentNumber
            calculateCurrent = ""
            isMinus.toggle()
            endMinus = true
        }
        
        if calculateCurrent == "0" {
            if digit == "." {
                resultLabel.text = "0" + digit
            } else {
                resultLabel.text = digit
            }
        } else {
            if digit == "." && calculateCurrent.contains(".") == true {
                resultLabel.text = calculateCurrent
            } else {
                resultLabel.text = calculateCurrent + digit
            }
        }
        currentNumber = Double(resultLabel.text!)!
    }
    
    @objc func ACButtonTapped(_ sender: UIButton) {
        resultLabel.text = "0"
        ACButton.setTitle("AC", for: .normal)
        currentNumber = 0
        sum = 0
    }
    
    @objc func plusButtonTapped(_ sender: UIButton) {
        isPlus = true
    }
    
    @objc func minusButtonTapped(_ sender: UIButton) {
        isMinus = true
    }
    
    @objc func equalButtonTapped(_ sender: UIButton) {
        let calculateCurrent = resultLabel.text!
        
        if endPlus == true {
            sum += Double(calculateCurrent)!
            endPlus.toggle()
        }
        
        if endMinus == true {
            sum -= Double(calculateCurrent)!
            endMinus.toggle()
        }
        
        let isInt = sum.truncatingRemainder(dividingBy: 1.0) == 0 ? true : false
        
        if isInt == true {
            resultLabel.text = String(Int(sum))
        } else {
            resultLabel.text = String(sum)
        }
    }

    private func setUI() {
        view.backgroundColor = .black
    }
    
    private func setLayout() {
        view.addSubviews(
            resultLabel,
            ACButton, signedButton, persentButton,
            divideButton, multiplyButton, minusButton, plusButton, equalButton,
            number1Button, number2Button, number3Button, number4Button, number5Button,
            number6Button, number7Button, number8Button, number9Button, dotButton, number0Button
        )
        
        resultLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(222)
            $0.trailing.equalToSuperview().inset(33)
        }
        
        //첫 번째 줄
        ACButton.snp.makeConstraints{
            $0.top.equalTo(resultLabel.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(17)
            $0.width.height.equalTo(78)
        }
        
        signedButton.snp.makeConstraints{
            $0.top.equalTo(ACButton)
            $0.leading.equalTo(ACButton.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        persentButton.snp.makeConstraints{
            $0.top.equalTo(ACButton)
            $0.leading.equalTo(signedButton.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        divideButton.snp.makeConstraints{
            $0.top.equalTo(ACButton)
            $0.leading.equalTo(persentButton.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        //두 번째 줄
        number7Button.snp.makeConstraints{
            $0.top.equalTo(ACButton.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(17)
            $0.width.height.equalTo(78)
        }
        
        number8Button.snp.makeConstraints{
            $0.top.equalTo(number7Button)
            $0.leading.equalTo(number7Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        number9Button.snp.makeConstraints{
            $0.top.equalTo(number7Button)
            $0.leading.equalTo(number8Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        multiplyButton.snp.makeConstraints{
            $0.top.equalTo(number7Button)
            $0.leading.equalTo(number9Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        //세 번째 줄
        number4Button.snp.makeConstraints{
            $0.top.equalTo(number7Button.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(17)
            $0.width.height.equalTo(78)
        }
        
        number5Button.snp.makeConstraints{
            $0.top.equalTo(number4Button)
            $0.leading.equalTo(number4Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        number6Button.snp.makeConstraints{
            $0.top.equalTo(number4Button)
            $0.leading.equalTo(number5Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        minusButton.snp.makeConstraints{
            $0.top.equalTo(number4Button)
            $0.leading.equalTo(number6Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        //네 번째 줄
        number1Button.snp.makeConstraints{
            $0.top.equalTo(number4Button.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(17)
            $0.width.height.equalTo(78)
        }
        
        number2Button.snp.makeConstraints{
            $0.top.equalTo(number1Button)
            $0.leading.equalTo(number1Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        number3Button.snp.makeConstraints{
            $0.top.equalTo(number1Button)
            $0.leading.equalTo(number2Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        plusButton.snp.makeConstraints{
            $0.top.equalTo(number1Button)
            $0.leading.equalTo(number3Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        //다섯 번째 줄
        number0Button.snp.makeConstraints{
            $0.top.equalTo(number1Button.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(17)
            $0.height.equalTo(78)
            $0.width.equalTo(170)
        }
        
        dotButton.snp.makeConstraints{
            $0.top.equalTo(number0Button)
            $0.leading.equalTo(number0Button.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        equalButton.snp.makeConstraints{
            $0.top.equalTo(number0Button)
            $0.leading.equalTo(dotButton.snp.trailing).offset(15)
            $0.width.height.equalTo(78)
        }
        
        
    }
}

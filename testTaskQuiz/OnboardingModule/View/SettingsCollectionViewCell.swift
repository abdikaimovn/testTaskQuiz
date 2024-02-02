//
//  SettingsCollectionViewCell.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 01.02.2024.
//

import UIKit
import SnapKit

final class SettingsCollectionViewCell: UICollectionViewCell {
    private let nameImageView = UIImageView()
    private let ageImageView = UIImageView()
    private let genderImageView = UIImageView()
    
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let genderLabel = UILabel()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .white
        textField.font = UIFont.font(style: .large)
        textField.isUserInteractionEnabled = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "name is...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        return textField
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .white
        textField.font = UIFont.font(style: .large)
        textField.isUserInteractionEnabled = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "age is...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        return textField
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupLabels() {
        //Settings for labels
        [nameLabel, ageLabel, genderLabel].forEach { label in
            label.textColor = .white
            label.font = UIFont.font(style: .large)
            label.textAlignment = .center
        }
        
        nameLabel.text = "TEXT YOUR NAME"
        ageLabel.text = "YOUR AGE"
        genderLabel.text = "YOUR GENDER"
    }
    
    private func setupImageViews() {
        //Settings for imageViews
        [nameImageView, ageImageView, genderImageView].forEach { view in
            view.contentMode = .scaleToFill
            view.backgroundColor = .clear
            view.isUserInteractionEnabled = true
        }
        
        nameImageView.image = UIImage(named: "nameView")
        ageImageView.image = UIImage(named: "ageView")
        genderImageView.image = UIImage(named: "genderView")
    }
    
    private func generateBottomLine() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    private func generateButton(selected: UIImage?, notSelected: UIImage?, tag: Int) -> UIButton {
        let button = UIButton()
        button.tag = tag
        button.setImage(selected, for: .selected)
        button.setImage(notSelected, for: .normal)
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func genderButtonTapped(_ sender: UIButton) {
        for subview in genderImageView.subviews {
            if let button = subview as? UIButton, button != sender {
                button.isSelected = false
            }
        }
        
        sender.isSelected = !sender.isSelected
    }

    private func setupGenderImageView() {
        let maleButton = generateButton(selected: UIImage(named: "maleSelected"), notSelected: UIImage(named: "male"), tag: 0)
        let femaleButton = generateButton(selected: UIImage(named: "femaleSelected"), notSelected: UIImage(named: "female"), tag: 1)
        let otherButton = generateButton(selected: UIImage(named: "otherSelected"), notSelected: UIImage(named: "other"), tag: 2)
        
        maleButton.isSelected = true
        
        genderImageView.addSubview(genderLabel)
        genderLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        genderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        genderImageView.addSubview(maleButton)
        maleButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.lessThanOrEqualTo(genderLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(50)
        }
        
        genderImageView.addSubview(femaleButton)
        femaleButton.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(20)
            make.leading.greaterThanOrEqualTo(maleButton.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().dividedBy(2.5)
            make.height.equalTo(60)
        }
        
        genderImageView.addSubview(otherButton)
        otherButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(maleButton.snp.bottom).offset(15)
            make.width.equalToSuperview().dividedBy(2.5)
            make.height.equalTo(50)
            make.bottom.lessThanOrEqualToSuperview().inset(20)
        }
    }
    
    private func setupNameImageView() {
        nameImageView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        nameImageView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.centerX.equalToSuperview()
        }
        
        let nameBottomLine = generateBottomLine()
        nameImageView.addSubview(nameBottomLine)
        nameBottomLine.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom)
            make.height.equalTo(1)
            make.width.equalTo(nameTextField.snp.width)
            make.centerX.equalTo(nameTextField.snp.centerX)
        }
    }
    
    private func setupAgeImageView() {
        ageImageView.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        ageImageView.addSubview(ageTextField)
        ageTextField.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.centerX.equalToSuperview()
        }
        
        let ageBottomLine = generateBottomLine()
        ageImageView.addSubview(ageBottomLine)
        ageBottomLine.snp.makeConstraints { make in
            make.top.equalTo(ageTextField.snp.bottom)
            make.height.equalTo(1)
            make.width.equalTo(ageTextField.snp.width)
            make.centerX.equalTo(ageTextField.snp.centerX)
        }
    }

    private func setupViews() {
        setupLabels()
        setupImageViews()
        setupGenderImageView()
        
        addSubview(nameImageView)
        nameImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalToSuperview().dividedBy(3.5)
        }
        setupNameImageView()
        
        addSubview(ageImageView)
        ageImageView.snp.makeConstraints { make in
            make.top.equalTo(nameImageView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalToSuperview().dividedBy(3.5)
        }
        setupAgeImageView()
        
        addSubview(genderImageView)
        genderImageView.setContentHuggingPriority(.required, for: .vertical)
        genderImageView.snp.makeConstraints { make in
            make.top.equalTo(ageImageView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(5)
        }
    }
}

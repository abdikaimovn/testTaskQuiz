//
//  StudyTableViewCell.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 08.02.2024.
//

import UIKit

final class StudyTableViewCell: UITableViewCell {
    private let backImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.isUserInteractionEnabled = true
        image.backgroundColor = .clear
        image.clipsToBounds = true
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(style: .title, size: 18)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let cellNumber: UILabel = {
        let label = UILabel()
        label.font = .font(style: .title, size: 35)
        label.textColor = .white
        return label
    }()
    
    private let backgroundNumber1: UILabel = {
        let label = UILabel()
        label.font = .font(style: .title, size: 120)
        label.textColor = .white
        label.alpha = 0.02
        return label
    }()
    
    private let backgroundNumber2: UILabel = {
        let label = UILabel()
        label.font = .font(style: .title, size: 200)
        label.textColor = .white
        label.alpha = 0.02
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(backImage)
        
        backImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(contentView.snp.width).dividedBy(3)
        }
        
        backImage.addSubview(backgroundNumber1)
        backgroundNumber1.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
        
        backImage.addSubview(backgroundNumber2)
        backgroundNumber2.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
        }
        
        backImage.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
        }
        
        backImage.addSubview(cellNumber)
        cellNumber.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(cellNumber: Int, title: String) {
        if cellNumber % 2 != 0 {
            backImage.image = UIImage(named: "quizTestCell1")
        } else {
            backImage.image = UIImage(named: "quizTestCell2")
        }
        
        backgroundNumber1.text = String(cellNumber)
        backgroundNumber2.text = String(cellNumber)
        titleLabel.text = title
        self.cellNumber.text = String(cellNumber)
    }
}

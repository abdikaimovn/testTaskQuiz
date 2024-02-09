//
//  FinishTableViewCell.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 09.02.2024.
//

import UIKit
import SnapKit

final class FinishCollectionViewCell: UICollectionViewCell {
    private let questionNumber: UILabel = {
        let label = UILabel()
        label.font = .font(style: .body, size: 25)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let bottomLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    func configure(with questionNumber: Int, isRight: Bool) {
        self.questionNumber.text = String(questionNumber)
        bottomLine.backgroundColor = isRight == true ? .green : .red
    }
    
    private func setupView() {
        contentView.backgroundColor = .clear
        
        bottomLine.layer.cornerRadius = 5
        
        contentView.addSubview(questionNumber)
        questionNumber.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        contentView.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { make in
            make.top.equalTo(questionNumber.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(2)
        }
    }
}

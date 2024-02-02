//
//  OnboardingCollectionViewCell.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 01.02.2024.
//

import UIKit
import SnapKit

final class OnboardingCollectionViewCell: UICollectionViewCell {
    //MARK: - UI Elements
    private let titleView = UIView()
    private let descriptionView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .title)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .body)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupViews() {
        [titleView, descriptionView].forEach { view in
            view.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view.layer.cornerRadius = 10
            view.layer.cornerCurve = .continuous
        }
        
        addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview()
        }
        
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        addSubview(descriptionView)
        descriptionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        
        descriptionView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    func configure(with model: OnboardingModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
}

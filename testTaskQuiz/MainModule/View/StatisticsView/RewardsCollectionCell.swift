//
//  RewardsCollectionCell.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 05.02.2024.
//

import UIKit
import SnapKit

final class RewardsCollectionCell: UICollectionViewCell {
    private let rewardImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .body, size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func configure(with model: RewardModel) {
        let image = model.isCompleted == true ? UIImage(named: "goldReward") : UIImage(named: "reward")
        
        rewardImage.image = image
        descriptionLabel.text = model.rewardName
    }

    private func setupView() {
        addSubview(rewardImage)
        rewardImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview()
        }
        
        addSubview(descriptionLabel)
        descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(rewardImage.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}

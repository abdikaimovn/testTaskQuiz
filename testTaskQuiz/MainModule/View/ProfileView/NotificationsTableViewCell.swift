//
//  NotificationsTableViewCell.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 06.02.2024.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profileCell")
        image.contentMode = .scaleToFill
        image.backgroundColor = .clear
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private let serviceName: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .large, size: 20)
        label.textColor = .white
        return label
    }()

    private lazy var switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.onTintColor = UIColor.orangeColor
        switcher.addTarget(self, action: #selector(switched), for: .valueChanged)
        return switcher
    }()
    
    @objc private func switched() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func configure(serviceName: String) {
        self.serviceName.text = serviceName
    }
    
    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(45)
        }
        
        backgroundImage.addSubview(serviceName)
        serviceName.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
        
        backgroundImage.addSubview(switcher)
        switcher.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
    }
}

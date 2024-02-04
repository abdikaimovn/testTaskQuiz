//
//  HomeView.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 04.02.2024.
//

import UIKit
import SnapKit

final class HomeView: UIView {
    private let footballView = UIImageView()
    private let basketballView = UIImageView()
    private let mixedView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        setupImageViews()
        
        addSubview(footballView)
        footballView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(5)
            make.height.equalToSuperview().dividedBy(3.3)
        }
        
        addSubview(basketballView)
        basketballView.snp.makeConstraints { make in
            make.top.equalTo(footballView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(5)
            make.height.equalToSuperview().dividedBy(3.3)
        }
        
        addSubview(mixedView)
        mixedView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(basketballView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(5)
            make.height.equalToSuperview().dividedBy(3.3)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func setupImageViews() {
        [footballView, basketballView, mixedView].forEach { view in
            view.backgroundColor = .clear
            view.contentMode = .scaleAspectFit
            view.isUserInteractionEnabled = true
        }
        
        footballView.image = UIImage(named: "footballImage")
        basketballView.image = UIImage(named: "basketballImage")
        mixedView.image = UIImage(named: "mixedImage")
    }
}

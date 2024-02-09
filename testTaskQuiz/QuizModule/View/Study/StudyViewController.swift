//
//  StudyViewController.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 08.02.2024.
//

import UIKit
import SnapKit

final class StudyViewController: UIViewController {
    private let backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back3")
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let materialView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "genderView")
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(style: .title, size: 25)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let materialLabel: UILabel = {
        let label = UILabel()
        label.font = .font(style: .body, size: 22)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var materialScroll: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "quizBackBtn"), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func configure(topic: StudyTopic) {
        titleLabel.text = topic.title
        materialLabel.text = topic.material
        
        UserDefaultsManager.setCompletedStudyTopic(topic: topic)
        NotificationCenter.default.post(name: Notification.Name("UpdateAfterCompletedStudy"), object: nil)
    }
    
    private func setupView() {
        view.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backImage.addSubview(materialView)
        materialView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalToSuperview().dividedBy(1.4)
        }
        
        materialView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(30)
        }
        
        materialView.addSubview(materialScroll)
        materialScroll.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().dividedBy(1.5)
        }
    
        materialScroll.addSubview(materialLabel)
        materialLabel.setContentHuggingPriority(.required, for: .vertical)
        materialLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.width.equalToSuperview()
        }
        
        backImage.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.size.equalTo(50)
        }
    }

    @objc private func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

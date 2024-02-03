//
//  LaunchViewController.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 03.02.2024.
//

import UIKit
import SnapKit

final class LaunchViewController: UIViewController {
    private let backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "launchBack")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .clear
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private let launchBanner: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "launchBanner")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .clear
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private let launchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "startButton"), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupLaunchButton() {
        launchButton.addTarget(self, action: #selector(launchDidTapped), for: .touchUpInside)
    }
    
    @objc private func launchDidTapped() {
        print("tapped")
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backImage.addSubview(launchBanner)
        launchBanner.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalToSuperview().dividedBy(1.5)
        }
        
        backImage.addSubview(launchButton)
        launchButton.setContentCompressionResistancePriority(.required, for: .vertical)
        launchButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(launchBanner.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().inset(30)
        }
        setupLaunchButton()
    }
}

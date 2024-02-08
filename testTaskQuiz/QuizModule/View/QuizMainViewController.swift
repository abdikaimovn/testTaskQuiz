//
//  QuizViewController.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 07.02.2024.
//

import UIKit
import SnapKit

final class QuizMainViewController: UIViewController {
    private let moduleType: ModuleType
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "back3")
        view.contentMode = .scaleAspectFill
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var players: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "playersView"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(playersDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var clubs: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "clubsView"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(clubsDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var rules: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "rulesView"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(rulesDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "quizBackBtn"), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    init(moduleType: ModuleType){
        self.moduleType = moduleType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func createStudyTestModule(_ moduleType: ModuleType, _ blockType: BlockType) -> UIViewController {
        let presenter = StudyTestPresenter()
        let view = StudyTestViewController(moduleType: moduleType, blockType: blockType, presenter: presenter)
        presenter.view = view
        return view
    }
    
    @objc private func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func playersDidTapped() {
        navigationController?.pushViewController(createStudyTestModule(moduleType, .players), animated: true)
    }
    
    @objc private func clubsDidTapped() {
        navigationController?.pushViewController(createStudyTestModule(moduleType, .clubs), animated: true)
    }
    
    @objc private func rulesDidTapped() {
        navigationController?.pushViewController(createStudyTestModule(moduleType, .rules), animated: true)
    }
    
    private func setupView() {
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backgroundImage.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalToSuperview().dividedBy(1.3)
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.greaterThanOrEqualToSuperview().inset(20)
        }

        stackView.addArrangedSubview(players)
        stackView.addArrangedSubview(clubs)
        stackView.addArrangedSubview(rules)
        
        backgroundImage.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.size.equalTo(50)
        }
    }
}

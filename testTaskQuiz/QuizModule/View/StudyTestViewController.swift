//
//  StudyViewController.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 07.02.2024.
//

import UIKit
import SnapKit

final class StudyTestViewController: UIViewController {
    private let presenter: StudyTestPresenter
    private let moduleType: ModuleType
    private let blockType: BlockType
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "back3")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private lazy var studyView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "studyView")
        view.contentMode = .scaleToFill
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(studyDidTapped)))
        view.backgroundColor = .clear
        return view
    }()
    
    private let studyNumbers: UILabel = {
        let label = UILabel()
        label.font = .font(style: .body, size: 25)
        label.textColor = .white
        return label
    }()
    
    private lazy var testView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "testView")
        view.contentMode = .scaleToFill
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(testDidTapped)))
        view.backgroundColor = .clear
        return view
    }()
    
    private let testNumbers: UILabel = {
        let label = UILabel()
        label.font = .font(style: .body, size: 25)
        label.textColor = .white
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
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
    
    init(moduleType: ModuleType, blockType: BlockType, presenter: StudyTestPresenter) {
        self.moduleType = moduleType
        self.blockType = blockType
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter.viewDidLoaded(with: moduleType, and: blockType)
        setupNotificationCenter()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateView),
            name: Notification.Name("UpdateAfterCompletedStudy"),
            object: nil
        )
    }

    @objc private func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func studyDidTapped() {
        presenter.studyDidTapped(with: moduleType, and: blockType)
    }
    
    @objc private func testDidTapped() {
        presenter.testDidTapped(with: moduleType, and: blockType)
    }
    
    @objc private func updateView() {
        presenter.updateView(with: moduleType, and: blockType)
    }
    
    private func setupView() {
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.bottom.greaterThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.height.equalToSuperview().dividedBy(2)
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
        
        studyView.addSubview(studyNumbers)
        studyNumbers.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview().inset(20)
        }
        
        testView.addSubview(testNumbers)
        testNumbers.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview().inset(20)
        }
        
        stackView.addArrangedSubview(studyView)
        stackView.addArrangedSubview(testView)
        
        backgroundImage.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.size.equalTo(50)
        }
    }
}

extension StudyTestViewController: StudyTestViewProtocol {
    func showListTestBlocks(with model: [TestBlock]) {
        navigationController?.pushViewController(TestListViewController(data: model), animated: true)
    }
    
    func updateTestNumbers(completed: Int, all: Int) {
        testNumbers.text = "\(completed)/\(all)"
    }
    
    func showListStudyTopics(with model: [StudyTopic]) {
        navigationController?.pushViewController(StudyListViewController(data: model), animated: true)
    }
    
    func updateStudyNumbers(completed: Int, all: Int) {
        studyNumbers.text = "\(completed)/\(all)"
    }
}

//
//  TestViewController.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 09.02.2024.
//

import UIKit
import SnapKit

final class TestViewController: UIViewController {
    private let presenter: TestViewPresenter
    private var finishView: FinishView?
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back3")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private let questionView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "nameView")
        view.contentMode = .scaleToFill
        view.backgroundColor = .clear
        return view
    }()
    
    private let questionTitle: UILabel = {
        let label = UILabel()
        label.font = .font(style: .title, size: 20)
        label.text = "QUESTION"
        label.textColor = .white
        return label
    }()
    
    private let question: UILabel = {
        let label = UILabel()
        label.font = .font(style: .body, size: 18)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    private let variantView1 = UIImageView()
    private let variantView2 = UIImageView()
    private let variantView3 = UIImageView()
    private let variantView4 = UIImageView()
    
    private let variantLabel1 = UILabel()
    private let variantLabel2 = UILabel()
    private let variantLabel3 = UILabel()
    private let variantLabel4 = UILabel()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "quizBackBtn"), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let questionNumber: UILabel = {
        let label = UILabel()
        label.font = .font(style: .body, size: 25)
        label.textColor = .white
        return label
    }()
    
    init(presenter: TestViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
        setupImageViews()
        presenter.viewDidLoaded()
    }
    
    @objc private func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupViews() {
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundImage.addSubview(questionView)
        questionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().dividedBy(5)
        }
        
        questionView.addSubview(questionTitle)
        questionTitle.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
        }
        
        questionView.addSubview(question)
        question.snp.makeConstraints { make in
            make.top.equalTo(questionTitle.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.lessThanOrEqualToSuperview().inset(20)
        }
        
        stack.addArrangedSubview(variantView1)
        stack.addArrangedSubview(variantView2)
        stack.addArrangedSubview(variantView3)
        stack.addArrangedSubview(variantView4)
        
        backgroundImage.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(questionView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().dividedBy(2.5)
            make.bottom.lessThanOrEqualToSuperview().inset(20)
        }
        
        backgroundImage.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.size.equalTo(50)
        }
        
        backgroundImage.addSubview(questionNumber)
        questionNumber.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(backButton.snp.centerY)
        }
    }
    
    private func setupImageViews() {
        variantView1.image = UIImage(named: "testAnswer1")
        variantView2.image = UIImage(named: "testAnswer2")
        variantView3.image = UIImage(named: "testAnswer1")
        variantView4.image = UIImage(named: "testAnswer2")
        
        variantView1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(variant1Tapped)))
        variantView2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(variant2Tapped)))
        variantView3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(variant3Tapped)))
        variantView4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(variant4Tapped)))
        
        [variantView1, variantView2, variantView3, variantView4].forEach { view in
            view.contentMode = .scaleToFill
            view.isUserInteractionEnabled = true
            view.clipsToBounds = true
        }
        
        [variantLabel1, variantLabel2, variantLabel3, variantLabel4].forEach { label in
            label.textColor = .white
            label.font = .font(style: .body, size: 18)
            label.numberOfLines = 0
        }
        
        variantView1.addSubview(variantLabel1)
        variantLabel1.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        variantView2.addSubview(variantLabel2)
        variantLabel2.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        variantView3.addSubview(variantLabel3)
        variantLabel3.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        variantView4.addSubview(variantLabel4)
        variantLabel4.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    @objc private func variant1Tapped() {
        presenter.answerTapped(with: variantLabel1.text)
    }
    
    @objc private func variant2Tapped() {
        presenter.answerTapped(with: variantLabel2.text)
    }
    
    @objc private func variant3Tapped() {
        presenter.answerTapped(with: variantLabel3.text)
    }
    
    @objc private func variant4Tapped() {
        presenter.answerTapped(with: variantLabel4.text)
    }
}

extension TestViewController: TestViewProtocol {
    func showFinishView(questionDescriptions: [QuestionDescription]) {
        NotificationCenter.default.post(name: Notification.Name("UpdateAfterCompletedStudy"), object: nil)
        NotificationCenter.default.post(name: Notification.Name("UpdateAfterTestCompletion"), object: nil)
        
        finishView = FinishView(questionsInfo: questionDescriptions)
        finishView?.parentVC = self
        view.addSubview(finishView!)
        finishView!.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setViewValues(questionModel: TestQuestion, completed: String, all: String) {
        variantLabel1.text = questionModel.variant1
        variantLabel2.text = questionModel.variant2
        variantLabel3.text = questionModel.variant3
        variantLabel4.text = questionModel.variant4
        question.text = questionModel.question
        
        questionNumber.text = "\(completed)/\(all)"
    }
}

extension TestViewController: FinishViewDelegate {
    func restartDidTapped() {
        presenter.restartQuizCounter()
        presenter.restartQuiz()
        finishView?.removeFromSuperview()
    }
    
    func nextDidTapped() {
        navigationController?.popViewController(animated: true)
    }
}

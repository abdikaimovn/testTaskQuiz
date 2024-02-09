//
//  FinishView.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 09.02.2024.
//

import UIKit
import SnapKit

protocol FinishViewDelegate: AnyObject {
    func restartDidTapped()
    func nextDidTapped()
}

final class FinishView: UIView {
    weak var parentVC: FinishViewDelegate?
    private let questionInfo: [QuestionDescription]
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back3")
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let finishView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "nameView")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let finishTitle: UILabel = {
        let label = UILabel()
        label.font = .font(style: .title, size: 25)
        label.text = "YOU FINISH QUIZ"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let statisticTitle: UILabel = {
        let title = UILabel()
        title.font = .font(style: .body, size: 25)
        title.textColor = .white
        title.text = "STATISTIC:"
        title.textAlignment = .center
        return title
    }()
    
    private let quizStatisticView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "genderView")
        view.backgroundColor = .clear
        view.contentMode = .scaleToFill
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var restartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "restartBtn"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(restartTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "nextBtn1"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(FinishCollectionViewCell.self, forCellWithReuseIdentifier: "FinishTableViewCell")
        return collectionView
    }()
    
    private let questionsLabel: UILabel = {
        let label = UILabel()
        label.font = .font(style: .body, size: 14)
        label.text = "Questions"
        label.textColor = .white
        return label
    }()
    
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let progress: UIView = {
        let view = UIView()
        view.backgroundColor = .orangeColor
        return view
    }()
    
    private let progressBottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.font = .font(style: .body, size: 14)
        label.textColor = .white
        return label
    }()
    
    init(questionsInfo: [QuestionDescription]) {
        self.questionInfo = questionsInfo
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    @objc private func restartTapped() {
        parentVC?.restartDidTapped()
    }
    
    @objc private func nextTapped() {
        parentVC?.nextDidTapped()
    }
    
    private func calculateSectionProgress() -> Int {
        var rightAnswers = 0
        for i in questionInfo {
            if i.wasRight {
                rightAnswers += 1
            }
        }
        
        let percentage = Double(rightAnswers) / Double(questionInfo.count) * 100
        return Int(percentage)
    }
    
    private func generateStarStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        var stars = [UIImageView]()
        let countOfGold = calculateNumberOfGoldStars()
        
        for i in 1...5 {
            if i <= countOfGold {
                stars.append(generateStar(isGold: true))
            } else {
                stars.append(generateStar(isGold: false))
            }
        }
        
        for star in stars {
            stack.addArrangedSubview(star)
        }
        
        return stack
    }
    
    private func calculateNumberOfGoldStars() -> Int {
        var rightAnswers = 0
        for i in questionInfo {
            if i.wasRight {
                rightAnswers += 1
            }
        }
        
        let percentage = Double(rightAnswers) / Double(questionInfo.count) * 100
        let scale = Int(percentage / 20) // 1/5, 2/5, 3/5
        
        return scale
    }
    
    private func generateStar(isGold: Bool) -> UIImageView {
        let view = UIImageView()
        view.image = isGold == true ? UIImage(named: "goldStar") : UIImage(named: "star")
        view.contentMode = .scaleToFill
        view.backgroundColor = .clear
        return view
    }
    
    private func setupProgressLabel() {
        progressLabel.text = "Section completed: \(calculateSectionProgress())%"
    }
    
    private func setupView() {
        addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundImage.addSubview(finishView)
        finishView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().dividedBy(5)
        }
        
        finishView.addSubview(finishTitle)
        finishTitle.snp.makeConstraints { make in
            make.leading.trailing.greaterThanOrEqualToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }
        
        finishView.addSubview(statisticTitle)
        statisticTitle.snp.makeConstraints { make in
            make.leading.trailing.greaterThanOrEqualToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.top.greaterThanOrEqualTo(finishTitle.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(20)
        }
        
        backgroundImage.addSubview(quizStatisticView)
        quizStatisticView.snp.makeConstraints { make in
            make.top.equalTo(finishView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().dividedBy(2.5)
        }
        
        quizStatisticView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.trailing.greaterThanOrEqualToSuperview().inset(10)
            make.width.equalToSuperview().dividedBy(1.2)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        quizStatisticView.addSubview(questionsLabel)
        questionsLabel.snp.makeConstraints { make in
            make.leading.equalTo(collectionView.snp.leading)
            make.top.equalTo(collectionView.snp.bottom)
        }
        
        quizStatisticView.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.top.equalTo(questionsLabel.snp.bottom).offset(40)
            make.leading.equalTo(collectionView.snp.leading)
            make.trailing.equalTo(collectionView.snp.trailing)
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalTo(10)
        }
        
        progressView.addSubview(progress)
        progress.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Double(calculateSectionProgress()) / 100)
            make.height.equalToSuperview()
        }
        
        progressView.addSubview(progressBottomLine)
        progressBottomLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(progressView.snp.bottom)
            make.height.equalTo(1)
        }
        
        progressView.addSubview(progressLabel)
        progressLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(progressBottomLine.snp.bottom).offset(5)
        }
        
        let starStack = generateStarStack()
        quizStatisticView.addSubview(starStack)
        starStack.snp.makeConstraints { make in
            make.top.equalTo(progressLabel.snp.bottom).offset(40)
            make.leading.equalTo(collectionView.snp.leading)
            make.trailing.equalTo(collectionView.snp.trailing)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(7.5)
        }
        
        backgroundImage.addSubview(restartButton)
        restartButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.width.equalToSuperview().dividedBy(2.5)
            make.height.equalTo(50)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(20)
            make.top.greaterThanOrEqualTo(quizStatisticView.snp.bottom).offset(20)
        }
        
        backgroundImage.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.width.equalToSuperview().dividedBy(2.5)
            make.height.equalTo(50)
            make.leading.greaterThanOrEqualTo(restartButton.snp.trailing).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(20)
            make.top.greaterThanOrEqualTo(quizStatisticView.snp.bottom).offset(20)
        }
        
        setupProgressLabel()
    }
}

extension FinishView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FinishTableViewCell", for: indexPath) as! FinishCollectionViewCell
        cell.configure(with: questionInfo[indexPath.row].questionNumber, isRight: questionInfo[indexPath.row].wasRight)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 6, height: collectionView.bounds.height)
    }
}

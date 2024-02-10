//
//  StatisticsView.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 05.02.2024.
//

import UIKit
import SnapKit
import DGCharts

final class StatisticsView: UIView {
    private var rewardsModel = [RewardModel]()
    private let presenter = StatisticsPresenter()

    private let collectionBackView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.isUserInteractionEnabled = true
        image.backgroundColor = .clear
        image.image = UIImage(named: "nameView")
        return image
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RewardsCollectionCell.self, forCellWithReuseIdentifier: "RewardsCollectionCell")
        return collectionView
    }()
    
    private let graphBackView: UIImageView = {
        let graphView = UIImageView()
        graphView.contentMode = .scaleToFill
        graphView.image = UIImage(named: "graphView")
        graphView.backgroundColor = .clear
        return graphView
    }()
    
    private let statisticTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .title)
        label.text = "STATISTIC"
        label.textColor = .white
        return label
    }()
    
    private let completedQuestionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .body, size: 18)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let pieChart: PieChartView = {
        let pieChart = PieChartView()
        pieChart.drawHoleEnabled = false
        pieChart.usePercentValuesEnabled = true
        return pieChart
    }()
    
    //MARK: - RIGHT ANSWERS
    private let rightAnswersView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let rightAnswersDotImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .greenColor
        return image
    }()
    
    private let rightAnswersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .body, size: 16)
        label.text = "Finished Sections"
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let rightAnswersNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .body, size: 16)
        label.textColor = .white
        return label
    }()
    
    private let rightAnswersPercentage: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .body, size: 16)
        label.textColor = .white
        return label
    }()
    
    //MARK: - WRONG ANSWERS
    private let wrongAnswersView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let wrongAnswersDotImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .redColor
        return image
    }()
    
    private let wrongAnswersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .body, size: 16)
        label.text = "Unfinished Sections"
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let wrongAnswersNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .body, size: 16)
        label.textColor = .white
        return label
    }()
    
    private let wrongAnswersPercentage: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(style: .body, size: 16)
        label.textColor = .white
        return label
    }()
    
    private let graphView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        presenter.view = self
        presenter.viewDidLoaded()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupPieChart(completedSectionValue: Int, incompletedSectionValue: Int) {
        var entries = [ChartDataEntry]()
        
        entries.append(PieChartDataEntry(value: Double(completedSectionValue)))
        entries.append(PieChartDataEntry(value: Double(incompletedSectionValue)))
        
        let set = PieChartDataSet(entries: entries)
        set.colors = .init(arrayLiteral: .greenColor, .redColor)
        
        let data = PieChartData(dataSet: set)
        pieChart.data = data
        pieChart.legend.enabled = false
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(collectionBackView)
        collectionBackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalToSuperview().dividedBy(3)
        }
        
        collectionBackView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        addSubview(graphBackView)
        graphBackView.setContentHuggingPriority(.required, for: .vertical)
        graphBackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(collectionBackView.snp.bottom).offset(20)
            make.bottom.lessThanOrEqualToSuperview().inset(30)
        }
        
        graphBackView.addSubview(statisticTitle)
        statisticTitle.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
        }
        
        graphBackView.addSubview(completedQuestionsLabel)
        completedQuestionsLabel.snp.makeConstraints { make in
            make.top.equalTo(statisticTitle.snp.bottom).offset(20)
            make.leading.equalTo(statisticTitle.snp.leading)
            make.trailing.lessThanOrEqualToSuperview().inset(20)
        }
        
        graphBackView.addSubview(graphView)
        graphView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(completedQuestionsLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().dividedBy(2)
            make.bottom.equalToSuperview().inset(20)
        }
        
        graphView.addSubview(pieChart)
        pieChart.snp.makeConstraints { make in
            make.edges.greaterThanOrEqualToSuperview()
            make.center.equalToSuperview()
        }
        
        graphBackView.addSubview(rightAnswersView)
        rightAnswersView.snp.makeConstraints { make in
            make.top.equalTo(graphView.snp.top)
            make.leading.equalTo(graphView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(20)
        }
        
        rightAnswersView.addSubview(rightAnswersDotImage)
        rightAnswersDotImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview()
            make.size.equalTo(10)
        }
        
        rightAnswersView.addSubview(rightAnswersLabel)
        rightAnswersLabel.snp.makeConstraints { make in
            make.leading.equalTo(rightAnswersDotImage.snp.trailing).offset(10)
            make.top.trailing.equalToSuperview()
        }
        
        rightAnswersView.addSubview(rightAnswersNumber)
        rightAnswersNumber.snp.makeConstraints { make in
            make.leading.equalTo(rightAnswersLabel.snp.leading)
            make.top.equalTo(rightAnswersLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
        }
        
        rightAnswersView.addSubview(rightAnswersPercentage)
        rightAnswersPercentage.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(rightAnswersNumber.snp.trailing).offset(10)
            make.trailing.equalTo(rightAnswersLabel.snp.trailing)
            make.top.equalTo(rightAnswersNumber.snp.top)
            make.bottom.equalToSuperview()
        }
        
        graphBackView.addSubview(wrongAnswersView)
        wrongAnswersView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(rightAnswersView.snp.bottom).offset(10)
            make.leading.equalTo(graphView.snp.trailing).offset(10)
            make.bottom.equalTo(graphView.snp.bottom)
            make.trailing.equalToSuperview().inset(20)
        }
        
        wrongAnswersView.addSubview(wrongAnswersDotImage)
        wrongAnswersDotImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.size.equalTo(10)
        }
        
        wrongAnswersView.addSubview(wrongAnswersNumber)
        wrongAnswersNumber.snp.makeConstraints { make in
            make.leading.equalTo(wrongAnswersDotImage.snp.trailing).offset(10)
            make.top.equalToSuperview()
        }
        
        wrongAnswersView.addSubview(wrongAnswersPercentage)
        wrongAnswersPercentage.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(wrongAnswersNumber.snp.trailing).offset(10)
            make.top.trailing.equalToSuperview()
        }
        
        wrongAnswersView.addSubview(wrongAnswersLabel)
        wrongAnswersLabel.snp.makeConstraints { make in
            make.leading.equalTo(wrongAnswersNumber.snp.leading)
            make.top.equalTo(wrongAnswersNumber.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        presenter.setupPieChart()
    }
}

extension StatisticsView: StatisticsViewProtocol {
    func setPieChartValues(finishedSection: Int, unfinishedSection: Int) {
        let all = finishedSection + unfinishedSection
        
        completedQuestionsLabel.text = "NUMBER OF COMPLETED SECTIONS: \(all)"
        
        rightAnswersNumber.text = String(finishedSection)
        wrongAnswersNumber.text = String(unfinishedSection)
        
        setupPieChart(completedSectionValue: finishedSection, incompletedSectionValue: unfinishedSection)
        
        rightAnswersPercentage.text = "\(Int(Double(finishedSection) / Double(all) * 100))%"
        wrongAnswersPercentage.text = "\(Int(Double(unfinishedSection) / Double(all) * 100))%"
    }
    
    func showRewards(model: [RewardModel]) {
        rewardsModel = model
    }
}

extension StatisticsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rewardsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 3, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RewardsCollectionCell", for: indexPath) as! RewardsCollectionCell
        cell.configure(with: rewardsModel[indexPath.row])
        return cell
    }
}


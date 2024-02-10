//
//  StatisticsPresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 05.02.2024.
//

import UIKit

protocol StatisticsViewProtocol: AnyObject {
    func showRewards(model: [RewardModel])
    func setPieChartValues(finishedSection: Int, unfinishedSection: Int)
}

final class StatisticsPresenter {
    weak var view: StatisticsViewProtocol?
    
    func viewDidLoaded() {
        let rewards = UserDefaultsManager.fetchUserRewards()
        
        var model = [RewardModel]()
        
        for i in rewards {
            model.append(RewardModel(isCompleted: i.isCompleted ?? false, rewardName: i.name))
        }
        
        view?.showRewards(model: model)
    }
    
    func setupPieChart() {
        var completedTestBlocks = [Int]()
        let testBlocks = [
            Test.footballPlayers,
            Test.footbalRules,
            Test.footBallClubs,
            Test.basketballPlayers,
            Test.basketballRules,
            Test.basketballClubs,
            Test.mixedPlayers,
            Test.mixedRules,
            Test.mixedClubs
        ]
        
        let countTestBlocks = [
            Test.footballPlayersTestsCount,
            Test.footballRulesTestsCount,
            Test.footbalClubsTestsCount,
            Test.basketballClubsTestCount,
            Test.basketballRulesTestCount,
            Test.basketballClubsTestCount,
            Test.mixedPlayersTestCount,
            Test.mixedRulesTestCount,
            Test.mixedClubsTestCount
        ] as [Int]
        
        for testBlock in testBlocks {
            completedTestBlocks.append(UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: testBlock))
        }
        
        let completedCount = completedTestBlocks.reduce(0, +)
        let allCount = countTestBlocks.reduce(0, +)
        
        view?.setPieChartValues(finishedSection: completedCount, unfinishedSection: allCount - completedCount)
    }
}

//
//  StatisticsPresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 05.02.2024.
//

import UIKit

protocol StatisticsViewProtocol: AnyObject {
    func showRewards(model: [RewardModel])
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
        
    }
}

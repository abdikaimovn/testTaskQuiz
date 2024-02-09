//
//  UserDefaultsManager.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 04.02.2024.
//

import Foundation

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    static func addUser(userModel user: UserModel) {
        shared.defaults.setValue(user.name, forKey: UserDefaultsKeys.username.rawValue)
        shared.defaults.setValue(user.age, forKey: UserDefaultsKeys.userAge.rawValue)
        shared.defaults.setValue(user.gender.rawValue, forKey: UserDefaultsKeys.userGender.rawValue)
        shared.defaults.setValue(false, forKey: UserDefaultsKeys.isFirstLaunch.rawValue)
    }
    
    static func checkIsFirstLaunch() -> Bool {
        guard let isFirstLaunch = shared.defaults.value(forKey: UserDefaultsKeys.isFirstLaunch.rawValue) as? Bool, !isFirstLaunch else {
            return true
        }
        
        return false
    }
    
    static func updateUser(user: UserModel) {
        shared.defaults.setValue(user.name, forKey: UserDefaultsKeys.username.rawValue)
        shared.defaults.setValue(user.age, forKey: UserDefaultsKeys.userAge.rawValue)
        shared.defaults.setValue(user.gender.rawValue, forKey: UserDefaultsKeys.userGender.rawValue)
        shared.defaults.setValue(false, forKey: UserDefaultsKeys.isFirstLaunch.rawValue)
    }
    
    static func deleteAccount() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
    static func fetchUser() -> UserModel {
        let genderRawValue = shared.defaults.value(forKey: UserDefaultsKeys.userGender.rawValue) as? String
        
        let user = UserModel(
            name: shared.defaults.value(forKey: UserDefaultsKeys.username.rawValue) as? String,
            age: shared.defaults.value(forKey: UserDefaultsKeys.userAge.rawValue) as? Int,
            gender: UserGender(rawValue: genderRawValue ?? "") ?? .other)
        return user
    }
    
    static func fetchUserRewards() -> [Reward] {
        var rewards = [Reward]()
        for reward in ConstantRewards.rewards {
            //если isCompleted = true ставим золотой кубок
            let isCompleted = shared.defaults.value(forKey: reward.key) as? Bool
            rewards.append(Reward(key: reward.key, name: reward.name, isCompleted: isCompleted))
        }
        
        return rewards
    }
    
    static func setCompletedReward(for rewardKey: RewardKey) {
        shared.defaults.set(true, forKey: rewardKey.rawValue)
    }
    
    static func fetchCountOfCompletedStudyTopics(topics: [StudyTopic]) -> Int {
        var count = 0
        
        for topic in topics {
            let isCompleted = shared.defaults.value(forKey: topic.key) as? Bool
            if isCompleted != nil, isCompleted! == true {
                count += 1
            }
        }
        
        return count
    }
    
    static func setCompletedStudyTopic(topic: StudyTopic) {
        shared.defaults.set(true, forKey: topic.key)
    }
    
    static func fetchCountOfCompletedTestBlocks(testBlocks: [TestBlock]) -> Int {
        var count = 0
        
        for testBlock in testBlocks {
            let isCompleted = shared.defaults.value(forKey: testBlock.key) as? Bool
            if isCompleted != nil, isCompleted! == true {
                count += 1
            }
        }
        
        return count
    }
    
    static func fetchCountOfCompletedQuestionsInTest(testBlock: TestBlock) -> Int {
        let completedQuestionsCount = shared.defaults.object(forKey: testBlock.completedQuestionsCountKey) as? Int
        
        if completedQuestionsCount != nil {
            return completedQuestionsCount!
        } else {
            return 0
        }
    }
    
    static func setCompletedCountOfQuestionInTestBlock(testBlock: TestBlock, count: Int) {
        shared.defaults.set(count, forKey: testBlock.completedQuestionsCountKey)
    }
    
    static func setCompletedTestBlock(testBlock: TestBlock) {
        shared.defaults.set(true, forKey: testBlock.key)
    }
}

struct UserModel {
    var name: String?
    var age: Int?
    var gender: UserGender
    
    func isValidData() -> Bool {
        guard name != nil && age != nil else{
            return false
        }
        
        return true
    }
}

enum UserDefaultsKeys: String {
    case isFirstLaunch = "isFirstLaunch"
    case userData = "userData"
    case username = "username"
    case userAge = "userAge"
    case userGender = "userGender"
    case userRewards = "userRewards"
}

struct ConstantRewards {
    static let rewards: [Reward] = [
        Reward(key: RewardKey.footballPlayersQuiz.rawValue, name: "Complete the soccer players quiz", isCompleted: nil),
        Reward(key: RewardKey.footballClubsQuiz.rawValue, name: "Complete the football clubs quiz", isCompleted: nil),
        Reward(key: RewardKey.footballRulesQuiz.rawValue, name: "Complete the soccer rules quiz", isCompleted: nil),
        Reward(key: RewardKey.basketballPlayersQuiz.rawValue, name: "Complete the basketball players quiz", isCompleted: nil),
        Reward(key: RewardKey.basketballClubsQuiz.rawValue, name: "Complete the basketball clubs quiz", isCompleted: nil),
        Reward(key: RewardKey.basketballRulesQuiz.rawValue, name: "Complete the basketball rules quiz", isCompleted: nil)
    ]
}

enum RewardKey: String {
    case footballPlayersQuiz = "football_players_quiz"
    case footballRulesQuiz = "football_rules_quiz"
    case footballClubsQuiz = "football_clubs_quiz"
    case basketballPlayersQuiz = "basketball_players_quiz"
    case basketballRulesQuiz = "basketball_rules_quiz"
    case basketballClubsQuiz = "basketball_clubs_quiz"
}

struct Reward {
    let key: String
    let name: String
    let isCompleted: Bool?
}

enum UserGender: String {
    case male = "male"
    case female = "female"
    case other = "other"
}

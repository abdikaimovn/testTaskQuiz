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
        guard let isFirstLaunch = shared.defaults.value(forKey: UserDefaultsKeys.isFirstLaunch.rawValue) as? Bool, isFirstLaunch else {
            return false
        }
        
        return true
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
        Reward(key: "soccer_players_quiz", name: "Complete the soccer players quiz", isCompleted: nil),
        Reward(key: "football_players_quiz", name: "Complete the football clubs quiz", isCompleted: nil),
        Reward(key: "soccer_rules_quiz", name: "Complete the soccer rules quiz", isCompleted: nil),
        Reward(key: "basketball_players_quiz", name: "Complete the basketball players quiz", isCompleted: nil),
        Reward(key: "basketball_clubs_quiz", name: "Complete the basketball clubs quiz", isCompleted: nil),
        Reward(key: "basketball_rules_quiz", name: "Complete the basketball rules quiz", isCompleted: nil)
    ]
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

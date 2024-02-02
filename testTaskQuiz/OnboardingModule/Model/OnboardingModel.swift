//
//  OnboardingModel.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 01.02.2024.
//

import Foundation

struct OnboardingModel {
    let title: String
    let description: String
}

struct ConstantOnboardingData {
    static let data: [OnboardingModel] = [
        OnboardingModel(title: "LEARN FOOTBALL LIKE A REAL PRO!", description: "Uncover your knowledge of the rules, famous players, become a real expert in this field."),
        OnboardingModel(title: "ALL BASKETBALL INFORMATION IN OUR APP!", description: "Show your strength and become a real basketball quiz champion.")
    ]
    
    static let backgroundImages: [String] = ["back1", "back2", "back3"]
    
    static let buttonBackground: [String] = ["nextBtn1", "nextBtn", "nextBtn"]
}

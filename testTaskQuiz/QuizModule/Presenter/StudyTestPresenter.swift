//
//  StudyTestPresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 07.02.2024.
//

protocol StudyTestViewProtocol: AnyObject {
    func updateStudyNumbers(completed: Int, all: Int)
    func showListStudyTopics(with model: [StudyTopic])
    func updateTestNumbers(completed: Int, all: Int)
    func showListTestBlocks(with model: [TestBlock])
}

final class StudyTestPresenter {
    weak var view: StudyTestViewProtocol?
    
    func viewDidLoaded(with moduleType: ModuleType, and blockType: BlockType) {
        switch moduleType {
        case .football:
            switch blockType {
                
            case .players:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.footballPlayers
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.footballPlayers)
                if testCompletedCount == Test.footballPlayersTestsCount {
                    UserDefaultsManager.setCompletedReward(for: .footballPlayersQuiz)
                }
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.footballPlayersTopicsCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.footballPlayersTestsCount)
                
            case .clubs:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.footballClubs
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.footBallClubs)
                if testCompletedCount == Test.footbalClubsTestsCount {
                    UserDefaultsManager.setCompletedReward(for: .footballClubsQuiz)
                }
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.footballClubsTopicsCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.footbalClubsTestsCount)
                
            case .rules:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.footballRules
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.footbalRules)
                if testCompletedCount == Test.footballRulesTestsCount {
                    UserDefaultsManager.setCompletedReward(for: .footballRulesQuiz)
                }
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.footballRulesTopicsCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.footballRulesTestsCount)
            }
            
        case .basketball:
            switch blockType {
                
            case .players:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.basketballPlayers
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.basketballPlayers)
                if testCompletedCount == Test.basketballPlayersTestCount {
                    UserDefaultsManager.setCompletedReward(for: .basketballPlayersQuiz)
                }
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.basketballPlayersStudyCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.basketballPlayersTestCount)
                
            case .clubs:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.basketballClubs
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.basketballClubs)
                if testCompletedCount == Test.basketballClubsTestCount {
                    UserDefaultsManager.setCompletedReward(for: .basketballClubsQuiz)
                }
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.basketballClubsStudyCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.basketballClubsTestCount)
                
            case .rules:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.basketballRules
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.basketballRules)
                if testCompletedCount == Test.basketballClubsTestCount {
                    UserDefaultsManager.setCompletedReward(for: .basketballRulesQuiz)
                }
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.basketballRulesStudyCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.basketballRulesTestCount)
            }
            
        case .mixed:
            switch blockType {
            case .players:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.mixedPlayers
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.mixedPlayers)
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.mixedPlayersStudyCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.mixedPlayersTestCount)
                
            case .clubs:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.mixedClubs
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.mixedClubs)
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.mixedClubsStudyCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.mixedClubsTestCount)
                
            case .rules:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.mixedRules
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.mixedRules)
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.mixedRulesStudyCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.mixedRulesTestCount)
            }
        }
    }
    
    func updateView(with moduleType: ModuleType, and blockType: BlockType) {
        viewDidLoaded(with: moduleType, and: blockType)
    }
    
    func studyDidTapped(with moduleType: ModuleType, and blockType: BlockType) {
        switch moduleType {
        case .football:
            switch blockType {
            case .players:
                view?.showListStudyTopics(
                    with: Study.footballPlayers
                )
            case .clubs:
                view?.showListStudyTopics(
                    with: Study.footballClubs
                )
            case .rules:
                view?.showListStudyTopics(
                    with: Study.footballRules
                )
            }
        case .basketball:
            switch blockType {
            case .players:
                view?.showListStudyTopics(
                    with: Study.basketballPlayers
                )
            case .clubs:
                view?.showListStudyTopics(
                    with: Study.basketballClubs
                )
            case .rules:
                view?.showListStudyTopics(
                    with: Study.basketballRules
                )
            }
        case .mixed:
            switch blockType {
            case .players:
                view?.showListStudyTopics(
                    with: Study.mixedPlayers
                )
            case .clubs:
                view?.showListStudyTopics(
                    with: Study.mixedClubs
                )
            case .rules:
                view?.showListStudyTopics(
                    with: Study.mixedRules
                )
            }
        }
    }
    
    func testDidTapped(with moduleType: ModuleType, and blockType: BlockType) {
        switch moduleType {
        case .football:
            switch blockType {
            case .players:
                view?.showListTestBlocks(
                    with: Test.footballPlayers
                )
            case .clubs:
                view?.showListTestBlocks(
                    with: Test.footBallClubs
                )
            case .rules:
                view?.showListTestBlocks(
                    with: Test.footbalRules
                )
            }
        case .basketball:
            switch blockType {
            case .players:
                view?.showListTestBlocks(
                    with: Test.basketballPlayers
                )
            case .clubs:
                view?.showListTestBlocks(
                    with: Test.basketballClubs
                )
            case .rules:
                view?.showListTestBlocks(
                    with: Test.basketballRules
                )
            }
        case .mixed:
            switch blockType {
            case .players:
                view?.showListTestBlocks(
                    with: Test.mixedPlayers
                )
            case .clubs:
                view?.showListTestBlocks(
                    with: Test.mixedClubs
                )
            case .rules:
                view?.showListTestBlocks(
                    with: Test.mixedRules
                )
            }
        }
    }
    
}

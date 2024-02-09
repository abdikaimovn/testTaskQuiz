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
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.footballPlayersTopicsCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.footballPlayersTestsCount)
            case .clubs:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.footballClubs
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.footBallClubs)
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.footballClubsTopicsCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.footbalClubsTestsCount)
            case .rules:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.footballRules
                )
                let testCompletedCount = UserDefaultsManager.fetchCountOfCompletedTestBlocks(testBlocks: Test.footbalRules)
                
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.footballRulesTopicsCount)
                view?.updateTestNumbers(completed: testCompletedCount, all: Test.footballRulesTestsCount)
            }
        case .basketball:
            switch blockType {
            case .players:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.basketballPlayers
                )
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.basketballPlayersStudyCount)
            case .clubs:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.basketballClubs
                )
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.basketballClubsStudyCount)
            case .rules:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.basketballRules
                )
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.basketballRulesStudyCount)
            }
        case .mixed:
            switch blockType {
            case .players:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.mixedPlayers
                )
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.mixedPlayersStudyCount)
            case .clubs:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.mixedClubs
                )
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.mixedClubsStudyCount)
            case .rules:
                let studyCompletedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.mixedRules
                )
                view?.updateStudyNumbers(completed: studyCompletedCount, all: Study.mixedRulesStudyCount)
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
            return
        case .mixed:
            return
        }
    }
    
}

//
//  StudyTestPresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 07.02.2024.
//

protocol StudyTestViewProtocol: AnyObject {
    func updateStudyNumbers(completed: Int, all: Int)
    func showListStudyTopics(with model: [StudyTopic])
}

final class StudyTestPresenter {
    weak var view: StudyTestViewProtocol?
    
    func viewDidLoaded(with moduleType: ModuleType, and blockType: BlockType) {
        switch moduleType {
        case .football:
            switch blockType {
            case .players:
                let completedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.footballPlayers
                )
                view?.updateStudyNumbers(completed: completedCount, all: Study.footballPlayersTopicsCount)
            case .clubs:
                let completedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.footballClubs
                )
                view?.updateStudyNumbers(completed: completedCount, all: Study.footballClubsTopicsCount)
            case .rules:
                let completedCount = UserDefaultsManager.fetchCountOfCompletedStudyTopics(
                    topics: Study.footballRules
                )
                view?.updateStudyNumbers(completed: completedCount, all: Study.footballRulesTopicsCount)
            }
        case .basketball:
            return
        case .mixed:
            return
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
            return
        case .mixed:
            return
        }
    }
    
    
}

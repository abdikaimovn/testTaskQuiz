//
//  TestPresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 09.02.2024.
//

import Foundation

protocol TestViewProtocol: AnyObject {
    func setViewValues(questionModel: TestQuestion, completed: String, all: String)
    func showFinishView(questionDescriptions: [QuestionDescription])
}

final class TestViewPresenter {
    weak var view: TestViewProtocol?
    private var questions: TestBlock
    private var counter = 0
    private var rightAnswers = 0
    private var questionsInfo = [QuestionDescription]()
    
    
    init(questions: TestBlock) {
        self.questions = questions
    }
    
    func viewDidLoaded() {
        view?.setViewValues(questionModel: questions.test[counter], completed: String(counter), all: String(questions.test.count))
    }
    
    func answerTapped(with answer: String?) {
        if questions.test[counter].rightAnswer == answer {
            questionsInfo.append(QuestionDescription(questionNumber: counter + 1, wasRight: true))
            rightAnswers += 1
            UserDefaultsManager.setCompletedCountOfQuestionInTestBlock(testBlock: questions, count: rightAnswers)
        } else {
            questionsInfo.append(QuestionDescription(questionNumber: counter + 1, wasRight: false))
        }
        
        counter += 1
        if counter < questions.test.count {
            view?.setViewValues(questionModel: questions.test[counter], completed: String(counter), all: String(questions.test.count))
        } else {
            UserDefaultsManager.setCompletedTestBlock(testBlock: questions)
            view?.showFinishView(questionDescriptions: questionsInfo)
        }
    }
    
    func restartQuizCounter() {
        counter = 0
        questionsInfo.removeAll()
    }
    
    func restartQuiz() {
        viewDidLoaded()
    }
}

struct QuestionDescription {
    let questionNumber: Int
    let wasRight: Bool
}

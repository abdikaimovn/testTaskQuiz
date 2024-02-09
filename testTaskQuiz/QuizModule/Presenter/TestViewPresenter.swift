//
//  TestPresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 09.02.2024.
//

import Foundation

protocol TestViewProtocol: AnyObject {
    func setViewValues(questionModel: TestQuestion)
    func thatsAll()
}

final class TestViewPresenter {
    weak var view: TestViewProtocol?
    private var questions: TestBlock
    private var counter = 0
    private var rightAnswers = 0
    
    init(questions: TestBlock) {
        self.questions = questions
    }
    
    func viewDidLoaded() {
        view?.setViewValues(questionModel: questions.test[counter])
    }
    
    func answerTapped(with answer: String?) {
        if questions.test[counter].rightAnswer == answer {
            rightAnswers += 1
            UserDefaultsManager.setCompletedCountOfQuestionInTestBlock(testBlock: questions, count: rightAnswers)
        }
    
        if counter < questions.test.count - 1 {
            counter += 1
            view?.setViewValues(questionModel: questions.test[counter])
        } else {
            UserDefaultsManager.setCompletedTestBlock(testBlock: questions)
            view?.thatsAll()
        }
    }
}

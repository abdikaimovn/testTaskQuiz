//
//  OnboardingPresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 01.02.2024.
//

protocol OnboardingViewProtocol: AnyObject {
    func moveToNextPage()
    func updateView()
}

final class OnboardingPresenter {
    weak var view: OnboardingViewProtocol?
    
    func nextButtonDidTapped() {
        view?.moveToNextPage()
        view?.updateView()
    }
}

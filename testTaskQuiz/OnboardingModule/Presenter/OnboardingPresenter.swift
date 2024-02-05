//
//  OnboardingPresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 01.02.2024.
//

import Foundation

protocol OnboardingViewProtocol: AnyObject {
    func moveToNextPage()
    func updateView()
    func checkIfUserCompleted()
    func showLaunchScreen()
}

final class OnboardingPresenter {
    private let defaults = UserDefaults.standard
    
    weak var view: OnboardingViewProtocol?
    
    func nextButtonDidTapped(currentPage: Int) {
        switch currentPage {
        case 0, 1:
            view?.moveToNextPage()
            break
        case 2:
            view?.checkIfUserCompleted()
            break
        default:
            return
        }
        
        view?.updateView()
    }
    
    func handleUserInfo(userInfo: UserModel?) {
        guard let userData = userInfo?.isValidData(), userData else{
            return
        }
        
        //Force unwrap так как сохранение идет после проверки на Валидность данных
        UserDefaultsManager.addUser(userModel: userInfo!)
        
        view?.showLaunchScreen()
    }
}

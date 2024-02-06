//
//  ProfilePresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 06.02.2024.
//

protocol ProfileViewProtocol: AnyObject {
    func showUserInfo(userInfo: UserModel)
    func showInitialView()
}

final class ProfilePresenter {
    weak var view: ProfileViewProtocol?
    
    func viewDidLoaded() {
        let userInfo = UserDefaultsManager.fetchUser()
        
        view?.showUserInfo(userInfo: userInfo)
    }
    
    func deleteButtonTapped() {
        UserDefaultsManager.deleteAccount()
        view?.showInitialView()
    }
    
    func updateUserInfo() {
       viewDidLoaded()
    }
}

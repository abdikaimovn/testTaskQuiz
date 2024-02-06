//
//  UpdateViewPresenter.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 06.02.2024.
//

protocol UpdateViewProtocol: AnyObject {
    func removeFromSuperview()
}

final class UpdateViewPresenter {
    weak var view: UpdateViewProtocol?
    
    func applyDidTapped(userInfo: UserModel?) {
        guard let userData = userInfo?.isValidData(), userData else{
            return
        }
        
        UserDefaultsManager.updateUser(user: userInfo!)
        
        view?.removeFromSuperview()
    }
}

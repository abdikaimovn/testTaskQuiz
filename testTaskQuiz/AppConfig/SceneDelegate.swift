//
//  SceneDelegate.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 29.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        setupWindow(scene: scene, rootViewController: showInitialViewController())
    }
    
    private func setupWindow(scene: UIScene, rootViewController: UIViewController) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    private func showInitialViewController() -> UIViewController {
        if checkIsFirstLaunch() {
            return createOnboardingModule()
        } else {
            return createMainModule()
        }
    }
    
    private func checkIsFirstLaunch() -> Bool {
        let defaults = UserDefaults.standard
        
        guard let isFirstLaunch = defaults.value(forKey: UserDefaultsKeys.isFirstLaunch) as? Bool, isFirstLaunch else {
            defaults.setValue(false, forKey: UserDefaultsKeys.isFirstLaunch)
            return false
        }
        
        return true
    }
    
    private func createMainModule() -> UIViewController {
        let view = MainViewController()
        return view
    }
    
    private func createOnboardingModule() -> UIViewController {
        let presenter = OnboardingPresenter()
        let view = OnboardingViewController(presenter: presenter)
        presenter.view = view
        
        return view
    }

}


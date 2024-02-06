//
//  SceneDelegate.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 29.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    internal var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        setupWindow(scene: scene)
    }
    
    private func setupWindow(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        showInitialViewController()
    }
    
    func showInitialViewController() {
        if checkIsFirstLaunch() {
            self.window?.rootViewController = UINavigationController(rootViewController: createOnboardingModule())
        } else {
            self.window?.rootViewController = UINavigationController(rootViewController: createMainModule())
        }
    }
    
    private func checkIsFirstLaunch() -> Bool {
        UserDefaultsManager.checkIsFirstLaunch()
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


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
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()
    }
    
    func showInitialViewController() -> UIViewController {
        if checkIsFirstLaunch() {
            return createOnboardingModule()
        } else {
            return createMainModule()
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


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
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: createOnboardingModule())
        window?.makeKeyAndVisible()
    }
    
    private func createOnboardingModule() -> UIViewController {
        let presenter = OnboardingPresenter()
        let view = OnboardingViewController(presenter: presenter)
        presenter.view = view
        
        return view
    }

}


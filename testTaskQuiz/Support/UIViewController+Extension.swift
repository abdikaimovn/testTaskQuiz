//
//  UIViewController+Extension.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 06.02.2024.
//

import UIKit

extension UIViewController {
    var sceneDelegate: SceneDelegate? {
        view.window?.windowScene?.delegate as? SceneDelegate
    }
}

//
//  SceneDelegate.swift
//  MeMe
//
//  Created by 권정근 on 12/19/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with: scene)
        let vc = HomeViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = nav
    }
    
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}


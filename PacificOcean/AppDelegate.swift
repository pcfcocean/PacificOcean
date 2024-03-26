//
//  AppDelegate.swift
//  PacificOcean
//
//  Created by Vlad Lesnichiy on 24.12.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - UIApplicationDelegate properties
    var window: UIWindow?

    // MARK: - UIApplicationDelegate methods
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let viewController = CleanSwiftAssembly.build(config: CleanSwift.Config(initialData: nil))
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return true
    }
}


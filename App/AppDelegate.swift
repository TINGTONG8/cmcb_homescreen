//
//  AppDelegate.swift
//  homescreen
//
//  Created by Kheangsreng.srun on 19/5/26.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {

        let rootView = AppTabView()
        let hostingController = UIHostingController(rootView: rootView)

        let navigationController = UINavigationController(rootViewController: hostingController)
        navigationController.setNavigationBarHidden(true, animated: false)

        Navigator.shared.navigation = navigationController

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

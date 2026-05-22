//
//  Navigator.swift
//  homescreen
//
//  Created by Kheangsreng.srun on 19/5/26.
//

import UIKit
import SwiftUI

class Navigator: NSObject {
    static var shared = Navigator()

    var navigation: UINavigationController? {
        didSet {
            navigation?.interactivePopGestureRecognizer?.delegate = self
            navigation?.interactivePopGestureRecognizer?.isEnabled = true
        }
    }

    func push(to view: some View, animated: Bool = true) {
        let hostingController = UIHostingController(rootView: view)
        navigation?.pushViewController(hostingController, animated: animated)
        navigation?.interactivePopGestureRecognizer?.delegate = self
        navigation?.interactivePopGestureRecognizer?.isEnabled = true
    }

    func pop(animated: Bool = true) {
        navigation?.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool = true) {
        navigation?.popToRootViewController(animated: animated)
    }
}

// MARK: - UIGestureRecognizerDelegate
extension Navigator: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return (navigation?.viewControllers.count ?? 0) > 1
    }
}

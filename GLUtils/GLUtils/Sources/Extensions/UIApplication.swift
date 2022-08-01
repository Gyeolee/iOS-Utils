//
//  UIApplication.swift
//  GLUtils
//
//  Created by Hangyeol on 2022/08/01.
//

import UIKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
        guard let keyWindow = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows
            .filter({ $0.isKeyWindow })
            .first else {
            return nil
        }
        
        return keyWindow
    }
    
    func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        
        if let tabBarController = viewController as? UITabBarController {
            if let selectedViewController = tabBarController.selectedViewController {
                return topViewController(selectedViewController)
            }
        }
        
        if let presentedViewController = viewController?.presentedViewController {
            return topViewController(presentedViewController)
        }
        
        return viewController
    }
}

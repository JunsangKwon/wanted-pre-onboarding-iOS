//
//  BaseNavigationController.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/03.
//

import UIKit

final class BaseNavigationController: UINavigationController {
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarAppearance()
    }
    
    private var backButtonImage: UIImage? {
        return UIImage(systemName: "arrow.backward")?.withAlignmentRectInsets(UIEdgeInsets(top: 0.0, left: -12.0, bottom: 5.0, right: 0.0))
    }
    
    private func setNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        appearance.setBackIndicatorImage(backButtonImage,
                                         transitionMaskImage: backButtonImage)
        appearance.shadowColor = nil
        
        navigationBar.tintColor = UIColor.black
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance
    }
}


extension BaseNavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        setNavigationBarItem()
    }

    private func setNavigationBarItem() {
        if viewControllers.count == 1 {
            navigationBar.topItem?.setLeftBarButton(UIBarButtonItem(customView: titleLabel),
                                                    animated: true)
        } else {
            navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
        }
    }
}

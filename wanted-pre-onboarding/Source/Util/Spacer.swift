//
//  Spacer.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/03.
//

import UIKit.UIView

final class Spacer: UIView {
    init (_ width: CGFloat) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

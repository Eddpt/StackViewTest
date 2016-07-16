//
//  HeaderViewController.swift
//  StackViewTest
//
//  Created by Eddpt on 15/07/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {

    @IBOutlet weak private(set) var headerContainerView: UIView!
    @IBOutlet weak private(set) var stackView: UIStackView!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHeaderView()
        populateStackView()
    }

    // MARK: Private

    private func setupHeaderView() {
        let headerView = HeaderView.loadFromNib()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.viewController = self
        headerContainerView.addSubview(headerView)
        let leadingConstraint = NSLayoutConstraint(item: headerView, attribute: .left, relatedBy: .equal, toItem: headerContainerView, attribute: .left, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: headerView, attribute: .right, relatedBy: .equal, toItem: headerContainerView, attribute: .right, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: headerView, attribute: .top, relatedBy: .equal, toItem: headerContainerView, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: headerView, attribute: .bottom, relatedBy: .equal, toItem: headerContainerView, attribute: .bottom, multiplier: 1, constant: 0)

        headerContainerView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }

    private func populateStackView() {
        let numberOfChildren = Int(arc4random_uniform(20) + 1)

        for index in 0..<numberOfChildren {
            let label = DynamicHeightView.loadFromNib()
            label.backgroundColor = (index % 2) == 0 ? .red() : .green()
            label.updateView(withText: String.randomLoremIpsumString())
            stackView.addArrangedSubview(label)
        }
    }
}

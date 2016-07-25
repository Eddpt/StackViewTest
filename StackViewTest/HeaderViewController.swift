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

        headerView.leftAnchor.constraint(equalTo: headerContainerView.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: headerContainerView.rightAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: headerContainerView.topAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor).isActive = true
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

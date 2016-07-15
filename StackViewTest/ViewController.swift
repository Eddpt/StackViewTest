//
//  ViewController.swift
//  StackViewTest
//
//  Created by Eddpt on 15/07/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private(set) var stackView: UIStackView!
    @IBOutlet weak private(set) var noContentLabel: UILabel!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        populateStackView()
    }

    // MARK: Actions

    @IBAction func didPressClear(_ sender: AnyObject) {
        clearStackView()
    }

    @IBAction func didPressReload(_ sender: AnyObject) {
        clearStackView()
        populateStackView()
    }

    // MARK: Private

    private func clearStackView() {
        stackView.arrangedSubviews.forEach{ (view: UIView) -> () in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        noContentLabel.isHidden = false
    }

    private func populateStackView() {
        let numberOfChildren = Int(arc4random_uniform(20) + 1)

        for index in 0..<numberOfChildren {
            let label = DynamicHeightView.loadFromNib()
            label.backgroundColor = (index % 2) == 0 ? .red() : .green()
            label.updateView(withText: String.randomLoremIpsumString())
            stackView.addArrangedSubview(label)
        }

        noContentLabel.isHidden = true
    }
}

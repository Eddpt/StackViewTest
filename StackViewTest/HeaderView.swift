//
//  HeaderView.swift
//  StackViewTest
//
//  Created by Eddpt on 16/07/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    weak var viewController: UIViewController?

    // MARK: Actions

    @IBAction func didTapButton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Just a test", message: "Nothing to see here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
}

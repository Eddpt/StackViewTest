//
//  DynamicHeightView.swift
//  StackViewTest
//
//  Created by Edgar Antunes on 15/07/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class DynamicHeightView: UIView {

    @IBOutlet weak private(set) var dynamicHeightLabel: CustomLabel!

    func updateView(withText text: String) {
        dynamicHeightLabel.text = text

        dynamicHeightLabel.layoutIfNeeded()
    }
}

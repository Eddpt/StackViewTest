//
//  CustomLabel.swift
//  StackViewTest
//
//  Created by Eddpt on 15/07/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        preferredMaxLayoutWidth = bounds.size.width
        super.layoutSubviews()
    }
}

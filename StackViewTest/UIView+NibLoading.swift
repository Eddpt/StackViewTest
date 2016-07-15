//
//  UIView+NibLoading.swift
//  StackViewTest
//
//  Created by Eddpt on 15/07/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    public static func loadFromNib(nibNameOrNil: String? = nil) -> Self {
        return loadFromNib(nibNameOrNil: nibNameOrNil, type: self)
    }

    public static func loadFromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let name = nibNameOrNil ?? self.nibName

        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        return nibViews.first as! T
    }

    private static var nibName: String {
        return "\(self)".components(separatedBy: ".").first ?? ""
    }
}

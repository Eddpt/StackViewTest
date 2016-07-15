//
//  String+Additions.swift
//  StackViewTest
//
//  Created by Eddpt on 15/07/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import Foundation

extension String {
    static func randomLoremIpsumString() -> String {
        let loremIpsum = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        var finalString = loremIpsum
        let randomNumber = arc4random_uniform(10)

        for _ in 0..<randomNumber {
            finalString.append("\n")
            finalString.append(loremIpsum)
        }

        return finalString
    }
}

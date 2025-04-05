//
//  ImageLiterals.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/5/25.
//

import UIKit

enum ImageLiterals {

    // MARK: WellComeViewController

    static var rabbit: UIImage { .load(name: "rabbit")}

}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }

    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}


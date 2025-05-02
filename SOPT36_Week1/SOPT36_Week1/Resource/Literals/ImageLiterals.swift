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

    static var product1: UIImage { .load(name: "product1")}
    static var product2: UIImage { .load(name: "product2")}
    static var product3: UIImage { .load(name: "product3")}
    static var product4: UIImage { .load(name: "product4")}
    static var product5: UIImage { .load(name: "product5")}

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


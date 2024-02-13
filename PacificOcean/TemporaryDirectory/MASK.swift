//
//  MASK.swift
//  PacificOcean
//
//  Created by Vlad Lesnichiy on 5.02.24.
//

import Foundation


struct MASK {
    private enum Constants {
        static let maskedData: (String) -> (String) = { "•••\($0.suffix(2))" }
    }

    init() {
        print(Constants.maskedData("12345"))
    }
}

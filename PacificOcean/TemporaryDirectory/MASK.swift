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
        static let formattedPhoneNumber: (String) -> (String) = { data in
            var formattedPhoneNumber: String = ""
            data.enumerated().forEach { (index, character) in
                guard
                    index == 0 || index == 1 || index == data.count - 1 || index == data.count - 2
                else {
                    formattedPhoneNumber.append("•")
                    return
                }
                formattedPhoneNumber.append(character)
            }
            return formattedPhoneNumber
        }

    }

    init() {
        print(Constants.formattedPhoneNumber("+375447212371"))
        print(Constants.formattedPhoneNumber("371"))
        print(Constants.formattedPhoneNumber("3719"))
        print(Constants.formattedPhoneNumber("37109"))
        print(Constants.formattedPhoneNumber("37109"))
        print(Constants.formattedPhoneNumber("3"))
    }
}

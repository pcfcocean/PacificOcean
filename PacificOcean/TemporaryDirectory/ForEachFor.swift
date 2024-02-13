//
//  ForEachFor.swift
//  PacificOcean
//
//  Created by Vlad Lesnichiy on 27.12.23.
//

import Foundation


struct ForEcahFor {
    func фор() {
        for element in (0 ... 20) {
            print("--- for in \(element)")
            if element == 8 { return }
        }
        print("--- выход из функции фор")
    }

    func форич() {
        (0 ... 20).forEach { element in
            print("--- forEach \(element)")
            if element == 8 { return }
        }
        print("--- выход из функции форич")
    }

    func форВместесГард() {
        for element in (0 ... 20) {
            print("--- for in \(element)")
            guard element == 20 else { continue }
            print("--- after guard \(element)")
            return
        }
        print("--- выход из функции форВместесГард")
    }

    func форичВместесГард() {
        (0 ... 20).forEach { element in
            print("--- forEach in \(element)")
            guard element == 8 else { return }
            print("--- after guard \(element)")
            return
        }
        print("--- выход из функции форВместесГард")
    }
}

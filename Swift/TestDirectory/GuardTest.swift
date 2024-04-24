//
//  GuardTest.swift
//  PacificOcaen
//
//  Created by Vlad Lesnichiy on 27.03.24.
//

import Foundation

struct GuartTest {
    init() {
    }

    func guardTest() {
        guard false else { return printer() }
        print("--- aftre guard")
    }

    private func printer() {
        print("--- private func print")
    }
}

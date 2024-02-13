//
//  QueueTest.swift
//  PacificOcean
//
//  Created by Vlad Lesnichiy on 4.01.24.
//

import Foundation

struct QueueTest {
    let queue = DispatchQueue(label: "QueueTest", qos: .userInitiated)

    init() {
        print("--- start init")
        executeStruct()
        print("--- stop init")
    }

    private func executeStruct() {
        print("--- start Method")
        queue.async {
            print("--- start Thread.sleep(forTimeInterval: 3)")
            Thread.sleep(forTimeInterval: 3)
            print("--- stop Thread.sleep(forTimeInterval: 3)")
        }
        print("--- stop Method")
    }
}

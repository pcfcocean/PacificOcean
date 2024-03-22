//
//  DispachText.swift
//  PacificOcean
//
//  Created by Vlad Lesnichiy on 1.03.24.
//

import Foundation

struct DispachTest {
    init() {
        print("start")
        let semaphore = DispatchSemaphore(value: 1)
        Thread.sleep(forTimeInterval: 3)
        semaphore.wait()
        print(semaphore.description)
        semaphore.signal()
        print(semaphore.description)
    }
}

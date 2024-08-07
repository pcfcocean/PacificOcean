//
//  Step2.swift
//  PacificOcaen
//
//  Created by Vlad Lesnichiy on 1.07.24.
//

import Foundation

class Step2 {
    let group = DispatchGroup()
    let lock = NSLock()
    var count = 0

    init() {
        group.enter()
        DispatchQueue.global().async() {
            for _ in 0...9999 {
                self.lock.lock()
                self.count += 1
                self.lock.unlock()
            }
            self.group.leave()
        }

        group.enter()
        DispatchQueue.global().async() {
            for _ in 0...9999 {
                self.lock.lock()
                self.count += 1
                self.lock.unlock()
            }
            self.group.leave()
        }

        group.notify(queue: DispatchQueue.global()) {
            print(self.count) // ?
        }
    }
}

//
//  Debouncer.swift
//  Todoey
//
//  Created by Bach Pham on 18/10/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
class Debouncer {
    private let interval: TimeInterval
    private var timer: Timer?
    private let queue: DispatchQueue

    init(interval: TimeInterval, queue: DispatchQueue = .main) {
        self.interval = interval
        self.queue = queue
    }

    func debounce(action: @escaping () -> Void) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
            action()
        }
    }
}

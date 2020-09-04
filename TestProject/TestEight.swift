import Foundation

/// Start a timer and increment a counter in a closure that captures self as `unowned`.
/// https://www.strawpoll.me/20884148
class TestEight {
    var timer: Timer?
    var count: Int = 0
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [unowned self] _ in
            self.count += 1
            print(self.count)
        }
    }
    
    deinit {
        timer?.invalidate()
        print("🐵")
    }
}

/// This will deinitialize immediately.
/// `self` is captured as an unowned reference in the closure, so nothing is retaining
/// it and it can safely deinitialize.
///
/// TestEight ---> timer ---> closure
///   ^                         |
///   |________unowned__________|

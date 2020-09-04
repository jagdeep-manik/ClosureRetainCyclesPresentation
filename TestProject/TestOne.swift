import Foundation

/// Start a timer and increments a counter.
/// https://www.strawpoll.me/20884096
class TestOne {
    var timer: Timer?
    var count: Int = 0
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.count += 1
            print(self.count)
        }
    }
    
    deinit {
        timer?.invalidate()
        print("🐵")
    }
}

/// This will loop forever, printing 1, 2, 3, 4, 5...
/// `self` is captured as a strong reference owned by the timer:
///
/// TestOne ---> timer ---> closure
///   ^                        |
///   |________________________|

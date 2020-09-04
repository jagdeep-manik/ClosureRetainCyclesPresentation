import Foundation

/// Start a timer and increment a counter in a closure that captures self weakly.
/// https://www.strawpoll.me/20884169
class TestTen {
    var timer: Timer?
    var count: Int = 0
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.count += 1
            print(String(describing: self?.count))
        }
    }
    
    deinit {
        timer?.invalidate()
        print("🐵")
    }
}

/// This will deinitialize immediately.
/// `self` is captured as a weak reference in the closure, so nothing is retaining
/// it and it can safely deinitialize.
///
/// TestTen ---> timer ---> closure
///   ^                        |
///   |_________weak___________|

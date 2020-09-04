import Foundation

/// Start a timer and call a designated method.
/// https://www.strawpoll.me/20884104
class TestTwo {
    var timer: Timer?
    var count: Int = 0
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: callback)
    }
    
    deinit {
        timer?.invalidate()
        print("🐵")
    }
    
    func callback(timer: Timer) {
        count += 1
        print(count)
    }
}

/// This will loop forever, printing 1, 2, 3, 4, 5...
/// Non-static functions implicitly retain `self` when passed as a closure.
///
/// TestTwo ---> timer ---> closure
///   ^                        |
///   |________________________|

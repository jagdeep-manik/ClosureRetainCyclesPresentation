import Foundation

/// Start a timer and call a designated static method.
/// https://www.strawpoll.me/20884113
class TestFour {
    static var count: Int = 0
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: Self.callback)
    }
    
    deinit {
        timer?.invalidate()
        print("🐵")
    }
    
    static func callback(timer: Timer) {
        count += 1
        print(count)
    }
}

/// This will deinitialize immediately.
/// Static functions do not depend on `self`, so TestFour has no
/// additional references that keep it alive.
///
/// TestFour ---> timer ---> closure

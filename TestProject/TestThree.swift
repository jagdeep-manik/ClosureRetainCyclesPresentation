import Foundation

/// Start a timer and call a designated method using the #selector syntax.
/// https://www.strawpoll.me/20884108
class TestThree {
    var timer: Timer?
    var count: Int = 0
    
    init() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(callback(timer:)),
            userInfo: nil,
            repeats: true
        )
    }
    
    deinit {
        timer?.invalidate()
        print("🐵")
    }
    
    @objc func callback(timer: Timer) {
        count += 1
        print(count)
    }
}

/// This will loop forever, printing 1, 2, 3, 4, 5...
/// Selectors behave the same way as in TestTwo.
///
/// TestThree ---> timer ---> closure
///   ^                         |
///   |_________________________|


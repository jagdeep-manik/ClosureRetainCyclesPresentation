import Foundation

/// Construct a helper class, which starts a timer that runs a closure that captures self `unowned`.
/// https://www.strawpoll.me/20884162
class TestNine {
    var count: Int = 0
    
    init() {
        _ = TestNineHelper { [unowned self] in
            self.count += 1
            print(self.count)
        }
    }
    
    deinit {
        print("🐵")
    }
}

class TestNineHelper {
    var timer: Timer?
    
    init(block: @escaping () -> ()) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            block()
        }
    }
}

/// This will deinitialize and then crash.
/// TestNineHelper creates a timer than is owned by the run-loop, so
/// even though it and TestNine get deinitialized immediately, the timer
/// will continue to call the closure. And since self doesn't exist anymore,
/// the app will crash.
///
///              (and owned by run loop)
/// TestNineHelper ---> timer ---> closure ---unowned---> TestNine

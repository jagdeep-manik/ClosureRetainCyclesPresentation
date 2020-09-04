import Foundation

/// Start a timer that increments a counter in a closure that captures `self` strongly.
/// Invalidate the timer in the closure.
/// https://www.strawpoll.me/20884175
class TestEleven {
    var timer: Timer?
    var count: Int = 0
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.count += 1
            print(self.count)
            
            self.timer?.invalidate()
        }
    }
    
    deinit {
        print("🐵")
    }
}

/// This will run the timer once and then deinitialize.
/// `self` is captured strongly by the timer, BUT once the timer gets invalidated,
/// nothing is retaining the closure (and therefore `self`), so it can deinitialize.
///
/// BEFORE INVALIDATE:
///
/// TestEleven ---> timer ---> closure
///   ^                          |
///   |__________________________|
///
/// AFTER INVALIDATE:
///
/// TestEleven ---> timer

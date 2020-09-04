import Foundation

/// Start a timer and call a method on a class weakly referenced in a closure.
/// https://www.strawpoll.me/20884140
class TestSeven {
    var timer: Timer?
    var count: Int = 0
    
    init() {
        let buddy = TestSevenBuddy()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak buddy] _ in
            self.count += 1
            print(self.count)
            
            buddy?.doSomething()
        }
    }
    
    deinit {
        timer?.invalidate()
        print("🐵")
    }
}

class TestSevenBuddy {
    func doSomething() { }
    
    deinit {
        print("🐔")
    }
}

/// This will run forever, but TestSevenBuddy will deinitialize immediately.
/// TestSevenBuddy is captured weakly by the timer's closure, so once `buddy`
/// leaves scope (end of init), it will deinitialize.
///
/// TestSeven ---> timer ---> closure ---weak---> TestSevenBuddy
///   ^                         |
///   |_________________________|

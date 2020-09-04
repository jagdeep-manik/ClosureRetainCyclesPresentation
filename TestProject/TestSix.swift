import Foundation

/// Start a timer and call a method on a class held in a local variable.
/// https://www.strawpoll.me/20884126
class TestSix {
    var timer: Timer?
    var count: Int = 0
    
    init() {
        let buddy = TestSixBuddy()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.count += 1
            print(self.count)
            
            buddy.doSomething()
        }
    }
    
    deinit {
        timer?.invalidate()
        print("🐵")
    }
}

class TestSixBuddy {
    func doSomething() { }
    
    deinit {
        print("🐔")
    }
}

/// This will run forever and TestSixBuddy will never deinitialize.
/// The timer closure has a strong reference to TestSixBuddy, and since
/// there is a retain cycle, TestSixBuddy will live with the closure.
///
/// TestSix ---> timer ---> closure ---> TestSixBuddy
///   ^                        |
///   |________________________|

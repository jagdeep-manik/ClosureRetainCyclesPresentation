import Foundation

/// Start a timer and call a method on a class held in an instance variable.
/// https://www.strawpoll.me/20884117
class TestFive {
    let buddy = TestFiveBuddy()
    var timer: Timer?
    var count: Int = 0
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.count += 1
            print(self.count)
            
            self.buddy.doSomething()
        }
    }
    
    deinit {
        timer?.invalidate()
        print("🐵")
    }
}

class TestFiveBuddy {
    func doSomething() { }
    
    deinit {
        print("🐔")
    }
}

/// This will run forever and TestFiveBuddy will never deinitialize.
/// TestFive has a strong reference to it, and since TestFive is retained,
/// its TestFiveBuddy will be retained too.
///
/// TestFiveBuddy
///   ^
///   |
/// TestFive ---> timer ---> closure
///   ^                        |
///   |________________________|

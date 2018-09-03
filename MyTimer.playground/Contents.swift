import Foundation

protocol MyTimerDelegate {
    func start()
    func current(counter: Int)
    func stop()
    func fnish()
}

class MyTimer {
    
    var delegate : MyTimerDelegate?
    var counter : Int = 0
    var timer : Timer?
    
    init(counter: Int) {
        self.counter = counter
    }
    
    func startTimer() {
        if let timer = self.timer {
            timer.fire()
        }else {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
                if self.counter == 30 {
                    self.delegate?.fnish()
                    self.delegate?.stop()
                    timer.invalidate()
                }else {
                    self.counter = self.counter + 1
                    self.delegate?.current(counter: self.counter)
                }
            })
        }
    }
    
    func stopTimer() {
        if let timer = self.timer {
            timer.invalidate()
        }else {
            print("Timer not fired yet !!")
        }
    }
}

struct Clock : MyTimerDelegate {
    
    var myTimer: MyTimer
    init() {
        myTimer = MyTimer(counter: 0)
        myTimer.delegate = self
    }
    
    func start() {
        print("Start")
    }
    
    func stop() {
        print("Stop")
    }
    
    func current(counter: Int) {
        print(counter)
    }
    
    func fnish() {
        print("fnish")
    }
    
    func startClock() {
        myTimer.startTimer()
    }
    
    func stopClock() {
        myTimer.stopTimer()
    }
}

/*
 * Note: PLease Creat a class with Name : Clock.
 * Clock class contains 1 proerty from class 'MyTimer' (Don't forget to init the object in init). and 2 functions 1) start clock to trigger MyTimer object to start, 2) stop MyTimer Object.
 * Clock Class needs to adopt MyTimerDelegate.
 * create an instance of Clock. and call startClock function to test the code :)
 */

let clock = Clock()
clock.startClock()

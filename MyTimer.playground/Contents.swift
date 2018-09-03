import Foundation

protocol MyTimerDelegate {
    func start(timer: MyTimer)
    func current(timer: MyTimer, counter: Int)
    func stop(timer: MyTimer)
    func fnish(timer: MyTimer)
}

class MyTimer {
    
    var delegate : MyTimerDelegate?
    var counter : Int = 0
    var timer : Timer?
    
    init(counter: Int) {
        self.counter = counter
    }
    
    
    /*
     * This function will trigger the timer in case the timer is not null (timer is option) or in will construct timer object to start counting.
     *
     */
    func startTimer() {
        if let timer = self.timer {
            timer.fire()
        }else {
            timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { timer in
                if self.counter == 30 {
                    self.delegate?.fnish(timer: self)
                    self.delegate?.stop(timer: self)
                    timer.invalidate()
                }else {
                    self.counter = self.counter + 1
                    self.delegate?.current(timer: self, counter: self.counter)
                }
            })
        }
    }
    
    /*
     * This function will stop timer in case it's not null. (Timer is optional), if not stop func will print in console ("Timer is not init yet  😅!")
     *
     *
     */
    func stopTimer() {
        if let timer = self.timer {
            timer.invalidate()
        }else {
            print("Timer is not init yet  😅!")
        }
    }
}





/*
 * Note: PLease Creat a class with Name : Clock.
 * Clock class contains 1 proerty from class 'MyTimer' (Don't forget to init the object in init). and 2 functions 1) start clock to trigger MyTimer object to start, 2) stop MyTimer Object.
 * Clock Class needs to adopt MyTimerDelegate.
 * create an instance of Clock. and call startClock function to test the code :)
 *
 * ========
 *
 * Here in this file plaeas create a class contatins 1 object called timer from MyTimer class. in `init` inisiate your timer and adopt MyTimer Delegate. don't forget to implement delegate func. Happy Coding!
 *
 */

class Clock : MyTimerDelegate {
    
    var myTimer: MyTimer!
    init(timer: MyTimer) {
        myTimer = timer
        myTimer.delegate = self
        
    }
    
    func fireTimer() {
        myTimer.startTimer()
    }
    
    func start(timer: MyTimer) {
        print("Start")
    }
    
    func stop(timer: MyTimer) {
        print("Stop")
    }
    
    
    func current(timer: MyTimer, counter: Int) {
        print(counter)
    }
    
    func fnish(timer: MyTimer) {
        print("fnish")
    }
    
}



let timer = MyTimer(counter: 0)
let clock = Clock(timer: timer)
clock.fireTimer()

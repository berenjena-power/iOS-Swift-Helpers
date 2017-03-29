import Foundation

public class PausableTimer {
    
    private var timerDuration: Double
    private var timerFiredCompletion: () -> Void
    
    private var timer: Timer
    private var startDate: Date?
    private var timeElapsed: Double
    
    public init(timerDuration: Double, timerFiredCompletion: @escaping () -> Void) {
        self.timerDuration = timerDuration
        self.timerFiredCompletion = timerFiredCompletion
        timer = Timer()
        timeElapsed = 0.0
    }
    
    public func start() -> PausableTimer {
        timer = Timer.scheduledTimer(timeInterval: self.timerDuration - timeElapsed, target: self, selector: #selector(timerFired), userInfo: nil, repeats: false)
        startDate = Date()
        return self
    }
    
    public func pause() {
        guard let startDate = startDate else {
            print("⚠️ Can't pause timer, it hasn't been started.")
            return
        }
        
        timer.invalidate()
        timeElapsed = Date().timeIntervalSince(startDate)
    }
    
    public func resume() {
        _ = start()
    }
    
    public func stop() {
        timer.invalidate()
    }
    
    @objc
    private func timerFired() {
        timer.invalidate()
        timerFiredCompletion()
    }
}

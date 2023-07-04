//
//  EventDetailVC.swift
//  CountDownApp
//
//  Created by Afonso Costa on 28/06/2023.
//

import Foundation
import UIKit

class EventDetailVC: UIViewController {
    
    @IBOutlet var eventTitleLabel: UILabel!
    
    @IBOutlet var timeToEventTitle: UILabel!
    
    @IBOutlet var timeToEventLabel: UILabel!
    
    
    private var event: Event?
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTitleLabel.text = event?.title
        timeToEventTitle.text = "Time left to event:"
        createTimer()
        updateTime()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    public func setEvent(event: Event){
        self.event = event
    }
    
}

// MARK: - Timer
extension EventDetailVC {
    
    func updateTime() {
        
        let time = Date().timeIntervalSince(event?.date ?? Date())
        let absTime = abs(time)
        
        let days = Int(absTime) / 86400
        let hours = Int(absTime) / 3600 % 24
        let minutes = Int(absTime) / 60 % 60
        let seconds = Int(absTime) % 60
        
        var times: [String] = []
        
        if days > 0 {
            times.append("\(days)d")
        }
        if hours > 0 {
            times.append("\(hours)h")
        }
        if minutes > 0 {
            times.append("\(minutes)m")
        }
        times.append("\(seconds)s")
        
        timeToEventLabel.text = times.joined(separator: " ")
        
    }
    
    
    @objc func updateTimer() {
        
        if let fireDateDescription = timer?.fireDate.description {
            
            print(fireDateDescription)
        }
        updateTime()
    }
    
    func createTimer() {
        
        if timer == nil {
            let timer = Timer(timeInterval: 1.0,
                              target: self,
                              selector: #selector(updateTimer),
                              userInfo: nil,
                              repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.1
            
            self.timer = timer
        }
    }
    
}

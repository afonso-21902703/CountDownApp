//
//  CreateEventVC.swift
//  CountDownApp
//
//  Created by Afonso Costa on 28/06/2023.
//

import Foundation
import UIKit

class CreateEventVC: UIViewController{
    
    @IBOutlet var createEventTitleLabel: UILabel!
    
    @IBOutlet var eventTitleContainer: UIView!
    
    @IBOutlet var eventNameLabel: UILabel!
    
    @IBOutlet var eventNameInput: UITextField!
    
    @IBOutlet var eventDateContainer: UIView!
    
    @IBOutlet var eventDateLabel: UILabel!
    
    @IBOutlet var eventDatePicker: UIDatePicker!
    
    @IBOutlet var addEventButton: UIButton!
    
    
    private var eventList:[Event]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createEventTitleLabel.text = "Event Details"
        eventNameLabel.text = "Event Name"
        eventNameInput.placeholder = "Wedding, dinner..."
        eventDateLabel.text = "Event date and time"
        addEventButton.setTitle("Add Event", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! InitialVC
        if let list = self.eventList {
            
            destVC.setEventList(list: list)
        }
    }
    
    @IBAction func addEventButtonAction(_ sender: Any) {
        
        let newEvent:Event = Event(title: eventNameInput.text, date: eventDatePicker.date)
        self.eventList?.append(newEvent)
        
        
    }
    
    public func setEventList(list: [Event]){
        
        self.eventList = list
    }
    
}

//
//  InitialVC.swift
//  CountDownApp
//
//  Created by Afonso Costa on 28/06/2023.
//

import Foundation
import UIKit

class InitialVC: UIViewController{
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var addEventButton: UIButton!
    
    @IBOutlet var eventListButton: UIButton!
    
    private var eventList:[Event] = []
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "CountDownApp"
        addEventButton.setTitle("Add Event", for: .normal)
        eventListButton.setTitle("Event List", for: .normal)
    }
    
    public func setEventList(list: [Event]){
        self.eventList = list
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAddEvent" {
            
            let destVC = segue.destination as? CreateEventVC
            destVC?.setEventList(list: self.eventList)
        } else {
            
            let destVC = segue.destination as? EventListVC
            destVC?.setEventList(list: self.eventList)
        }
    }
    
    @IBAction func addEventButtonAction(_ sender: Any) {
        
        performSegue(withIdentifier: "toAddEvent", sender: nil)
    }
    
    @IBAction func toEventListAction(_ sender: Any) {
        
        performSegue(withIdentifier: "toEventList", sender: nil)
    }
    
    
    @IBAction func unwind(_ sender: UIStoryboardSegue){}
}

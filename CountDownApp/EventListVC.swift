//
//  EventListVC.swift
//  CountDownApp
//
//  Created by Afonso Costa on 28/06/2023.
//

import Foundation
import UIKit

class EventListVC: UIViewController {
    
    @IBOutlet var tableViewUI: UITableView!
    
    private var eventList: [Event]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        tableViewUI.register(UINib(nibName: "EventListTableViewCell", bundle: nil), forCellReuseIdentifier: "EventListTableViewCell")
    }
    
    public func setEventList(list:[Event]){
        
        self.eventList = list
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? EventDetailVC
        destVC?.setEvent(event: sender as! Event)
    }
}

extension EventListVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let event:Event = eventList?[indexPath.row] ?? Event()
        performSegue(withIdentifier: "toEventDetail", sender: event)
    }
}

extension EventListVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventListTableViewCell") as? EventListTableViewCell else { return UITableViewCell() }
        
        if let list = self.eventList{
         
            cell.setup(event: list[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

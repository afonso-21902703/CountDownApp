//
//  EventListTableViewCell.swift
//  CountDownApp
//
//  Created by Afonso Costa on 28/06/2023.
//

import UIKit

class EventListTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    
    func setup(event: Event){
        self.titleLabel.text = event.title
    }
}

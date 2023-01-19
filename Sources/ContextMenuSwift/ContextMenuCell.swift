//
//  ContextMenuTVC.swift
//  ContextMenuSwift
//
//  Created by Umer Jabbar on 13/06/2020.
//  Copyright © 2020 Umer jabbar. All rights reserved.
//

import UIKit

open class ContextMenuCell: UITableViewCell {
    
    static let identifier = "ContextMenuCell"

    @IBOutlet open weak var label: UILabel!
    @IBOutlet open weak var checkmark: UIImageView!
    
    weak var contextMenu: ContextMenu?
    weak var tableView: UITableView?
    var item: ContextMenuItemWithId!
    var style : ContextMenuConstants? = nil
    
    var leagueId : Int = 0

    override open func prepareForReuse() {
        super.prepareForReuse()
        
        if let label = self.label {
            label.text = nil
        }
        if let imgView = self.checkmark {
            imgView.image = nil
        }
        
    }
    
    open func configureCell(){
     
        
        self.label.text = self.item.title
        
        self.leagueId = self.item.id
        if #available(iOS 13.0, *) {
            self.checkmark.image = UIImage(systemName: "checkmark")
        } else {
            self.checkmark.image = UIImage(named: "checkmark")
        }
        self.checkmark.tintColor = UIColor(red: 0.776, green: 0.667, blue: 0.435, alpha: 1)
        
        self.label.font = self.leagueId == CM.leagueId ? UIFont(name: "CodecPro-Heavy", size: 22) : UIFont(name: "CodecPro-Bold", size: 22)
        self.label.textColor = self.leagueId == CM.leagueId ? UIColor(red: 0.231, green: 0.494, blue: 0.341, alpha: 1) : .black
        self.checkmark.alpha = self.leagueId == CM.leagueId ? 1 : 0
        

    }
    
}

//
//  TableViewCell.swift
//  NoteApp-Week7
//
//  Created by Baki Dikbıyık on 7.05.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var notLabel: UILabel!
    @IBOutlet weak var başlıkLabel: UILabel!
    
    
    func prepareForInfo(for object: Info){
        başlıkLabel.text = object.başlık
        notLabel.text = object.note
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

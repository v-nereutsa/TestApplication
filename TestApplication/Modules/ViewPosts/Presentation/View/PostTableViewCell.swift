//
//  PostTableViewCell.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var addedDate: UILabel!
    @IBOutlet weak var modificationDate: UILabel!
    @IBOutlet weak var shortText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(addedDate: String?, modificationDate: String?, text: String?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm:ss"
        self.addedDate.text = formatter.string(from: Date(timeIntervalSince1970: NumberFormatter().number(from: addedDate ?? "0")?.doubleValue ?? 0))
        
        self.modificationDate.text = formatter.string(from: Date(timeIntervalSince1970: NumberFormatter().number(from: addedDate ?? "0")?.doubleValue ?? 0))
        
        if addedDate == modificationDate {
            self.modificationDate.alpha = 0
        } else {
            self.modificationDate.alpha = 1
        }
        
        guard let shortText = text else {
            self.shortText.text = ""
            return
        }
        let start = shortText.startIndex
        let end = shortText.index(shortText.startIndex, offsetBy: shortText.count > 200 ? 200:shortText.count)
        let range = start..<end
        
        self.shortText.text = String(shortText[range])

    }

}

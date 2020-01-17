//
//  SkinTableMenu.swift
//  ios
//
//  Created by Matthew on 1/16/20.
//  Copyright © 2020 bahlsenwitz. All rights reserved.
//

import UIKit

class SkinTableMenu: UITableViewController {
    
    //var items = ["0", "1", "2", "3"]
    
    var skinList: Array<Skin>?
    
    //Skin
    
    required init?(coder aDecoder: NSCoder) {
        
        let orange: UIColor = UIColor(red: 255/255.0, green: 105/255.0, blue: 104/255.0, alpha: 1) //FF6968
        let pink: UIColor = UIColor(red: 255/255.0, green: 105/255.0, blue: 180/255.0, alpha: 1)
        let purple: UIColor = UIColor(red: 140/255.0, green: 0/255.0, blue: 192/255.0, alpha: 1)
        let blue: UIColor = UIColor(red: 84/255.0, green: 140/255.0, blue: 240/255.0, alpha: 1)
        let green: UIColor = UIColor(red: 0/255.0, green: 255/255.0, blue: 88/255.0, alpha: 1)
        
        //uicolor
        let hyperion: Skin = Skin(name: "hyperion", foreColor: purple, backColor: blue)
        let calypso: Skin = Skin(name: "calypso", foreColor: pink, backColor: UIColor.black)
        let neptune: Skin = Skin(name: "neptune", foreColor: green, backColor: orange)
        
        let iapetus: Skin = Skin(
            name: "iapetus",
            foreColor: UIColor.black,
            foreImage: UIImage(named: "iapetus"),
            backColor: UIColor.black,
            backImage: UIImage(named: "iapetus"))
        
        self.skinList = Array(arrayLiteral: calypso, hyperion, neptune, iapetus)
        
        super.init(coder: aDecoder)
    }
    
    var player: Player?
    
    public func setPlayer(player: Player){
        self.player = player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skinList!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let skinTableCell = tableView.dequeueReusableCell(withIdentifier: "SkinTableCell", for: indexPath) as! SkinTableCell
        skinTableCell.cellNameLabel.text = self.skinList![indexPath.row].getName()
        
        skinTableCell.cellForegroundView.backgroundColor = self.skinList![indexPath.row].getForeColor()
        let foreImage = self.skinList![indexPath.row].getForeImage()
        skinTableCell.cellForegroundImage.image = foreImage
        
        skinTableCell.cellBackgroundView.backgroundColor = self.skinList![indexPath.row].getBackColor()
        let backImage = self.skinList![indexPath.row].getBackImage()
        skinTableCell.cellBackgroundImage.image = backImage
        
        return skinTableCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let skinInfoSelectionDictionary = ["skin_info_selection": self.skinList![indexPath.row].getName()]
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "SkinInfoSelection"),
            object: nil,
            userInfo: skinInfoSelectionDictionary)
    }
    
}


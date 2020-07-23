//
//  UItableView.swift
//  MyOoredoo
//
//  Created by Vivek Patel on 11/02/20.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import UIKit

//MARK:- UITableView Extension
extension UITableView {
    
    func reloadDataInMain() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func displayBackgroundText(text: String, fontStyle: String = "HelveticaNeue", fontSize: CGFloat = 18.0, textColor: UIColor) {
        let lbl = UILabel();
        
        if let headerView = self.tableHeaderView {
            lbl.frame = CGRect(x: 0, y: headerView.bounds.size.height, width: self.bounds.size.width, height: self.bounds.size.height - headerView.bounds.size.height)
        } else {
            lbl.frame = CGRect(x: 10, y: 0, width: self.bounds.size.width - 20, height: self.bounds.size.height);
        }
        lbl.text = text;
        lbl.textColor = textColor
        lbl.numberOfLines = 0;
        lbl.textAlignment = .center;
        lbl.font = UIFont(name: fontStyle, size:fontSize);
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height));
        backgroundView.addSubview(lbl);
        self.backgroundView = backgroundView;
    }
    
    func removeBackgroundText() {
        self.backgroundView = nil
    }
}

extension UICollectionView {

    func reloadDataInMain() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func displayBackgroundText(text: String, fontStyle: String = "HelveticaNeue", fontSize: CGFloat = 18.0, textColor: UIColor) {
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = text
        messageLabel.textColor = textColor
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: fontStyle, size: 18)
        messageLabel.sizeToFit()
       // let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height));
       // backgroundView.addSubview(messageLabel);
        self.backgroundView = messageLabel;
    }

    func removeBackgroundText() {
        self.backgroundView = nil
    }
}

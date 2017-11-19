//
//  CountSummaryView.swift
//  Word Count
//
//  Created by James Shaw on 08/09/2016.
//  Copyright © 2016 James Shaw. All rights reserved.
//

import Foundation
import UIKit

class CountSummaryView: UIView {
    
    // Labels
    var charsLabel: UILabel!
    var charsValueLabel: UILabel!
    var wordsLabel: UILabel!
    var wordsValueLabel: UILabel!
    //------------
    
    // Seperator View
    var seperatorView: UIView!
    
    // Margins
    let xMargin: CGFloat = 20.0
    let yMargin: CGFloat = 10.0
    let labelHeight: CGFloat = 20.0
    
    init() {
        super.init(frame: CGRect.zero)
        
        // Clear background
        self.backgroundColor = UIColor.clear
        
        // Create seperatorView
        self.seperatorView = UIView(frame: CGRect.zero)
        self.seperatorView.backgroundColor = UIColor.white
        self.addSubview(self.seperatorView)
        //----------
        
        // Create charsLabel
        self.charsLabel = UILabel(frame: CGRect.zero)
        self.charsLabel.textColor = UIColor.white
        self.charsLabel.textAlignment = .left
        self.charsLabel.backgroundColor = UIColor.clear
        self.charsLabel.text = "Characters:"
        self.charsLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.charsLabel)
        //--------------
        
        // Create charsValueLabel
        self.charsValueLabel = UILabel(frame: CGRect.zero)
        self.charsValueLabel.textColor = UIColor.white
        self.charsValueLabel.textAlignment = .right
        self.charsValueLabel.backgroundColor = UIColor.clear
        self.charsValueLabel.text = "0"
        self.charsValueLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.charsValueLabel)
        //--------------
        
        // Create wordsLabel
        self.wordsLabel = UILabel(frame: CGRect.zero)
        self.wordsLabel.textColor = UIColor.white
        self.wordsLabel.textAlignment = .left
        self.wordsLabel.backgroundColor = UIColor.clear
        self.wordsLabel.text = "Words:"
        self.wordsLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.wordsLabel)
        //--------------
        
        // Create wordsValueLabel
        self.wordsValueLabel = UILabel(frame: CGRect.zero)
        self.wordsValueLabel.textColor = UIColor.white
        self.wordsValueLabel.textAlignment = .right
        self.wordsValueLabel.backgroundColor = UIColor.clear
        self.wordsValueLabel.text = "0"
        self.wordsValueLabel.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.thin)
        self.addSubview(self.wordsValueLabel)
        //--------------
    }
    
    // Called once we have a frame for the view
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Get the view's frame
        let frame = self.frame
        
        // Separator View
        let seperatorYMargin: CGFloat = 6.0
        self.seperatorView.frame = CGRect(x: (frame.width / 2), y: seperatorYMargin, width: 0.5, height: frame.height - (2 * seperatorYMargin))
        //----------
        
        // Width of value labels
        let valueLabelWidth: CGFloat = 50.0
        let valueLabelXMargin: CGFloat = 8.0
        
        // Set frame of charsLabel and charsValueLabel
        let charsLabelWidth = (frame.width / 2) - self.xMargin - valueLabelWidth - valueLabelXMargin
        self.charsLabel.frame = CGRect(x: self.xMargin, y: self.yMargin, width: charsLabelWidth, height: self.labelHeight)
        let charsValueLabelX = (frame.width / 2) - self.xMargin - valueLabelWidth
        self.charsValueLabel.frame = CGRect(x: charsValueLabelX, y: self.yMargin, width: valueLabelWidth, height: self.labelHeight)
        //-----------
        
        // Set frame of wordsLabel
        let wordsLabelX = (frame.width / 2) + self.xMargin
        let wordsLabelWidth = (frame.width / 2) - self.xMargin - valueLabelWidth - valueLabelXMargin
        self.wordsLabel.frame = CGRect(x: wordsLabelX, y: self.yMargin, width: wordsLabelWidth, height: self.labelHeight)
        let wordsValueLabelX = frame.width - self.xMargin - valueLabelWidth
        self.wordsValueLabel.frame = CGRect(x: wordsValueLabelX, y: self.yMargin, width: valueLabelWidth, height: self.labelHeight)
        //-----------
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

}

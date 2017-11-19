//
//  CountHelper.swift
//  Word Count
//
//  Created by James Shaw on 06/09/2016.
//  Copyright © 2016 James Shaw. All rights reserved.
//

import Foundation
import UIKit

class CountHelper: NSObject {
    
    // Static instance of the object
    static let shared = CountHelper()
    
    func getNumberOfChars(_ text: String) -> Int {
        return text.count
    }
    
    func getNumberOfCharsWithoutSpaces(_ text: String) -> Int {
        return 0
    }
    
    func getNumberOfWords(_ text: String) -> Int {
        let wordArray = text.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "").components(separatedBy: " ").filter{$0 != ""}
        return wordArray.count
    }
    
    func getNumberOfLines(_ text: String, textView: UITextView) -> Int {
        let lines = Int(textView.contentSize.height / textView.font!.lineHeight)
        return lines
    }
    
    func getNumberOfParagraphs(_ text: String) -> Int {
        var paragraphsArray = text.components(separatedBy: "\n")
        
        // Remove empty strings
        while paragraphsArray.contains("") {
            if let removeIndex = paragraphsArray.index(of: "") {
                paragraphsArray.remove(at: removeIndex)
            }
        }
        //---------
        
        return paragraphsArray.count
    }
}

//
//  FormatHTML.swift
//  Test
//
//  Created by Arturs Vitins on 06/09/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//


import UIKit

struct Formatting {
    
    static func formatHTML (text: String) -> NSAttributedString {
        
        let data = text.data(using: String.Encoding.unicode)!
    
        let attrStr = try? NSAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)

        
        return attrStr!
        
    }
 
    
}

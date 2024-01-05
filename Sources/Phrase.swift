//
//  Phrase.swift
//  Phrase
//
//  Created by Cody Robertson on 1/13/17.
//  Copyright © 2017 Cody Robertson. All rights reserved.
//

import Foundation

final public class Phrase {

    // MARK: -
    // MARK: Properties
    
    /// The template we will attempt to replace tokens of.
    private let template: String
    
    /// The set of token replacements to be replaced in the template.
    private var replacements: [String : String] = [:]
    
    // MARK: -
    // MARK: Initialization
    
    public init(template: String) {
        self.template = template
    }
    
    // MARK: -
    // MARK: Public
    
    /**
     * Adds a record to replace the tokenized key with the given value in the template.
     *
     * - Parameters:
     *     - key: The key you want to replace.
     *     - value: The value to replace the key with.
     */
    @discardableResult
    public func put(key: String, value: CustomStringConvertible) -> Phrase {
        replacements[key] = value.description
        return self
    }
    
    /**
     * Returns a formatted string by attempting to replace all tokens with their respective values.
     *
     * - Returns: A formatted string with all current replacements.
     */
    public func format() -> String {
        var formatted = template
        
        for (key, value) in replacements {
            formatted = formatted.replacingOccurrences(of: tokenize(key: key), with: value)
        }
        
        return formatted
    }
    
    // MARK: -
    // MARK: Private
    
    /**
     * Tokenizes the given key.
     *
     * - Parameter key: The key you want to tokenize.
     * - Returns: A tokenized version of the key.
     */
    private func tokenize(key: String) -> String {
        return "{" + key + "}"
    }
    
}


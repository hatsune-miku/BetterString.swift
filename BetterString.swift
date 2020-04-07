//
//  StringUtil.swift
//
//  Created by Kagamine Rin on 3/18/20.
//  Copyright © 2020 Kagamine Rin. All rights reserved.
//

import Foundation

extension String {
    public func find(anotherString: String) -> Int {
        guard let lowerBound =
            range(of: anotherString)?.lowerBound
        else {
            return -1
        }
        return distance(
            from: startIndex,
            to: lowerBound
        ).advanced(by: 0)
    }
    
    public func ensureStarts(with: String) -> String {
        if starts(with: with) {
            return self
        }
        else {
            return "\(with)\(self)"
        }
    }
    
    public func ends(with: String) -> Bool {
        mid(-with.length - 1, -1) == with
    }
    
    public func ensureEnds(with: String) -> String {
        if ends(with: with) {
            return self
        }
        else {
            return self + with
        }
    }
    
    public var length: Int {
        get {
            self.count
        }
        set {
            self = self.left(newValue)
        }
    }
    
    public subscript(_ position: Int) -> Character {
        self[self.index(startIndex, offsetBy: position)]
    }

    public subscript(_ string: String) -> Int {
        find(anotherString: string)
    }
    
    public func insert(_ what: String, at: Int) -> String {
        "\(self.mid(0...at))\(what)\(self.mid(at...self.length))"
    }
    
    public func replace(_ what: String, with: String) -> String {
        replacingOccurrences(of: what, with: with)
    }
    
    public func no(_ what: String) -> String {
        replace(what, with: "")
    }
    
    public func without(_ what: String) -> String {
        no(what)
    }
    
    public func repeats(forHowManyTimes: Int) -> String {
        var ret = ""
        for _ in 1...forHowManyTimes {
            ret.append(self)
        }
        return ret
    }
    
    public func take(_ howMany: Int = 1) -> String {
        mid(howMany, -1)
    }
    
    public func drop(_ howMany: Int = 1) -> String {
        mid(0, -howMany - 1)
    }
    
    public func mid(_ startIndex: Int, _ endIndex: Int) -> String {
        let realLowerBound =
            startIndex < 0
                ? startIndex + length + 1
                : startIndex
        
        let realUpperBound =
            endIndex < 0
                ? endIndex + length + 1
                : endIndex

        if realLowerBound > realUpperBound {
            return ""
        }
        
        return String(
            self[
                Range<Index>(
                    NSRange(
                        location: realLowerBound,
                        length: realUpperBound - realLowerBound
                    ),
                    in: self
                )!
            ]
        )
    }
    
    public func mid(_ range: Range<Int>) -> String {
        mid(ClosedRange<Int>(range))
    }
    
    public func mid(_ range: ClosedRange<Int>) -> String {
        mid(range.lowerBound, range.upperBound)
    }
    
    public func left(_ howMany: Int) -> String {
        mid(0...howMany)
    }
    
    public func right(_ howMany: Int) -> String {
        mid(-howMany, -1)
    }
    
    public func before(_ what: String) -> String {
        mid(0...find(anotherString: what))
    }
    
    public func after(_ what: String) -> String {
        mid(find(anotherString: what) + what.length, -1)
    }
    
    public func from(_ what: String) -> String {
        mid(find(anotherString: what), -1)
    }
    
    public func to(_ what: String) -> String {
        mid(0, find(anotherString: what) + what.length)
    }
    
    public func between(_ a: String, and: String) -> String {
        after(a).before(and)
    }
    
    public func split(by: String) -> [String] {
        var res = [String]()
        var copy = self
        
        while true {
            let index = copy.find(anotherString: by)
            if index == -1 {
                break
            }
            
            res.append(copy.left(index))
            copy = copy.mid(index + by.length, -1)
        }
        
        res.append(copy)
        return res
    }
    
    private func match(
        regex: String,
        options: NSRegularExpression.MatchingOptions = []
    ) -> [NSTextCheckingResult] {
        let regex = try? NSRegularExpression(pattern: regex, options: [])
        let results =
            regex?.matches(
                in: self,
                options: options,
                range: NSRange(location: 0, length: length)
            )
        guard results != nil else {
            return []
        }
        return results!
    }
    
    public func matches(regex: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    public func replaceAll(
        regex: String,
        replaceWith: String,
        options: NSRegularExpression.MatchingOptions = []
    ) -> String {
        var res = self as NSString
        let matches = self.match(regex: regex, options: options).reversed()
        
        for match in matches {
            res = res.replacingCharacters(
                in: match.range,
                with: replaceWith
            ) as NSString
        }
        return res as String
    }
}

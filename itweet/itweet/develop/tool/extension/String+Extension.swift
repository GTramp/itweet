//
//  String+Extension.swift
//  itweet
//
//  Created by tramp on 2018/4/5.
//  Copyright © 2018年 tramp. All rights reserved.
//

import Foundation

extension String {
    func url(name: String) -> String? {
        let pattern = "(^|&)\(name)=([^&]*)(&|$)"
        do {
            let regex = try NSRegularExpression.init(pattern: pattern,
                                                     options: NSRegularExpression.Options.caseInsensitive)
           let res =  regex.firstMatch(in: self,
                             options: NSRegularExpression.MatchingOptions.reportCompletion,
                             range: NSRange.init(location: 0, length: count))
            print(tramp: res)
        } catch {
            print(tramp: error)
        }
        return ""
    }
}

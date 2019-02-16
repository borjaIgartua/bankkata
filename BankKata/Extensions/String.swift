//
//  String.swift
//  BankKata
//
//  Created by Borja Igartua Pastor on 16/02/2019.
//  Copyright © 2019 Borja Igartua. All rights reserved.
//

import Foundation



extension String {
    func toDate(withFormat format: String = "dd/MM/yyyy") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
//        guard let result = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: date)) else {
//            fatalError("Failed to strip time from Date object")
//        }
        return date
    }
}

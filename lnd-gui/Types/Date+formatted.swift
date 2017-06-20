//
//  Date+formatted.swift
//  lnd-gui
//
//  Created by Alex Bosworth on 5/20/17.
//  Copyright © 2017 Adylitica. All rights reserved.
//

import Foundation

/** Date is the basic time element
 
 Add: Formatted version
 */
extension Date {
  /** Get formatted date description in a date and time style
   */
  func formatted(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
    let formatter = DateFormatter()

    formatter.dateStyle = dateStyle
    formatter.timeStyle = timeStyle

    return formatter.string(from: self)
  }
}

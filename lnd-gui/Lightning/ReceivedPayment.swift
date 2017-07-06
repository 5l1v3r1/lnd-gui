//
//  ReceivedPayment.swift
//  lnd-gui
//
//  Created by Alex Bosworth on 4/2/17.
//  Copyright © 2017 Adylitica. All rights reserved.
//

import Foundation

/** Received payment is an invoiced payment.
 
 FIXME: - eliminate and use Transaction instead
 */
struct ReceivedPayment {
  let confirmed: Bool
  let createdAt: Date
  let memo: String
  let payment: SerializedPaymentRequest
  let tokens: Tokens
}

//
//  AddPeerViewController.swift
//  lnd-gui
//
//  Created by Alex Bosworth on 4/19/17.
//  Copyright © 2017 Adylitica. All rights reserved.
//

import Cocoa

/** Add peer dialog
 
 FIXME: - default to a normal port, allow changing port
 */
class AddPeerViewController: NSViewController {
  @IBAction func pressedAddPeerButton(_ sender: NSButton) {
    guard let host = hostTextField?.stringValue, !host.isEmpty else { return }
    
    guard let publicKey = publicKeyTextField?.stringValue, !publicKey.isEmpty else { return }
    
    addPeer(host: host, publicKey: publicKey)
  }
  
  @IBOutlet weak var addPeerButton: NSButton?
  
  @IBOutlet weak var hostTextField: NSTextField?
  
  @IBOutlet weak var publicKeyTextField: NSTextField?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do view setup here.
  }
}

extension AddPeerViewController {
  func addPeer(host: String, publicKey: String) {
    
    let session = URLSession.shared
    let sendUrl = URL(string: "http://localhost:10553/v0/peers/")!
    var sendUrlRequest = URLRequest(url: sendUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
    sendUrlRequest.httpMethod = "POST"
    sendUrlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let data = "{\"host\": \"\(host)\", \"public_key\": \"\(publicKey)\"}".data(using: .utf8)

    addPeerButton?.isEnabled = false
    
    let addPeer = session.uploadTask(with: sendUrlRequest, from: data) { [weak self] data, urlResponse, error in
      self?.addPeerButton?.isEnabled = true

      if let error = error {
        return print("ERROR \(error)")
      }
      
      self?.dismiss(self)
    }
    
    addPeer.resume()
  }
}

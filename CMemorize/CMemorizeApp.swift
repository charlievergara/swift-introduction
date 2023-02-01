//
//  CMemorizeApp.swift
//  CMemorize
//
//  Created by Carlos Alberto Vergara Marrugo on 1/02/23.
//

import SwiftUI

@main
struct CMemorizeApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: CMemorizeDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}

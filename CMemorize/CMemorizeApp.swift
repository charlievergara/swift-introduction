//
//  CMemorizeApp.swift
//  CMemorize
//
//  Created by Carlos Alberto Vergara Marrugo on 1/02/23.
//

import SwiftUI

@main
struct CMemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

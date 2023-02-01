//
//  ContentView.swift
//  CMemorize
//
//  Created by Carlos Alberto Vergara Marrugo on 1/02/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: CMemorizeDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(CMemorizeDocument()))
    }
}

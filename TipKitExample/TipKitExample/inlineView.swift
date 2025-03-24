//
//  inlineView.swift
//  TipKitExample
//
//  Created by sardar saqib on 21/03/2025.
//

import SwiftUI
import TipKit

struct InlineTip: Tip {
    var title: Text {
        Text("Blue Color")
            .foregroundStyle(.blue)
    }

    var message: Text? {
        Text("Blue color is the color of the sky and ocean. It symbolizes trust, wisdom, and tranquility. Many cultures associate blue with calmness and stability, making it one of the most popular colors worldwide.")
    }

    var image: Image? {
        Image(systemName: "pencil.and.scribble")
    }
}

struct InlineView: View {
    // Create an instance of your tip content.
    let inlineTip = InlineTip()
    let colors: [Color] = [Color.red, Color.green, Color.blue, Color.yellow, Color.orange]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("A TipView embeds itself directly in the view. Make this style of tip your first choice as it doesn't obscure or hide any underlying UI elements.")
               
                ForEach(colors.indices, id: \.self) { index in
                    Rectangle()
                        .fill(colors[index])
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 70)
                        .cornerRadius(5)
                    TipView(colors[index] == .blue ? InlineTip() : nil, arrowEdge: .bottom)
                    
                }
                
                Text("To dismiss the tip, tap the close button in the upper right-hand corner of the tip or tap the Favorite button to use the feature, which then invalidates the tip programmatically.")
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Inline tip view")
    }
}


//
//  popoverView.swift
//  TipKitExample
//
//  Created by sardar saqib on 21/03/2025.
//

import SwiftUI
import TipKit

struct PopoverTip: Tip {
    var progress: Double
       
       var title: Text {
           Text("Progress Update")
               .foregroundStyle(.indigo)
       }

       var message: Text? {
           Text("You have completed \(Int(progress * 100))% of your task.")
       }
}

struct PopoverView: View {
    // Create an instance of your tip content.
    let popoverTip = PopoverTip(progress: 0.0)
    private let progress = 0.7
   
    var body: some View {
        VStack(spacing: 20) {
            Text("Popover views display on top of UI elements. Use this tip view if you don’t want the layout of the screen to change, and are OK with underlying UI elements being obscured or hidden.")
           
            showProgressView()

            Spacer()
        }
        .padding()
        .navigationTitle("Popover tip view")
    }
    
    @ViewBuilder
    private func showProgressView() -> some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15)
                .opacity(0.1)
                .foregroundStyle(.blue)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .foregroundStyle(.blue)
                .rotationEffect(.degrees(-90))
            
            Text("\(Int(progress * 100))% completed")
                .popoverTip(PopoverTip(progress: progress))
               
        }
        .padding()
    }
}


//. popoverTip.invalidate(reason: .actionPerformed)

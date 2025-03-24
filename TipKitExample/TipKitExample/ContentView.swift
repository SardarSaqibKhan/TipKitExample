//
//  ContentView.swift
//  TipKitExample
//
//  Created by sardar saqib on 21/03/2025.
//

import SwiftUI
import TipKit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(TipTypes.allCases, id: \.self) { type in
                        NavigationLink(type.title) {
                            type.destination
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("Tip Types")
        }
    }
}

#Preview {
    ContentView()
}

enum TipTypes: CaseIterable, Hashable {
    
    case inline
    case popover
    case action
    
    var title : String {
        switch self {
        case .inline:
            "Inline Tipkit"
        case .popover:
            "Popover Tipkit"
        case .action:
            "Action Tipkit"
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .inline:
            InlineView()
        case .popover:
            PopoverView()
        case .action:
            PasswordResetView()
        }
    }
}


//
//  ContentView.swift
//  Elec_Test
//
//  Created by Jameel Shammr on 28/10/2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Test")
            CircularTimer(interval: 5, progress: 0)
                .frame(width: 200, height: 200)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

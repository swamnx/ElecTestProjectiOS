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
            CircularTimer(interval: 10, progress: 0.35)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

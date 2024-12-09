
//
//  CircularProgressBar.swift
//  iosApp
//
//  Created by Vitaly on 20220721.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

/**
 # ``CircularProgressBar`` is a circle shaped progress bar.
  ``progress``  progress value with a range from 0 to 1
  ``text``  text that displayed inside of the circle

 # Example of usage:
 ```swift
     CircularProgressBar(progress: $progress, text: $text)
 ```
 */

struct CircularProgressBar: View {

    @Binding var progress: CGFloat
    @Binding var text: String

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: Constants.strokeWidth)
                .foregroundColor(Constants.baseColor)
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: Constants.accentStrokeStyle)
                .foregroundColor(Constants.accentColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
            Text(text)
                .foregroundColor(Constants.textColor)
                .font(.custom("Metric-Light", size: 46))
                .monospacedDigit()
        }
        .frame(width: 234.0, height: 234.0)
    }

    //moved all possibly reusable stuff to View Constants
    private enum Constants {

        static var strokeWidth: CGFloat { 8 }
        static var baseColor: Color { Color(hex: 0xFF323333) }
        static var accentColor: Color { Color(hex: 0xFFe1ad01) }
        static var textColor: Color { Color(hex: 0xFF011e41) }
        static var accentStrokeStyle: StrokeStyle {
            StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round)
        }
    }
}

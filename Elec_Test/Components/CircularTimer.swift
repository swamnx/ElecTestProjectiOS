//
//  CustomCircularProgressBar.swift
//  iosApp
//
//  Created by Mohamed Alwakil on 20220926.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import Foundation
import Combine
/**
 # ``CircularTimer`` is a circle shaped progress bar.
  ``Time``  the Total time in hours, minutes, seconds
  ``progress``  progress percentage 0.0 to 1.0 ex. 0.3 mean 70% of time will load.

 # Example of usage:
 ```swift

 progress start from 0.0 and finish 1.0

 CustomCircularProgressBar(
 time: CustomCircularProgressBar.Time(hours: 0, minutes: 1, seconds: 0),
 progress: 0.0
 )
 } ```
 */

struct CircularTimer: View {

    @StateObject
    private var viewModel: CircularTimerViewModel

    init(time: Time, progress: CGFloat) {
        self.init(interval: time.interval, progress: progress)
    }

    init(interval: TimeInterval, progress: CGFloat) {
        self._viewModel = StateObject(
            wrappedValue: CircularTimerViewModel(interval: interval, progress: progress)
        )
    }

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: Constants.defaultElementsSpacing) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: Constants.strokeWidth)
                        .foregroundColor(Constants.baseColor)
                    Circle()
                        .trim(from: 0, to: min(1.0,  viewModel.progress))
                        .stroke(style: Constants.baseStrokeStyle)
                        .foregroundColor(Constants.baseColor)
                    Circle()
                        .trim(from: 0, to: min(min(1.0,  viewModel.progress), 0.001))
                        .stroke(style: Constants.accentStrokeStyle)
                        .foregroundColor(Constants.accentColor)
                }
                .frame(width: proxy.size.width * 0.7, alignment: .center)
                .rotationEffect(.degrees(90))
                .animation(.spring, value: viewModel.progress)
                .overlay(
                    Text(viewModel.textFromTimeInterval)
                    .monospacedDigit()
                )

                Spacer()

                CircularProgressBar(
                    progress: $viewModel.progress,
                    text: $viewModel.textFromTimeInterval
                )

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    //moved it here because it is not related to CircularTimerViewModel, only to CircularTimerView
    struct Time {

        let hours: Int
        let minutes: Int
        let seconds: Int

        var interval: TimeInterval {
            TimeInterval((hours * 60 * 60) + (minutes * 60) + seconds)
        }
    }

    //moved all possibly reusable stuff to View Constants
    private enum Constants {

        static var defaultElementsSpacing: CGFloat { 16 }
        static var strokeWidth: CGFloat { 8 }
        static var baseColor: Color { Color(hex: 0xFF323333) }
        static var accentColor: Color { Color(hex: 0xFF4f758b) }
        static var baseStrokeStyle: StrokeStyle {
            StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round)
        }
        static var accentStrokeStyle: StrokeStyle {
            StrokeStyle(lineWidth: strokeWidth, lineCap: .square, lineJoin: .round)
        }
    }

}

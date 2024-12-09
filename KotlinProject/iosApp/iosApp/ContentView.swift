import UIKit
import SwiftUI
import ComposeApp


struct ComposeView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {

        MainViewControllerKt.MainViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ContentView: View {

    let service =  TimerCounterLanguageService()

    var body: some View {
        ComposeView()
        .ignoresSafeArea(.keyboard)// Compose has own keyboard handler
        .onAppear {
            Task {
                let hoursStr = try await service.getMinutesStr(minutes: 2)
                print(hoursStr)
            }
        }
    }
}




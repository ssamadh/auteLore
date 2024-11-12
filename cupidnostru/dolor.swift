import SwiftUI

struct EllipticalGradientView: View {
    var body: some View {
        EllipticalGradient(
            colors: [
                Color.red,
                Color.blue,
                Color.green
            ],
            center: .center,
            startRadiusFraction: 0.1,
            endRadiusFraction: 0.9
        )
        .frame(width: 300, height: 300)
    }
}

struct EllipticalGradient: View {
    let colors: [Color]
    let center: UnitPoint
    let startRadiusFraction: CGFloat
    let endRadiusFraction: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let startRadius = min(width, height) * startRadiusFraction
            let endRadius = min(width, height) * endRadiusFraction
            
            RadialGradient(
                gradient: Gradient(colors: colors),
                center: center,
                startRadius: startRadius,
                endRadius: endRadius
            )
            .scaleEffect(x: width / height, y: 1, anchor: center)
        }
    }
}

struct ContentView: View {
    var body: some View {
        EllipticalGradientView()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

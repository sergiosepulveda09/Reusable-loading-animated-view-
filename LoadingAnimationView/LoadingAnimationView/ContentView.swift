
import SwiftUI

struct ContentView: View {
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            Color(.red)
                .ignoresSafeArea()
            Text("Example Screen")
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .padding()
            if isLoading {
                LoadingView()
                
            }
        }
        .onAppear{ startFakeNetworkCall() }
    }
    
    
    func startFakeNetworkCall(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(3)
        }
    }
}

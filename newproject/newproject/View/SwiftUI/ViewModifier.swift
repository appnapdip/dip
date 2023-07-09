//
//  ViewModifier.swift
//  newproject
//
//  Created by New User on 7/9/23.
//

import SwiftUI

struct defaultViewModiFer:ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.headline)
        .foregroundColor(.white)
        .frame(height:50)
        .frame(maxWidth:.infinity)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

extension View {
    func defaultView ()-> some View {
        modifier(defaultViewModiFer())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .defaultView()
               
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

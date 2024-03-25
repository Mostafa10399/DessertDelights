//
//  LoaderView.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        Color.white
            .edgesIgnoringSafeArea(.all)
            .overlay {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(1.74)
                    .frame(width: 150, height: 150)
                    .tint(.white)
                    .background(Color(.black12).opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
    }
}

struct LoaderDisplay: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
            LoaderView()
        }
    }
}

extension View {
    func displayLoader(isLoading: Bool) -> some View {
        self.if(isLoading) { view in
            view
                .modifier(LoaderDisplay())
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}

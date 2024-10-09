//
//  ErrorMessageView.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 26/03/2024.
//

import SwiftUI
import Commons
import enum NetworkLayer.APIError

struct ErrorMessageView: View {
    var imageName: String
    var title: String
    var message: String
    var isFullScreen: Bool
    var onTapAction: () -> Void
        
    var body: some View {
        VStack(spacing: 20) {
                Image(systemName: imageName)
                    .resizable()
                    .foregroundStyle(.black12)
                    .frame(width: 100, height: 100)
                    .padding(12)
                VStack(alignment: .center, spacing: 10) {
                    Text(title)
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundStyle(.black12)
                    
                    Text(message)
                        .font(.custom("Poppins-Regular", size: 16))
                        .foregroundStyle(.black12)
                }
            Button {
                onTapAction()
            } label: {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Try Again")
                        .font(.custom("Poppins-Medium", size: 20))
                        .foregroundStyle(.white)
                        .padding(.vertical, 16)
                    Spacer()
                }
            }
            .background(Color(.accent))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 14)
        .if(!isFullScreen) { view in
            view
                .padding(.top, 40)
                .padding(.bottom, 18)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.white))
                )
                .padding(.horizontal, 18)
                .frame(maxHeight: .infinity)
                .background(
                    Color.black.opacity(0.2)
                )
        }.if(isFullScreen) { view in
            view
                .frame(maxHeight: .infinity)
        }
        .background(isFullScreen ? Color.white : Color.black.opacity(0.8))
    }
}

struct ErrorDisplay: ViewModifier {
    var imageName: String
    var title: String
    var message: String
    var isFullScreen: Bool
    var onTapAction: () -> Void
    
    func body(content: Content) -> some View {
        ZStack {
            content
            ErrorMessageView(imageName: imageName, title: title, message: message, isFullScreen: isFullScreen, onTapAction: onTapAction)
        }
    }
}

extension View {
    func displayError(errorMessage: APIError?,
                      isFullScreen: Bool = true,
                      onTapAction: @escaping () -> Void) -> some View {
        self
            .if(errorMessage != nil) { view in
            view
                .modifier(
                    ErrorDisplay(
                        imageName: "exclamationmark.bubble.fill",
                        title: "",
                        message: errorMessage!.localizedDescription,
                        isFullScreen: isFullScreen,
                        onTapAction: onTapAction)
                )
            
        }
    }
}

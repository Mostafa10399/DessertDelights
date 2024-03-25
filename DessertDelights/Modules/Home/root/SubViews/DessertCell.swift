//
//  DessertCell.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 23/03/2024.
//

import SwiftUI

struct DessertCell: View {
    
    // MARK: - Properties
    
    let width: CGFloat
    let dessert: DessertPresentable
    
    // MARK: - CodeView
    
    var body: some View {
        AsyncImage(url: dessert.dessertImage, transaction: .init(animation: .bouncy(duration: 1)), content: { p in
            switch p {
            case .empty:
                 ZStack {
                     Color.gray.opacity(0.4)
                     ProgressView()
                 }
            case .success(let image):
                image
                    .resizable()
            case .failure(_):
                Image(.launhBackground)
                    .resizable()
            @unknown default:
                EmptyView()
            }
        })
        .frame(width: width, height: 200)
        .overlay {
            VStack(alignment: .leading) {
                Spacer()
                Text(dessert.dessertName)
                    .foregroundStyle(.white)
                    .font(.custom("Poppins-Bold", size: 16))
                    .padding([.bottom, .leading], 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
            }

        }
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .background{
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
                .shadow(
                    color: .black.opacity(0.1), radius: 2, x: 0, y: 3)
        }
    }
}

#Preview {
    DessertCell(width: 200, dessert: DessertPresentable(meal: Meal(id: "123", mealName: "apple pie", mealImage: "https://www.themealdb.com/images/media/meals/6ut2og1619790195.jpg")))
}

//
//  CustomWebImage.swift
//  
//
//  Created by Mostafa Mahmoud on 09/10/2024.
//

import SwiftUI
import Kingfisher

public struct CustomWebImage<Placeholder: View>: View {
    
    @State var size: CGSize = .zero
    let image: URL?
    let cancelOnDisappear: Bool
    let process: Bool
    let placeholder: (() -> Placeholder)

                
    public init(url image: URL?,
                fixedSize: CGSize = .zero,
                cancelOnDisappear: Bool = false,
                process: Bool = false,
                @ViewBuilder placeholder: @escaping (() -> Placeholder)
    ) {
        self.size = fixedSize
        self.image = image
        self.cancelOnDisappear = cancelOnDisappear
        self.process = process
        self.placeholder = placeholder
    }
    
    public var body: some View {
        GeometryReader { proxy in
            KFImage(image)
                .resizable()
                .fade(duration: 0.25)
                .cancelOnDisappear(cancelOnDisappear)
                .placeholder(placeholder)
                .act(process: size.height > 200 ? process : true, refSize: CGSize(width: size.width + 200, height: size.height + 200))
                .processingQueue(.mainAsync)
                .cacheOriginalImage()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .onAppear {
                    size = proxy.size
                }
        }
    }
}


extension KFImage {
    func act(process: Bool, refSize: CGSize) -> Self {
        return process ? self.setProcessor(ResizingImageProcessor(referenceSize: refSize, mode: .aspectFit)) : self
    }
}

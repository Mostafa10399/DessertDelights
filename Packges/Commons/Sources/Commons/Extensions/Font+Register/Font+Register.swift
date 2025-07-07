//
//  GetBundle.swift
//  Commons
//
//  Created by Mostafa on 7/2/25.
//


import UIKit
import CoreGraphics

// MARK: - Marker class to get correct bundle
final class GetBundle {}

public enum FontError: Swift.Error {
    case failedToRegisterFont(name: String)
}

public final class FontRegisterDelegate {

    public static let shared = FontRegisterDelegate()

    private init() {}

    private let fonts = [
        "Poppins-Bold",
        "Poppins-Regular",
        "Poppins-Medium",
        "Poppins-SemiBold",
        "Poppins-ExtraLight"
    ]

    public func registerFonts() {
        fonts.forEach { fontName in
            do {
                try registerFont(named: fontName)
                print("Registered font: \(fontName)")
            } catch {
                print("Failed to register font: \(fontName). \(error)")
            }
        }
    }


    func registerFont(named name: String) throws {
       guard let asset = NSDataAsset(name: "Fonts/\(name)", bundle: Bundle.module),
          let provider = CGDataProvider(data: asset.data as NSData),
          let font = CGFont(provider),
          CTFontManagerRegisterGraphicsFont(font, nil) else {
           throw FontError.failedToRegisterFont(name: name)
       }
    }
}


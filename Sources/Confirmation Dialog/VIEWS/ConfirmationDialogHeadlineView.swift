//
//  ConfirmationDialogHeadlineView.swift
//  confirmation-dialog-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

public struct ConfirmationDialogHeadlineView: View {
    // MARK: - PROPERTIES
    let text: String
    let textOnly: Bool
    let imageURL: URL?
    let placeholderSystemImageName: String?
    
    let imageSize: CGFloat = 40 // Standard Size for better UI/UX
    var frameHeight: CGFloat { imageSize + 2 }
    var alignment: HorizontalAlignment { textOnly ? .center : .leading }
    
    // MARK: - INITIALIZER
    public init(
        text: String,
        textOnly: Bool = true,
        imageURL: URL? = nil,
        placeholderSystemImageName: String? = nil
    ) {
        self.text = text
        self.textOnly = textOnly
        self.imageURL = imageURL
        self.placeholderSystemImageName = placeholderSystemImageName
    }
    
    // MARK: - BODY
    public var body: some View {
        HStack(spacing: 12) {
            image
            hText
        }
        .frame(height: frameHeight)
        .frame(maxWidth: .infinity, alignment: .init(horizontal: alignment, vertical: .center))
        .actionSheetContentPadding(alignment)
    }
}

// MARK: - PREVIEWS
#Preview("ConfirmationDialogHeadlineView - text only") {
    ConfirmationDialogHeadlineView(text: "Clear all messages from \"John Doe\"")
}

#Preview("ConfirmationDialogHeadlineView") {
    ConfirmationDialogHeadlineView(
        text: "Clear all messages from \"John Doe\"",
        textOnly: false,
        imageURL: .init(string: "https://picsum.photos/100"),
        placeholderSystemImageName: "person.circle.fill"
    )
}

#Preview("ConfirmationDialogHeadlineView - no image") {
    ConfirmationDialogHeadlineView(
        text: "Clear all messages from \"John Doe\"",
        textOnly: false,
        placeholderSystemImageName: "person.circle.fill"
    )
}

// MARK: - EXTENSIONS
extension ConfirmationDialogHeadlineView {
    // MARK: - image
    @ViewBuilder
    private var image: some View {
        if !textOnly {
            ConfirmationDialogImageView(
                placeholderSystemImageName: placeholderSystemImageName,
                imageSize: imageSize,
                imageURL: imageURL
            )
        }
    }
    
    // MARK: - text
    private var hText: some View {
        Text(text)
            .font(.headline)
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(alignment == .center ? .center : .leading)
    }
}

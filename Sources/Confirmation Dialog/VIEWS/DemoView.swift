//
//  DemoView.swift
//  confirmation-dialog-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

public struct DemoView: View {
    // MARK: - PROPERTIES
    @State private var isPresented: Bool = true
    
    let buttonsArray: [ConfirmationDialogButtonModel] = [
        .init(text: "Send a gift", systemImageName: "gift") { },
        .init(text: "Contact Info", systemImageName: "info.circle") { },
        .init(text: "Add to trusted people", systemImageName: "person.badge.shield.checkmark") { },
        .init(text: "Recommend to a friend", systemImageName: "person.line.dotted.person") { },
        .init(text: "Lock conversation", systemImageName: "lock") { },
        .init(text: "Clear conversation", systemImageName: "xmark.circle") { }
    ]
    
    var destructiveButtonsArray: [ConfirmationDialogButtonModel] { [
        .init(text: "Block John Doe", systemImageName: "hand.raised", role: .destructive) { },
        .init(text: "Delete Conversation", systemImageName: "trash", role: .destructive) { }
    ]}
    
    // MARK: - INITIALIZER
    public init() { }
    
    // MARK: - BODY
    public var body: some View {
        Button("Show Action Sheet") { isPresented.toggle() }
            .sheet(isPresented: $isPresented) {
                ConfirmationDialogView {
                    ConfirmationDialogHeadlineView(
                        text: "John Doe",
                        textOnly: false,
                        imageURL: .init(string: "https://picsum.photos/100"),
                        placeholderSystemImageName: "person.circle.fill"
                    )
                    
                    ConformationDialogSubHeadlineView("Blocked contacts will no longer be able to call you or send you messages.\n\nIf you block and report this contact, the last 5 messages will be forwarded to WhatsApp and your chat with this contact will be deleted from this device only.")
                    
                    ConfirmationDialogButtonsView { buttonsArray }
                    
                    ConfirmationDialogButtonsView { destructiveButtonsArray }
                } dismissAction: { isPresented = false }
            }
    }
}

// MARK: - PREVIEWS
#Preview("DemoView") { DemoView() }

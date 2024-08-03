//
//  ConfirmationDialogButtonsView.swift
//  confirmation-dialog-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

public struct ConfirmationDialogButtonsView: View {
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) private var colorScheme
    
    let buttonsArray: [ConfirmationDialogButtonModel]
    
    // MARK: - INITIALIZER
    public init(_ buttonsArray: () -> [ConfirmationDialogButtonModel]) {
        self.buttonsArray = buttonsArray()
    }
    
    // MARK: - BODY
    public var body: some View {
        VStack(spacing: 0) {
            ForEach(buttonsArray) {
                button($0)
            }
        }
        .clipShape(.rect(cornerRadius: 10))
    }
}

// MARK: - PREVIEWS
#Preview("ConfirmationDialogButtonsView") {
    let buttonsArray: [ConfirmationDialogButtonModel] = [
        .init(
            text: "Mute",
            systemImageName: "bell.slash") {
                print("Mute action is working...")
            },
        .init(
            text: "Delete",
            systemImageName: "trash",
            role: .destructive) {
                print("Delete action is working...")
            },
    ]
    
    return ConfirmationDialogButtonsView { buttonsArray }.preview
}

#Preview("DemoView") { DemoView() }

// MARK: - EXTENSION
extension ConfirmationDialogButtonsView {
    // MARK: - button
    private func button(_ button: ConfirmationDialogButtonModel) -> some View {
        Button(role: button.role) {
            button.action()
        } label: {
            HStack {
                Text(button.text)
                Spacer()
                Image(systemName: button.systemImageName)
                    .font(.title2)
            }
            .foregroundStyle(button.role == .destructive ? .red : .primary)
            .padding()
        }
        .actionSheetButtonStyle
        .overlay(alignment: .bottom) {
            if button.id != buttonsArray.last?.id {
                Divider().padding(.leading)
            }
        }
    }
}

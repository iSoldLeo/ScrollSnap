import SwiftUI

struct PermissionRequestView: View {
    var localization: Localization = .shared
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "camera.fill")
                .font(.system(size: 64))
                .foregroundColor(.blue)
            
            Text(localization.permissionTitle)
                .font(.title2)
                .bold()
            
            Text(localization.permissionBody)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity)
            
            Text(localization.permissionInstruction)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity)
            
            Button(localization.quitActionTitle) {
                NSApplication.shared.terminate(nil)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .frame(width: 450)
        .padding(40)
    }
}

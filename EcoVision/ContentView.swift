//
//  ContentView.swift.swift
//  EcoVision
//
//  Created by Abhishek on 12/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.green)

                Text("EcoVision")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Scan waste and learn its environmental impact")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)

                NavigationLink {
                    CameraView()
                } label: {
                    Text("Scan Waste")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

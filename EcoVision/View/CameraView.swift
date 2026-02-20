import SwiftUI
import PhotosUI

struct CameraView: View {

    @StateObject private var vm = CameraViewModel()

    @State private var selectedItem: PhotosPickerItem?
    @State private var showScanCamera = false
    @State private var showLiveCamera = false

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss

    var body: some View {

        ZStack {

            // MARK: Eco Premium Background (Same as ContentView)
            ZStack {

                LinearGradient(
                    colors: colorScheme == .dark
                    ? [
                        Color.black,
                        Color(red: 0.04, green: 0.08, blue: 0.15)
                    ]
                    : [
                        Color(red: 0.93, green: 0.96, blue: 0.95),
                        Color(red: 0.82, green: 0.88, blue: 0.85)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                RadialGradient(
                    colors: [
                        Color.green.opacity(colorScheme == .dark ? 0.30 : 0.18),
                        Color.clear
                    ],
                    center: .topTrailing,
                    startRadius: 50,
                    endRadius: 600
                )
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {

                // MARK: Header
                HStack {

                    Button {
                        dismiss()
                    } label: {

                        ZStack {
                            Circle()
                                .fill(
                                    colorScheme == .dark ?
                                    Color.white.opacity(0.1) :
                                    Color.white.opacity(0.6)
                                )
                                .frame(width: 44, height: 44)

                            Image(systemName: "chevron.left")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(
                                    colorScheme == .dark ? .white : .black
                                )
                        }
                    }

                    Spacer()

                    Text("ECOVISION")
                        .font(.system(size: 18, weight: .semibold))
                        .kerning(4)
                        .foregroundColor(
                            colorScheme == .dark ?
                            Color.white.opacity(0.9) :
                            Color.black.opacity(0.7)
                        )

                    Spacer()

                    Circle()
                        .fill(Color.clear)
                        .frame(width: 44, height: 44)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)

                Spacer().frame(height: 40)

                // MARK: Cards
                VStack(spacing: 24) {

                    PhotosPicker(selection: $selectedItem, matching: .images) {

                        FeatureCard(
                            title: "Pick Image",
                            subtitle: "Upload from gallery",
                            icon: "photo"
                        )
                    }
                    .onChange(of: selectedItem) { newItem in

                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self),
                               let image = UIImage(data: data) {
                                vm.classifyImage(image)
                            }
                        }
                    }

                    Button {
                        showScanCamera = true
                    } label: {

                        FeatureCard(
                            title: "Scan Image",
                            subtitle: "Capture trash directly",
                            icon: "viewfinder"
                        )
                    }

                    Button {
                        showLiveCamera = true
                    } label: {

                        FeatureCard(
                            title: "Live Detection",
                            subtitle: "Real-time analysis",
                            icon: "camera.viewfinder"
                        )
                    }
                }

                Spacer()

                NavigationLink(
                    destination: ResultView(result: vm.result),
                    isActive: $vm.isShowingResult
                ) {
                    EmptyView()
                }
            }
        }
        .navigationBarHidden(true)

        .sheet(isPresented: $showScanCamera) {

            CameraCaptureView { image in
                vm.classifyImage(image)
            }
        }

        .sheet(isPresented: $showLiveCamera) {

            ZStack {

                LiveCameraView(viewModel: vm)

                VStack {

                    Spacer()

                    if let result = vm.result {

                        Text("\(result.label) \(Int(result.confidence * 100))%")
                            .font(.title3)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(
                                colorScheme == .dark ?
                                Color.black.opacity(0.75) :
                                Color.white.opacity(0.85)
                            )
                            .foregroundColor(
                                colorScheme == .dark ? .white : .black
                            )
                            .cornerRadius(20)
                            .padding(.bottom, 40)
                    }
                }
            }
        }
    }
}


# 🌱 EcoVision — AI-Powered Waste Classification (Core ML + SwiftUI)

EcoVision is an **on-device AI iOS application** that uses **Core ML and Vision** to classify different types of waste through the device camera and provides **eco-friendly disposal suggestions**.
The goal of this project is to promote **sustainable waste management** by making environmental awareness simple, visual, and interactive.

This project is built as a **Swift Playground / iOS app**, designed with **WWDC Student Challenge** principles in mind: learning, responsibility, and real-world impact.

---

## 🚀 Features

* 📷 **Real-time camera-based waste classification**
* 🤖 **Custom-trained Core ML image classifier**
* ♻️ **Supports 8 waste categories**
* 📊 **Confidence-based predictions**
* 🌍 **Environmental footprint & sustainability suggestions**
* 🔐 **100% on-device inference (privacy-friendly)**
* 🎨 **Clean SwiftUI architecture (MVVM)**

---

## 🧠 Supported Waste Categories

The current model classifies the following waste types:

* Plastic
* Paper
* Glass
* Metallic Materials
* Organic / Vegetable Waste
* Food Scraps
* Textile
* Electronic Waste (E-Waste)

---

## 🧪 Machine Learning Details

* **Model Type:** Image Classifier (Core ML)
* **Training Tool:** Create ML
* **Feature Extractor:** Image Feature Print v1
* **Input Size:** 299 × 299 RGB images
* **Inference:** Vision + Core ML (`VNCoreMLRequest`)
* **Execution:** Fully on-device (no internet required)

### 📈 Model Performance

| Metric              | Value |
| ------------------- | ----- |
| Training Accuracy   | ~99%  |
| Validation Accuracy | ~92%  |
| Testing Accuracy    | ~88%  |
| Classes             | 8     |
| Total Images        | 416   |

> Accuracy drops were expected when scaling from 4 → 8 classes, reflecting realistic real-world conditions.

---

## 📂 Dataset

The dataset was sourced and curated from **Kaggle**, then structured into:

```
dataset/
 ├── train/
 ├── val/
 └── test/
     ├── Plastic/
     ├── Paper/
     ├── Glass/
     ├── Metallic_Materials/
     ├── Organic_Vegetation_Waste/
     ├── Food_Scraps/
     ├── Textile/
     └── Electronic_Waste/
```

Additional preprocessing and class balancing were performed before training.

---

## 🏗️ Project Architecture (MVVM)

```
EcoVision/
 ├── MLFile/
 │   └── EcoVisionWasteClassifier.mlmodel
 ├── Service/
 │   └── WasteClassifierService.swift
 ├── ViewModel/
 │   └── CameraViewModel.swift
 ├── View/
 │   ├── CameraView.swift
 │   └── ResultView.swift
 ├── Model/
 │   ├── DetectionResult.swift
 │   └── Items.swift
 ├── Utilities/
 │   └── UIImage+PixelBuffer.swift
 ├── ContentView.swift
 └── MyApp.swift
```

---

## 🔍 How It Works

1. The camera captures a frame
2. Image is converted to a `CVPixelBuffer`
3. Core ML model predicts the waste type
4. The highest-confidence result is selected
5. Environmental impact & suggestions are shown to the user

---

## 🧩 Key Files Explained

### `WasteClassifierService.swift`

* Loads the Core ML model
* Handles Vision requests
* Returns label + confidence

### `CameraViewModel.swift`

* Connects camera input to ML service
* Publishes classification results

### `Items.swift`

* Maps waste labels to:

  * Carbon footprint
  * Eco-friendly alternatives
  * Sustainability tips

---

## 🌱 Why This Project Matters

Waste segregation is one of the **simplest but most ignored steps** toward sustainability.
EcoVision demonstrates how **on-device machine learning** can:

* Educate users
* Encourage responsible disposal
* Reduce environmental impact
* Protect user privacy

---

## 🎯 WWDC Student Challenge Focus

This project emphasizes:

* Learning Core ML fundamentals
* Ethical AI (on-device, no data collection)
* Practical real-world application
* Incremental improvement and experimentation
* Clear understanding over raw performance

---

## 🔮 Future Improvements

* 📈 Increase dataset size for difficult classes (metal vs glass)
* 🎥 Live camera preview with bounding boxes
* 📊 Confidence-threshold based feedback
* 🌐 Educational statistics per waste category
* ♻️ Recycling center recommendations (offline)

---

## 🧑‍💻 Author

**Abhishek Singh**
Computer Science Engineering Student
iOS | Core ML | SwiftUI | Sustainability Enthusiast

---

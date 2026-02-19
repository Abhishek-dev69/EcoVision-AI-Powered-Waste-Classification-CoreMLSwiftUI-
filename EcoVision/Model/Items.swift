//
//  Items.swift
//  EcoVision
//
//  Upgraded for AI-powered eco intelligence
//

import Foundation

struct Items: Identifiable, Codable {

    let id = UUID()

    // CoreML label match
    let label: String

    // Display info
    let title: String
    let icon: String

    // Environmental data
    let carbonFootprint: Double   // in kg CO₂e
    let decompositionTime: String
    let recyclable: Bool

    // Guidance
    let disposalMethod: String
    let suggestion: String
    let impactExplanation: String

    // MARK: Static database

    static let all: [Items] = [

        Items(
            label: "Plastic",
            title: "Plastic Waste",
            icon: "waterbottle",
            carbonFootprint: 0.15,
            decompositionTime: "450 years",
            recyclable: true,
            disposalMethod: "Blue recycling bin",
            suggestion: "Use reusable bottles or cloth bags.",
            impactExplanation: "Plastic takes centuries to decompose and harms marine life."
        ),

        Items(
            label: "Paper",
            title: "Paper Waste",
            icon: "doc",
            carbonFootprint: 0.04,
            decompositionTime: "2–6 weeks",
            recyclable: true,
            disposalMethod: "Paper recycling bin",
            suggestion: "Switch to digital alternatives when possible.",
            impactExplanation: "Paper recycling saves trees and reduces landfill waste."
        ),

        Items(
            label: "Glass",
            title: "Glass Waste",
            icon: "wineglass",
            carbonFootprint: 0.17,
            decompositionTime: "1 million years",
            recyclable: true,
            disposalMethod: "Glass recycling bin",
            suggestion: "Reuse jars and containers.",
            impactExplanation: "Glass is 100% recyclable and can be reused endlessly."
        ),

        Items(
            label: "Metallic_Materials",
            title: "Metal Waste",
            icon: "cylinder",
            carbonFootprint: 1.5,
            decompositionTime: "50–500 years",
            recyclable: true,
            disposalMethod: "Metal recycling bin",
            suggestion: "Recycle cans and metal containers.",
            impactExplanation: "Recycling metal saves energy and natural resources."
        ),

        Items(
            label: "Organic_Vegetation_Waste",
            title: "Organic Waste",
            icon: "leaf",
            carbonFootprint: 0.02,
            decompositionTime: "2–8 weeks",
            recyclable: true,
            disposalMethod: "Compost bin",
            suggestion: "Compost food and plant waste.",
            impactExplanation: "Organic waste can enrich soil when composted."
        ),

        Items(
            label: "Food_Scraps",
            title: "Food Waste",
            icon: "fork.knife",
            carbonFootprint: 0.08,
            decompositionTime: "1–6 months",
            recyclable: true,
            disposalMethod: "Compost bin",
            suggestion: "Reduce food waste and compost leftovers.",
            impactExplanation: "Food waste releases methane in landfills."
        ),

        Items(
            label: "Electronic_Waste",
            title: "Electronic Waste",
            icon: "desktopcomputer",
            carbonFootprint: 1.2,
            decompositionTime: "Thousands of years",
            recyclable: false,
            disposalMethod: "Authorized e-waste center",
            suggestion: "Dispose at certified recycling facilities.",
            impactExplanation: "E-waste contains toxic materials harmful to environment."
        ),

        Items(
            label: "Textile",
            title: "Textile Waste",
            icon: "tshirt",
            carbonFootprint: 0.6,
            decompositionTime: "1–5 years",
            recyclable: true,
            disposalMethod: "Textile recycling or donation",
            suggestion: "Donate or reuse clothing.",
            impactExplanation: "Textile waste contributes heavily to landfill pollution."
        )
    ]

    // MARK: Lookup

    static func forLabel(_ label: String) -> Items? {

        all.first {
            $0.label.lowercased() == label.lowercased()
        }
    }
}


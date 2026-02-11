//
//  Items.swift
//  EcoVision
//
//  Created by Abhishek on 12/02/26.
//
import Foundation
struct Items {
    let label: String
    let title: String
    let footprint: String
    let suggestion: String

    static let all: [Items] = [

        Items(
            label: "Plastic",
            title: "Plastic Waste",
            footprint: "0.15 kg CO₂e",
            suggestion: "Use reusable bottles or bags"
        ),

        Items(
            label: "Paper",
            title: "Paper Waste",
            footprint: "0.04 kg CO₂e",
            suggestion: "Recycle paper or go digital"
        ),

        Items(
            label: "Glass",
            title: "Glass Waste",
            footprint: "0.17 kg CO₂e",
            suggestion: "Reuse glass jars or recycle properly"
        ),

        Items(
            label: "Metallic_Materials",
            title: "Metal Waste",
            footprint: "1.5 kg CO₂e",
            suggestion: "Recycle metal cans and utensils"
        ),

        Items(
            label: "Organic_Vegetation_Waste",
            title: "Organic Waste",
            footprint: "0.02 kg CO₂e",
            suggestion: "Compost food and plant waste"
        ),

        Items(
            label: "Food_Scraps",
            title: "Food Waste",
            footprint: "0.08 kg CO₂e",
            suggestion: "Reduce food waste or compost leftovers"
        ),

        Items(
            label: "Electronic_Waste",
            title: "E-Waste",
            footprint: "1.2 kg CO₂e",
            suggestion: "Dispose at authorized e-waste centers"
        ),

        Items(
            label: "Textile",
            title: "Textile Waste",
            footprint: "0.6 kg CO₂e",
            suggestion: "Donate or recycle clothes"
        )
    ]
    static func forLabel(_ label: String) -> Items? {
        all.first { $0.label == label }
    }
}

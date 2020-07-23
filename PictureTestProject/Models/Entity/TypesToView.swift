//
//  TypesToView.swift
//  PictureTestProject
//
//  Created by Admin on 7/22/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import Foundation

struct TypesToView: Codable {
    let data: [Datum]
    let view: [String]
}

// MARK: - Datum
struct Datum: Codable {

    let name: String
    let data: DataClass

}

// MARK: - DataClass
struct DataClass: Codable {

    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?

}

// MARK: - Variant
struct Variant: Codable {
    let id: Int
    let text: String
}

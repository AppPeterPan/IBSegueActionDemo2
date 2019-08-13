//
//  Movie.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2019/7/19.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import Foundation

enum Section {
    case song
}
struct Song: Hashable {
    var name: String
    var singer: String
    var lyrics: String
}

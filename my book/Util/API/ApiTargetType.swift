//
//  ApiTargetType.swift
//  my book
//
//  Created by 1mash0 on 2021/10/14.
//

import Foundation
import Moya

protocol ApiTargetType: TargetType {
    associatedtype Response: Codable
}

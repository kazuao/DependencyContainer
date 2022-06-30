//
//  Dependency.swift
//  DependencyContainer
//
//  Created by kazunori.aoki on 2022/05/30.
//

import Foundation

@propertyWrapper
final class Dependency<Component> {
    var wrappedValue: Component

    init() {
        self.wrappedValue = DependencyContainer.resolve(type: Component.self)
    }
}

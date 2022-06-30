//
//  DependencyContainer.swift
//  DependencyContainer
//
//  Created by kazunori.aoki on 2022/05/30.
//

import Foundation

/// DependencyContainer
final class DependencyContainer {

    // MARK: Singleton
    private static var shared = DependencyContainer()


    // MARK: Property
    private var dependencies: [String: AnyObject] = .init()


    // MARK: Public
    /// Register dependency
    ///
    /// - Parameter dependency:Instance of type to register
    public static func register<Component>(type: Component.Type, component: AnyObject) {
        shared.register(type: type, component: component)
    }

    /// Resolve dependency
    ///
    /// - Returns: Instance of the required type
    public static func resolve<Component>(type: Component.Type) -> Component {
        shared.resolve(type: type)
    }

    private func register<Component>(type: Component.Type, component: AnyObject) {
        let key = "\(type)"

        dependencies[key] = component
    }

    private func resolve<Component>(type: Component.Type) -> Component {
        let key = "\(type)"
        let dependency = dependencies[key] as? Component

        precondition(dependency != nil, "No dependency found for \(key), Dependency is already deallocated by the system.")

        return dependency!
    }
}

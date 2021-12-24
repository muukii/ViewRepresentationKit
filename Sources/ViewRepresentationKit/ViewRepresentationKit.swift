import UIKit

public struct ViewRepresentation {

  private var storage: [AnyKeyPath : Any] = [:]

  public init(
    from view: UIView
  ) {

    func store<T>(keyPath: KeyPath<UIView, T>) {
      let value = view[keyPath: keyPath]
      write(value: value, for: keyPath)
    }

    func store<T>(keyPath: KeyPath<UIView, T?>) {
      let value = view[keyPath: keyPath]
      write(value: value, for: keyPath)
    }

    store(keyPath: \.center)
    store(keyPath: \.bounds)
    store(keyPath: \.transform)
    store(keyPath: \.backgroundColor)
    store(keyPath: \.alpha)
    store(keyPath: \.isHidden)

  }

  public func restore(on view: UIView) {

    func restore<T>(keyPath: ReferenceWritableKeyPath<UIView, T>) {
      guard let value = read(for: keyPath) else {
        return
      }
      view[keyPath: keyPath] = value
    }

    func restore<T>(keyPath: ReferenceWritableKeyPath<UIView, T?>) {
      guard let value = read(for: keyPath) else {
        return
      }
      view[keyPath: keyPath] = value
    }

    restore(keyPath: \.center)
    restore(keyPath: \.bounds)
    restore(keyPath: \.transform)
    restore(keyPath: \.backgroundColor)
    restore(keyPath: \.alpha)
    restore(keyPath: \.isHidden)

  }

  public mutating func write<T>(value: T, for keyPath: KeyPath<UIView, T>) {
    storage[keyPath] = value
  }

  public mutating func write<T>(value: T, for keyPath: KeyPath<UIView, T?>) {
    storage[keyPath] = value
  }

  public func read<T>(for keyPath: KeyPath<UIView, T>) -> T? {
    storage[keyPath] as? T
  }

  public func read<T>(for keyPath: KeyPath<UIView, T?>) -> T?? {
    storage[keyPath] as? T
  }

}

public struct LayerRepresentation: Equatable {

}

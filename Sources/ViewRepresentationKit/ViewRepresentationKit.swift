import UIKit

@dynamicMemberLookup
public struct ViewRepresentation {

  struct Box<T> {


  }

  private var storage: [AnyKeyPath : Any?] = [:]

  public subscript <T>(dynamicMember keyPath: KeyPath<UIView, T>) -> T? {
    get {
      read(for: keyPath)
    }
  }

  public subscript <T>(dynamicMember keyPath: KeyPath<UIView, T?>) -> T? {
    get {
      read(for: keyPath)
    }
  }

  public init() {
    
  }

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

  public mutating func write<T>(value: T?, for keyPath: KeyPath<UIView, T?>) {
    storage[keyPath] = value
  }

  public func read<T>(for keyPath: KeyPath<UIView, T>) -> T? {
    guard let value = storage[keyPath] else {
      return nil
    }
    guard let value = value else {
      return nil
    }
    return value as? T
  }

  public func read<T>(for keyPath: KeyPath<UIView, T?>) -> T? {
    guard let value = storage[keyPath] else {
      return nil
    }

    return value as? T
  }

  public func compare(with view: UIView) {

    for (keyPath, value) in storage {
      let v = view[keyPath: keyPath]

    }

  }

}

public struct LayerRepresentation: Equatable {

}

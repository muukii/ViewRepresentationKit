import UIKit

public struct ViewRepresentation: Equatable {

  public var center: CGPoint
  public var bounds: CGRect
  public var transform: CGAffineTransform

  public var backgroundColor: UIColor?
  public var alpha: CGFloat
  public var isHidden: Bool

  public var contentHuggingPriorityForHorizontal: UILayoutPriority
  public var contentHuggingPriorityForVertical: UILayoutPriority

  public var frame: CGRect {
    return .init(
      origin: .init(x: center.x - bounds.width / 2, y: center.y - bounds.height / 2),
      size: bounds.size
    )
  }

  public init(
    from view: UIView
  ) {

    self.center = view.center
    self.bounds = view.bounds
    self.transform = view.transform

    self.backgroundColor = view.backgroundColor
    self.alpha = view.alpha
    self.isHidden = view.isHidden

    self.contentHuggingPriorityForHorizontal = view.contentHuggingPriority(for: .horizontal)
    self.contentHuggingPriorityForVertical = view.contentHuggingPriority(for: .vertical)

  }

  public func restore(on view: UIView) {

    view.center = self.center
    view.bounds = self.bounds
    view.transform = self.transform

    view.backgroundColor = self.backgroundColor
    view.alpha = self.alpha
    view.isHidden = self.isHidden

    view.setContentHuggingPriority(contentHuggingPriorityForHorizontal, for: .horizontal)
    view.setContentHuggingPriority(contentHuggingPriorityForVertical, for: .vertical)

  }

}

public struct LayerRepresentation: Equatable {

}

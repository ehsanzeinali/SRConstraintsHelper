//
//  SRConstraintHelper.swift
//  SRConstraintsHelper
//
//  Created by Siamak Rostami on 1/5/24.
//

import Foundation
import UIKit

// MARK: - ConstraintType

enum ConstraintType: String {
    case top
    case bottom
    case leading
    case trailing
    case centerX
    case centerY
    case height
    case width
    case left
    case right
}

// MARK: - SRConstraintBuilder

class SRConstraintBuilder {
    // MARK: Lifecycle

    private init() {}

    // MARK: Internal

    static let shared = SRConstraintBuilder()

    @discardableResult
    func addSubviewTo(containerView: UIView, view: UIView) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(view)
        return self
    }
    
    @discardableResult
    func addArrangedSubviewTo(containerStackView: UIStackView, view: UIView) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.addArrangedSubview(view)
        return self
    }

    @discardableResult
    func createConstraint(type: ConstraintType, item: Any, relatedBy: NSLayoutConstraint.Relation, toItem: Any?, attributeTo: NSLayoutConstraint.Attribute, multiplier: CGFloat, constant: CGFloat) -> Self {
        var constraint: NSLayoutConstraint?
        switch type {
        case .top:
            constraint = NSLayoutConstraint(item: item, attribute: .top, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        case .bottom:
            constraint = NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        case .leading:
            constraint = NSLayoutConstraint(item: item, attribute: .leading, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        case .trailing:
            constraint = NSLayoutConstraint(item: item, attribute: .trailing, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        case .centerX:
            constraint = NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        case .centerY:
            constraint = NSLayoutConstraint(item: item, attribute: .centerY, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        case .height:
            constraint = NSLayoutConstraint(item: item, attribute: .height, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        case .width:
            constraint = NSLayoutConstraint(item: item, attribute: .width, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        case .left:
            constraint = NSLayoutConstraint(item: item, attribute: .left, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        case .right:
            constraint = NSLayoutConstraint(item: item, attribute: .right, relatedBy: relatedBy, toItem: toItem, attribute: attributeTo, multiplier: multiplier, constant: constant)
            constraint?.identifier = type.rawValue
            constraint?.isActive = true
        }
        constraintsArray?.append(constraint ?? .init())
        return self
    }

    @discardableResult
    func updateConstraint(type: ConstraintType, view: UIView, constant: CGFloat) -> Self {
        guard let constraintIndex = view.constraints.firstIndex(where: { $0.identifier == type.rawValue }) else {
            return self
        }
        view.constraints[constraintIndex].constant = constant
        return self
    }

    // MARK: Private

    private var constraintsArray: [NSLayoutConstraint]?
}

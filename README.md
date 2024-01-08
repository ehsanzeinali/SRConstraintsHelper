# SRConstraintsHelper

## Overview

`SRConstraintsHelper` is a Swift utility for simplifying Auto Layout constraint creation and management. This helper provides a convenient way to build and update constraints programmatically, reducing boilerplate code and improving readability.

## Usage

### ConstraintType Enumeration

The `ConstraintType` enumeration defines various types of constraints that can be created using the helper. The available constraint types include:
- Top
- Bottom
- Leading
- Trailing
- CenterX
- CenterY
- Height
- Width
- Left
- Right

### SRConstraintBuilder Class

The `SRConstraintBuilder` class serves as the main utility for creating and managing constraints. It follows the singleton pattern, allowing a single instance to be shared across the application.

#### Initialization

To use the helper, obtain the shared instance:

```swift
let constraintBuilder = SRConstraintBuilder.shared
```
### Example

```swift
let constraintBuilder = SRConstraintBuilder.shared

// Add subview to container
constraintBuilder.addSubviewsTo(containerView: view, views: [imageView,descriptionLabel,button])

// Create and activate constraints
constraintBuilder.createConstraint(forItem: subview, withConstraintType: .top, relatedBy: .equal, toItem: mainView, withAttribute: .top, multiplier: 1, constant: 0)
constraintBuilder.createConstraint(forItem: subview, withConstraintType: .centerX, relatedBy: .equal, toItem: mainView, withAttribute: .centerX, multiplier: 1, constant: 0)

// Update constraint constant
constraintBuilder.updateConstraint(view: subview, withConstraintType: .centerX , constant: 10.0)
```

### StackView Example
```swift
let constraintBuilder = SRConstraintBuilder.shared

// Add Arranged Subview to stackView
constraintBuilder.addArrangedSubviewsTo(containerStackView: stackView, views: [subview1,subview2,...])

// Add subview to container
constraintBuilder.addSubviewTo(containerView: mainView, view: stackView)

// Create and activate constraints
constraintBuilder.createConstraint(forItem: subview, withConstraintType: .top, relatedBy: .equal, toItem: mainView, withAttribute: .top, multiplier: 1, constant: 0)
constraintBuilder.createConstraint(forItem: subview, withConstraintType: .centerX, relatedBy: .equal, toItem: mainView, withAttribute: .centerX, multiplier: 1, constant: 0)
```

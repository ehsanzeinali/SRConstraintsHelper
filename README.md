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
constraintBuilder.addSubviewTo(containerView: mainView, view: subview)

// Create and activate constraints
constraintBuilder.createConstraint(type: .centerX, item: subview, relatedBy: .equal, toItem: mainView, attributeTo: .centerX, multiplier: 1.0, constant: 0.0)
constraintBuilder.createConstraint(type: .centerY, item: subview, relatedBy: .equal, toItem: mainView, attributeTo: .centerY, multiplier: 1.0, constant: 0.0)

// Update constraint constant
constraintBuilder.updateConstraint(type: .centerX, view: subview, constant: 10.0)
```

### StackView Example
```swift
let constraintBuilder = SRConstraintBuilder.shared

// Add Arranged Subview to stackView
.addArrangedSubviewTo(containerStackView: stackView, view: titleLabel)
.addArrangedSubviewTo(containerStackView: stackView, view: imageView)

// Add subview to container
constraintBuilder.addSubviewTo(containerView: mainView, view: stackView)

// Create and activate constraints
.createConstraint(type: .top, item: stackView, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attributeTo: .top, multiplier: 1, constant: 16)
.createConstraint(type: .leading, item: stackView, relatedBy: .equal, toItem: view, attributeTo: .leading, multiplier: 1, constant: 10)
.createConstraint(type: .trailing, item: stackView, relatedBy: .equal, toItem: view, attributeTo: .trailing, multiplier: 1, constant: -10)
```

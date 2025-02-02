//
//  ViewController.swift
//  SRConstraintsHelper
//
//  Created by Siamak Rostami on 1/5/24.
//

import UIKit

// MARK: - ViewController

class ViewController: UIViewController {
    // MARK: Internal

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }

    // MARK: Private

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .newyork
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park. Broadway theater is staged in neon-lit Times Square."
        label.numberOfLines = 0
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemPink
        button.setTitle("Navigate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        let action = UIAction { [weak self] _ in
            let stackVC = StackViewController()
            self?.present(stackVC, animated: true, completion: nil)
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
}

extension ViewController {
    private func layoutView() {
        SRConstraintBuilder.shared
            .addSubviewsTo(containerView: view, views: [imageView,descriptionLabel,button])
            .createConstraint(forItem: imageView, withConstraintType: .top, relatedBy: .equal, toItem: view, withAttribute: .top, multiplier: 1, constant: 0)
            .createConstraint(forItem: imageView, withConstraintType: .centerX, relatedBy: .equal, toItem: view, withAttribute: .centerX, multiplier: 1, constant: 0)
            .createConstraint(forItem: imageView, withConstraintType: .width, relatedBy: .equal, toItem: view, withAttribute: .width, multiplier: 1, constant: 0)
            .createConstraint(forItem: imageView, withConstraintType: .height, relatedBy: .equal, toItem: imageView, withAttribute: .width, multiplier: 9 / 16, constant: 0)
            .createConstraint(forItem: descriptionLabel, withConstraintType: .top, relatedBy: .equal, toItem: imageView, withAttribute: .bottom, multiplier: 1, constant: 16)
            .createConstraint(forItem: descriptionLabel, withConstraintType: .centerX, relatedBy: .equal, toItem: view, withAttribute: .centerX, multiplier: 1, constant: 0)
            .createConstraint(forItem: descriptionLabel, withConstraintType: .width, relatedBy: .equal, toItem: view, withAttribute: .width, multiplier: 0.9, constant: 0)
            .createConstraint(forItem: button, withConstraintType: .centerX, relatedBy: .equal, toItem: view, withAttribute: .centerX, multiplier: 1, constant: 0)
            .createConstraint(forItem: button, withConstraintType: .width, relatedBy: .equal, toItem: view, withAttribute: .width, multiplier: 0.9, constant: 0)
            .createConstraint(forItem: button, withConstraintType: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, withAttribute: .bottom, multiplier: 1, constant: -16)
            .createConstraint(forItem: button, withConstraintType: .height, relatedBy: .equal, toItem: nil, withAttribute: .notAnAttribute, multiplier: 1, constant: 48)

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            SRConstraintBuilder.shared.updateConstraint(of: self.button, withConstraintType: .height , constant: 100)
        }
    }
}

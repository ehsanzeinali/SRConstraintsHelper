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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
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
        return button
    }()
}

extension ViewController {
    private func layoutView() {
        SRConstraintBuilder.shared
            .addSubviewTo(containerView: view, view: imageView)
            .addSubviewTo(containerView: view, view: titleLabel)
            .addSubviewTo(containerView: view, view: button)
            .createConstraint(type: .top, item: imageView, relatedBy: .equal, toItem: view, attributeTo: .top, multiplier: 1, constant: 0)
            .createConstraint(type: .centerX, item: imageView, relatedBy: .equal, toItem: view, attributeTo: .centerX, multiplier: 1, constant: 0)
            .createConstraint(type: .width, item: imageView, relatedBy: .equal, toItem: view, attributeTo: .width, multiplier: 1, constant: 0)
            .createConstraint(type: .height, item: imageView, relatedBy: .equal, toItem: imageView, attributeTo: .width, multiplier: 9 / 16, constant: 0)
            .createConstraint(type: .top, item: titleLabel, relatedBy: .equal, toItem: imageView, attributeTo: .bottom, multiplier: 1, constant: 16)
            .createConstraint(type: .centerX, item: titleLabel, relatedBy: .equal, toItem: view, attributeTo: .centerX, multiplier: 1, constant: 0)
            .createConstraint(type: .width, item: titleLabel, relatedBy: .equal, toItem: view, attributeTo: .width, multiplier: 0.9, constant: 0)
            .createConstraint(type: .centerX, item: button, relatedBy: .equal, toItem: view, attributeTo: .centerX, multiplier: 1, constant: 0)
            .createConstraint(type: .width, item: button, relatedBy: .equal, toItem: view, attributeTo: .width, multiplier: 0.9, constant: 0)
            .createConstraint(type: .bottom, item: button, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attributeTo: .bottom, multiplier: 1, constant: -16)
            .createConstraint(type: .height, item: button, relatedBy: .equal, toItem: nil, attributeTo: .notAnAttribute, multiplier: 1, constant: 48)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            SRConstraintBuilder.shared.updateConstraint(type: .height, view: self.button, constant: 100)
        }
    }
}

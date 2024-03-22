//
//  NiblessBottomSheetViewController.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import UIKit

open class NiblessBottomSheetViewController<T: UIView>: NiblessViewController {
    
    // MARK: - Properties
    
    let mainView: T
    private var viewTranslation = CGPoint(x: 0, y: 0)
    private lazy var dismissPanGesture: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(backGesture(_:)))
        return gesture
    }()
    public lazy var dismissTapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        return gesture
    }()

    // MARK: - Methods
    
    init(mainView: T) {
        self.mainView = mainView
        super.init()
        modalPresentationStyle = .overFullScreen
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(dismissPanGesture)
//        self.view.addGestureRecognizer(dismissTapGesture)
        self.view.addSubview(mainView)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        mainView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.lessThanOrEqualToSuperview().multipliedBy(0.9)
        }
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .clear
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseIn) {
            self.view.backgroundColor = R.color.black12()
        }
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.view.backgroundColor = .clear
    }

    @objc
    private func backGesture(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            if let currentYValue = sender.view?.frame.origin.y, currentYValue < 0 {
                if sender.direction != .up {
                    sender.state = .ended
                    break
                }
            } else {
                viewTranslation = sender.translation(in: view)
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.backgroundColor = .clear
                    self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                })
            }
        case .ended:
            if viewTranslation.y < (self.view.bounds.height / 2) {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                    self.view.backgroundColor = R.color.black12()
                })
            } else {
                UIView.animate(
                    withDuration: 0.5,
                    delay: 0,
                    usingSpringWithDamping: 0.7,
                    initialSpringVelocity: 1,
                    options: .curveEaseOut,
                    animations: {
                        self.view.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height + 50)
                    },
                    completion: { _ in
                        self.dismiss(animated: false, completion: nil)
                    }
                )
            }
        default:
            break
        }
    }
    
    @objc
    public func dismissViewController() {
        self.view.backgroundColor = .clear
        self.dismiss(animated: true)
    }

}

public enum Direction: Int {
    case up
    case down
    case left
    case right

    public var isX: Bool { return self == .left || self == .right }
    public var isY: Bool { return !isX }
}

public extension UIPanGestureRecognizer {
    var direction: Direction? {
        let velocity = velocity(in: view)
        let vertical = abs(velocity.y) > abs(velocity.x)
        switch (vertical, velocity.x, velocity.y) {
        case (true, _, let y) where y < 0: return .up
        case (true, _, let y) where y > 0: return .down
        case (false, let x, _) where x > 0: return .right
        case (false, let x, _) where x < 0: return .left
        default: return nil
        }
    }
}

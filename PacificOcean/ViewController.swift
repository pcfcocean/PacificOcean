//
//  ViewController.swift
//  PacificOcean
//
//  Created by Vlad Lesnichiy on 24.12.23.
//

import UIKit

class LifeCycleViewController: UIViewController {
    let lifeView = LifeCycleView()

    init() {
        print("1 init")
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("11 deinit")
    }

    override func loadView() {
        super.loadView()
        print("2 loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("3 viewDidLoad")
        addSubviews()
        makeConstraints()


        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print()
            self.lifeView.removeFromSuperview()
            self.lifeView.draw(CGRect(x: 10, y: 10, width: 20, height: 20))
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            print()
            self.addSubviews()
            self.makeConstraints()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            print()
            self.remakeConstraints()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            print()
            self.lifeView.frame = CGRect(x: 40, y: 40, width: 200, height: 200)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("4 viewWillAppear")
    }

    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print("5 viewIsAppearing")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("6 viewWillLayoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("7 viewDidLayoutSubviews")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("8 viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("9 viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("10 viewDidDisappear")
    }

    func addSubviews() {
        view.addSubview(lifeView)
    }

    func makeConstraints() {
        lifeView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lifeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lifeView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lifeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func remakeConstraints() {
        lifeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        lifeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lifeView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lifeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

class LifeCycleView: UIView {
    public init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        // Called when the view is about to be added or removed from its superview
        if newSuperview != nil {
            print("   1 willMove - View is being added to a superview")
        } else {
            print("   5 willMove - View is being removed from its superview")
        }
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        // Called when the view has been added or removed from its superview
        if superview != nil {
            print("   2 didMoveToSuperview - View has been added to a superview")
        } else {
            print("   7 didMoveToSuperview - View has been removed from its superview")
        }
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        // Called when the view has been added or removed from a window
        if window != nil {
            print("   3 didMoveToWindow - View has been added to a superview")
            // View has been added to a window
        } else {
            print("   6 didMoveToWindow - View has been removed from a window")
            // View has been removed from a window
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        print("   4 layoutSubviews")
        // Called when the view's bounds or constraints change
        // Perform layout-related tasks here, such as updating subview frames or constraints
    }

    override func removeFromSuperview() {
        // Perform cleanup tasks here
        // Remove any observers, release resources, etc.

        super.removeFromSuperview()
        print("   8 removeFromSuperview")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("draw", rect)
        // Called to draw the view's content
        // Perform custom drawing here using Core Graphics or other drawing APIs
    }
}

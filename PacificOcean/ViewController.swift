//
//  ViewController.swift
//  PacificOcean
//
//  Created by Vlad Lesnichiy on 24.12.23.
//

import UIKit

class LifeCycleViewController: UIViewController {
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
}


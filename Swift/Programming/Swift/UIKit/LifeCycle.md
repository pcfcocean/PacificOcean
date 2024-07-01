#  LifeCycle

Разбираем SceneDelegate и AppDelegate в iOS 13
https://habr.com/ru/companies/simbirsoft/articles/646687/

Жизненный цикл UIViewController
https://habr.com/ru/articles/654517/

Жизненный цикл UIViewController'a
https://habr.com/ru/articles/129557/

1 init
2 loadView
3 viewDidLoad
   1 willMove - View is being added to a superview
   2 didMoveToSuperview - View has been added to a superview
4 viewWillAppear
   3 didMoveToWindow - View has been added to a superview
5 viewIsAppearing
6 viewWillLayoutSubviews
7 viewDidLayoutSubviews
   4 layoutSubviews
8 viewDidAppear
9 viewWillDisappear
10 viewDidDisappear
11 deinit

            self.lifeView.removeFromSuperview()
            self.lifeView.draw(CGRect(x: 10, y: 10, width: 20, height: 20))

   5 willMove - View is being removed from its superview
   6 didMoveToWindow - View has been removed from a window
   7 didMoveToSuperview - View has been removed from its superview
   8 removeFromSuperview
draw (10.0, 10.0, 20.0, 20.0)
6 viewWillLayoutSubviews
7 viewDidLayoutSubviews

            self.addSubviews()
            self.makeConstraints()

   1 willMove - View is being added to a superview
   3 didMoveToWindow - View has been added to a superview
   2 didMoveToSuperview - View has been added to a superview
6 viewWillLayoutSubviews
7 viewDidLayoutSubviews

            self.remakeConstraints()

6 viewWillLayoutSubviews
7 viewDidLayoutSubviews

            self.lifeView.frame = CGRect(x: 40, y: 40, width: 200, height: 200)

6 viewWillLayoutSubviews
7 viewDidLayoutSubviews
   4 layoutSubviews

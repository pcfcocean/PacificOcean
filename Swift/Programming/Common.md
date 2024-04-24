#  Common

ASCII Table
https://bytetool.web.app/en/ascii/

Установка версии xCode по умолчанию
Примеры:
sudo xcode-select --switch /Applications/Xcode-14.1.0-Release.Candidate.2.app
sudo xcode-select --switch /Applications/Xcode-15.3.0.app


Как сделать примитвный замер времени выполнения опреаций
private var date: CFAbsoluteTime?
self.date = CFAbsoluteTimeGetCurrent()
print("---  time \((self.date ?? CFAbsoluteTimeGetCurrent()) - CFAbsoluteTimeGetCurrent())")

# GuessTheNumber

Оформил игровой процесс в двух режимах (против компьютера и два игрока против друг друга).

Для реализации интерфейса пользователя использованы стандартные элементы UIKit.

При проектировании приложения придерживался принципов -SOLID- по мере возможности их применения.

В проекте применен архетектурный паттерн MVP, так как приложение не нагружено моделями данных и для обработки существующих пользовательских данных 
достаточно одной сущности -Presenter-.

Планируется доработка приложения с применением стандартного фреймворка Aplle -CoreData- для сохранения результатов игры по желанию игрока, при этом 
для отображения таблицы результатов необходимо создать экран с использованием -TableView-, на который необходимо реализовать переход по нажатию на кнопку 
с начального экрана меню. 
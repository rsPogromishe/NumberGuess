# NumberGuess

Тестовое задание на должность iOS/macOS разработчика.

ОПИСАНИЕ

Приложение для iPhone, представляющее из себя мини игру.
Пользователь загадывает любое целочисленное число (от 1 до 100). Отгадывающий(компьютер) должен отгадать число, ориентируясь на подсказки загадывающего.
Загадывающий может отвечать только «больше», «меньше» или «равно».
Раунд заканчивается когда число было угадано, в процессе ведётся подсчёт попыток.
После отгадывания игроки меняются местами, и пользователь должен отгадать загаданное компьютером число.
Побеждает игрок, отгадавший число соперника за наименьше кол-во ходов.

Причины выбор архитектуры приложения MVVM:
1. Отсутствует тесная связь View и Model.
2. Распределение "обязанностей" отдельно для View и ViewModel.
3. Меньшая "громозкость" кода.
4. Простота использования.

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

<img src="https://user-images.githubusercontent.com/95295654/213435679-84ef6888-52fb-463a-ac7d-42b7b7963cc9.png" width=200px height=400px> <img src="https://user-images.githubusercontent.com/95295654/213435819-9e758af5-77ba-4209-a9a4-cd876016018c.png" width=200px height=400px> <img src="https://user-images.githubusercontent.com/95295654/213435853-446f938f-62cf-46fe-9135-09d3ccfff1f0.png" width=200px height=400px> <img src="https://user-images.githubusercontent.com/95295654/213435918-fa472ee2-dc69-4b64-8ec8-483ac2a9d420.png" width=200px height=400px>

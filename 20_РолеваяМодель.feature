﻿#language: ru
@tree


Функционал: 20. Проверка ролевой модели в Бюджетировании

	Как Администратор я хочу
	Проверить что ролевая модель в Бюджетировании
	работают корректно

Контекст:
	
	И я закрыл все окна клиентского приложения

Сценарий: 20.00 Определение типа приложения

	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ''
	Пусть Инициализация переменных

Сценарий: 20.01 Создание группы видов отчетов "ВА - Проверка настроек доступа (группа)"

	И Я создаю группу видов отчетов с именем "ВА - Проверка настроек доступа (группа)" и родителем "ВА - Группа отчетов"

Сценарий: 20.02 Создание вида отчета "ВА - Проверка настроек доступа (группа)"	

	* Создаем вид отчета
		И Я создаю вид отчета с именем "ВА - Проверка настроек доступа (нет)" и родителем "ВА - Проверка настроек доступа (группа)"	

	* Настраиваем вид отчета
		И Я открываю вид отчета с именем "ВА - Проверка настроек доступа (нет)"
		И я устанавливаю флаг с именем 'РазделениеПоПроектам'
		И я перехожу к закладке с именем 'АналитикиОтчета'
		И из выпадающего списка с именем 'ВидАналитики1' я выбираю по строке "Подразделения организаций"
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'
		Тогда открылось окно "Реструктуризация данных"
		И я нажимаю на кнопку с именем 'ФормаОК'
		И я нажимаю на кнопку с именем 'РедактироватьДерево'

	* Редактируем структуру отчета
		И Я в конструкторе отчета добавляю строку с именем "СтрокаОтчета"
		И Я в конструкторе отчета добавляю строку с именем "СтрокаОтчетаХ2"
		И Я в конструкторе отчета добавляю колонку с именем "Сумма"
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СДохРас" в ячейку 'R3C3'

	* Настраиваем формулы
		Когда открылось окно "Конструктор отчета"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Формулы расчета показателей"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Конструктор отчета"
		И я нажимаю на кнопку с именем 'ИтогПоСчету1'
		Тогда открылось окно "Источник данных (создание)"
		И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Проверка настроек доступа (нет)"
		И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
		Тогда открылось окно "Показатели отчетов"
		И я меняю значение переключателя с именем 'РежимВыбораПоказателя' на "Список показателей"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"       |
			| "СтрокаОтчета сумма" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Источник данных (создание) *"
		И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
		И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Фиксированное значение"
		И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
		И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
		И в таблице "ТаблицаСоответствия" я выбираю текущую строку
		И Я в списке "Статьи доходов и расходов" по полю "Наименование" ищу и выбираю элемент "Внедрение программных продуктов" "По точному совпадению"		
		Когда открылось окно "Источник данных (создание) *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
		Тогда открылось окно 'Конструктор отчета *'
		И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст '[ВАПроверкаНастроекДоступаНет_СТРКОтчета_Сумма] * 2'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Когда открылось окно 'Конструктор отчета'
		И Я закрываю окно 'Конструктор отчета'

	И Я Для вида отчета "ВА - Проверка настроек доступа (нет)" создаю бланк по умолчанию
	И Я для вида отчета "ВА - Проверка настроек доступа (нет)" создаю бланк сводной таблицы по умолчанию с отборами ''
	
Сценарий: 20.03 Копирование вида отчета "ВА - Проверка настроек доступа (да)"

	* Открываем список
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Виды и бланки отчетов"

	* Удаляем текущий элемент
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (да)"
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'СписокВидовОтчетов' количество строк 'больше' 0 Тогда
				* Ставим пометку на удаление
						И Я удаляю текущую строку в списке 'СписокВидовОтчетов'
								И я выбираю пункт контекстного меню с именем 'СписокВидовОтчетовКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'СписокВидовОтчетов'
								Тогда открылось окно "1С:Предприятие"
								Если элемент формы с именем 'Message' стал равен "Пометить * на удаление?" по шаблону Тогда
										И я нажимаю на кнопку с именем 'Button0'
								Иначе
										И я нажимаю на кнопку с именем 'Button1'
								И я жду доступности элемента с именем 'СписокВидовОтчетов' в течение 20 секунд
				* Перименовываем
						И Я запоминаю значение выражения '"Удалить_" + СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
						И в таблице 'СписокВидовОтчетов' я выбираю текущую строку
						Тогда открылось окно "* (Виды отчетов)"
						И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
						И в поле с именем 'ПолноеНаименование' я ввожу значение переменной 'УИД'
						И в поле с именем 'Код' я ввожу значение переменной 'УИД'
						И в поле с именем 'Родитель' я ввожу текст ''
						И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
						И я жду закрытия окна "* (Виды отчетов)" в течение 20 секунд

	* Ищем отчет для копирования
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст 'ВА - Проверка настроек доступа (нет)'
		И я нажимаю на кнопку с именем 'Find'
		Тогда в таблице 'СписокВидовОтчетов' количество строк "равно" 1
		Когда открылось окно "Виды и бланки отчетов"
		И я выбираю пункт контекстного меню с именем 'СписокВидовОтчетовКонтекстноеМенюСкопировать' на элементе формы с именем 'СписокВидовОтчетов'
		Тогда открылось окно "Копирование вида отчета"
		И я нажимаю на кнопку с именем 'ФормаОК'
		Когда открылось окно "Виды отчетов (создание)"
		И в поле с именем 'Наименование' я ввожу текст "ВА - Проверка настроек доступа (да)"
		И в поле с именем 'ПолноеНаименование' я ввожу текст "ВА - Проверка настроек доступа (да)"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Виды отчетов (создание) *" в течение 20 секунд

	* Добавляем аналитику
		// ДОДЕЛАТЬ: Группы раскрытия должны корректно копироваться вместе с видом отчета
		И Я открываю контруктор отчета с именем "ВА - Проверка настроек доступа (да)"
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СДохРас" в ячейку 'R3C3'
		Когда открылось окно "Конструктор отчета"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Формулы расчета показателей"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
		Тогда открылось окно "Источники данных"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем 'Список'
		Тогда открылось окно "ВА - Проверка настроек доступа (нет)_СтрокаОтчета сумма (Источник данных)"
		И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
		И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
		И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Фиксированное значение"
		И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
		И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
		И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
		И Я в списке "Статьи доходов и расходов" по полю "Наименование" ищу и выбираю элемент "Внедрение программных продуктов" "По точному совпадению" 
		Тогда открылось окно "ВА - Проверка настроек доступа *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "ВА - Проверка настроек доступа *" в течение 20 секунд
		Тогда открылось окно "Источники данных"
		И Я закрываю окно "Источники данных"
		Тогда открылось окно "Конструктор отчета"
		И я нажимаю на кнопку с именем 'ОтменаРедактированияФормулы'
		Когда открылось окно "Конструктор отчета"			
		И Я закрываю окно 'Конструктор отчета'

	* Создаем бланк
		// ДОДЕЛАТЬ: Бланки должны также корректно копироваться вместе с видом отчета
		Когда открылось окно "Виды и бланки отчетов"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"                         |
			| "ВА - Проверка настроек доступа (нет)" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Бланк *"
		И я нажимаю на кнопку с именем 'СоздатьБланкКонструктором'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Структура отчета"
		И я снимаю флаг с именем 'ВыводитьРеквизиты'
		И из выпадающего списка с именем 'ШаблонОформленияБланковОтчетов' я выбираю точное значение "Классический"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно "Бланк *"
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписатьИЗакрыть'
		И я жду закрытия окна "Бланк *" в течение 20 секунд

	* Создаем бланк сводной таблицы
		// ДОДЕЛАТЬ: Бланки должны также корректно копироваться вместе с видом отчета	
		Когда открылось окно "Виды и бланки отчетов"	
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"                                           |
			| "ВА - Проверка настроек доступа (нет) (сводная таблица)" |
		И в таблице 'Список' я выбираю текущую строку	
		Когда открылось окно "Бланк сводной таблицы: *"
		И я нажимаю на кнопку с именем 'ПоказатьСоставСтрок'
		Тогда открылось окно "Настройка состава строк"
		И в таблице 'ДеревоВыбранныхСтрок' я перехожу к строке:
			| 'Код'                  | 'Строка отчета' |
			| 'СТРКОтчета          ' | 'СтрокаОтчета'  |
		И я нажимаю на кнопку с именем 'Удалить'
		И я нажимаю на кнопку с именем 'Удалить'
		И я нажимаю на кнопку с именем 'ПеренестиВлевоВсе'
		И я нажимаю на кнопку с именем 'ПрименитьИзменения'
		Тогда открылось окно "Бланк сводной таблицы: *"
		И я нажимаю на кнопку с именем 'ПоказатьСоставКолонок'
		Тогда открылось окно "Настройка состава колонок"
		И в таблице 'НастройкиСоставаКолонокСводнойТаблицы' я нажимаю на кнопку с именем 'НастройкиСоставаКолонокСводнойТаблицыУдалить'
		И в таблице 'НастройкиСоставаКолонокСводнойТаблицы' я нажимаю на кнопку с именем 'НастройкиСоставаКолонокСводнойТаблицыЗаполнитьКолонки'
		И я нажимаю на кнопку с именем 'ФормаПрименить'
		Тогда открылось окно "Бланк сводной таблицы: *"
		И я нажимаю на кнопку с именем 'ПоказатьНастройкиТаблицыПоОсям'
		Тогда открылось окно "Настройка расположения полей"
		И в таблице 'ТаблицаСтроки' я перехожу к строке:
			| "По горизонтали (в строках)" |
			| "Подразделения организаций"  |
		И я выбираю пункт контекстного меню с именем 'ТаблицаСтрокиКонтекстноеМенюПеренестиВОтборы' на элементе формы с именем 'ТаблицаСтроки'
		И в таблице 'ТаблицаДоступныеПоля' я перехожу к строке:
			| 'Доступные аналитики' |
			| 'Проект'              |
		И я выбираю пункт контекстного меню с именем 'ТаблицаДоступныеПоляКонтекстноеМенюПеренестиВОтборы' на элементе формы с именем 'ТаблицаДоступныеПоля'
		Когда открылось окно "Настройка расположения полей"
		И я нажимаю на кнопку с именем 'КнопкаПрименить'
		Тогда открылось окно "Бланк сводной таблицы: *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Бланк сводной таблицы: *" в течение 20 секунд						

Сценарий: 20.04 Создание экземпляров отчетов "ВА - Проверка настроек доступа"

	И Я создаю экземпляр отчета для вида отчета "ВА - Проверка настроек доступа (нет)" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Меркурий ООО" проект "ВА - Основной проект" аналитики "Администрация" '' '' '' '' ''
	И Я ввожу значение '100' в ячейку 'R6C2'	
	Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек.mxl'
	И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

	И Я создаю экземпляр отчета для вида отчета "ВА - Проверка настроек доступа (да)" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Меркурий ООО" проект "ВА - Основной проект" аналитики "Администрация" '' '' '' '' ''
	И Я ввожу значение '100' в ячейку 'R6C2'	
	Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек.mxl'
	И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд
		
	И Я создаю экземпляр отчета для вида отчета "ВА - Проверка настроек доступа (да)" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Венера ООО" проект "ВА - Основной проект" аналитики "Администрация" '' '' '' '' ''
	И Я ввожу значение '100' в ячейку 'R6C2'
	Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек.mxl'	
	И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

	И Я создаю экземпляр отчета для вида отчета "ВА - Проверка настроек доступа (да)" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Земля ООО" проект "ВА - Основной проект" аналитики "Администрация" '' '' '' '' ''
	И Я ввожу значение '100' в ячейку 'R6C2'
	Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_Пустой.mxl'	
	И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: 20.05 Настройка прав для пользователей

	И Я добавляю право "Чтение, запись" для вида отчета "ВА - Проверка настроек доступа (да)" пользователя "Бюджетирование1" по всем организациям

	И Я добавляю право "Чтение, запись" для вида отчета "ВА - Проверка настроек доступа (да)" пользователя "Бюджетирование2" организации "Меркурий ООО" 
	И Я добавляю право "Чтение" для вида отчета "ВА - Проверка настроек доступа (да)" пользователя "Бюджетирование2" организации "Венера ООО"

	И Я добавляю право "Чтение, запись" для вида отчета "ВА - Проверка настроек доступа (да)" пользователя "Бюджетирование3" организации "Меркурий ООО" 

	И я закрываю сеанс текущего клиента тестирования

Сценарий: 20.06 Проверка ЭО для пользователя "Бюджетирование1"

	И я подключаю TestClient "УХ - Бюджетирование" логин "Бюджетирование1" пароль ''

	* Отчета "ВА - Проверка настроек доступа (нет)" не должно быть в списке
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Виды и бланки отчетов"
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (нет)"
		И я нажимаю на кнопку с именем 'Find'				
		Тогда в таблице 'СписокВидовОтчетов' количество строк "равно" 0
				
	* Ищем отчет "ВА - Проверка настроек доступа (да)"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (да)"
		И я нажимаю на кнопку с именем 'Find'				
		Тогда в таблице 'СписокВидовОтчетов' количество строк "равно" 1	
		И Я закрываю окно "Виды и бланки отчетов"

	* Ищем экземпляры отчетов	
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Экземпляры отчетов"
		И Я в списке "Экземпляры отчетов" по полю "Вид отчета" ищу элемент "ВА - Проверка настроек доступа" "По началу строки"
		И я нажимаю кнопку очистить у поля с именем 'СохраненнаяНастройка'
		Тогда в таблице 'Список' количество строк "равно" 3	
		Тогда таблица 'Список' стала равной:
			| "Вид отчета"                          | "Организация"  | "Период отчета"  | "Период окончания" | "Сценарий"               | "Состояние" | "Проект"               | "Аналитика 1"   | "Аналитика 2" | "Аналитика 3" | "Аналитика 4" | "Аналитика 5" | "Аналитика 6" | "Основная валюта" | "Внешняя ИБ" | "Последний редактировавший" |
			| "ВА - Проверка настроек доступа (да)" | "Земля ООО"    | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "Администрация" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           | "Администратор"             |
			| "ВА - Проверка настроек доступа (да)" | "Венера ООО"   | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "Администрация" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           | "Администратор"             |
			| "ВА - Проверка настроек доступа (да)" | "Меркурий ООО" | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "Администрация" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           | "Администратор"             |
		
	* Проверяем ЭО по организации "Земля"
		И в таблице 'Список' я перехожу к строке:
			| "Вид отчета"                          | "Организация"  | "Период отчета"  | "Период окончания" | "Сценарий"               | "Состояние" | "Проект"               | "Аналитика 1"   | "Основная валюта" | "Последний редактировавший" |
			| "ВА - Проверка настроек доступа (да)" | "Земля ООО"    | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "Администрация" | "RUB"             | "Администратор"             |
		И в таблице 'Список' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "ВА - Проверка настроек доступа (да)" валюта "RUB" организация "Земля ООО" сценарий "ВА - Основной сценарий" периодичность 'Месяц' проект "ВА - Основной проект" аналитики "Администрация" '' '' '' '' '' 
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_Пустой.mxl'
		И я нажимаю на кнопку с именем 'РазрешитьРедактирование'				
		И Я ввожу значение '200' в ячейку 'R6C4'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_Земля.mxl'
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд
		Когда открылось окно "Экземпляры отчетов"
		И в таблице 'Список' я выбираю текущую строку
		И открылось окно '$ЗаголовокОкна$'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_Земля.mxl'		
		И я закрываю окно '$ЗаголовокОкна$'
				
	* Проверяем ЭО по организации "Меркурий"
		И в таблице 'Список' я перехожу к строке:
			| "Вид отчета"                          | "Организация"  | "Период отчета"  | "Период окончания" | "Сценарий"               | "Состояние" | "Проект"               | "Аналитика 1"   | "Основная валюта" | "Последний редактировавший" |
			| "ВА - Проверка настроек доступа (да)" | "Меркурий ООО" | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "Администрация" | "RUB"             | "Администратор"             |
		И в таблице 'Список' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "ВА - Проверка настроек доступа (да)" валюта "RUB" организация "Меркурий ООО" сценарий "ВА - Основной сценарий" периодичность 'Месяц' проект "ВА - Основной проект" аналитики "Администрация" '' '' '' '' '' 
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек.mxl'
		И я нажимаю на кнопку с именем 'РазрешитьРедактирование'				
		И Я ввожу значение '200' в ячейку 'R6C4'
		И открылось окно '$ЗаголовокОкна$'
		И я закрываю окно '$ЗаголовокОкна$'
		Когда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button1'
		Тогда открылось окно "Экземпляры отчетов"
		И Я закрываю окно "Экземпляры отчетов"

	И я закрываю сеанс текущего клиента тестирования			
					
Сценарий: 20.07 Проверка ЭО для пользователя "Бюджетирование2"	

	И я подключаю TestClient "УХ - Бюджетирование" логин "Бюджетирование2" пароль ''

	* Отчета "ВА - Проверка настроек доступа (нет)" не должно быть в списке
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Виды и бланки отчетов"
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (нет)"
		И я нажимаю на кнопку с именем 'Find'				
		Тогда в таблице 'СписокВидовОтчетов' количество строк "равно" 0
				
	* Ищем отчет "ВА - Проверка настроек доступа (да)"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (да)"
		И я нажимаю на кнопку с именем 'Find'				
		Тогда в таблице 'СписокВидовОтчетов' количество строк "равно" 1	
		И Я закрываю окно "Виды и бланки отчетов"

	* Ищем экземпляры отчетов	
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Экземпляры отчетов"
		И Я в списке "Экземпляры отчетов" по полю "Вид отчета" ищу элемент "ВА - Проверка настроек доступа" "По началу строки"
		И я нажимаю кнопку очистить у поля с именем 'СохраненнаяНастройка'				
		Тогда в таблице 'Список' количество строк "равно" 2	
		Тогда таблица 'Список' стала равной:
			| "Вид отчета"                          | "Организация"  | "Период отчета"  | "Период окончания" | "Сценарий"               | "Состояние" | "Проект"               | "Аналитика 1"   | "Аналитика 2" | "Аналитика 3" | "Аналитика 4" | "Аналитика 5" | "Аналитика 6" | "Основная валюта" | "Внешняя ИБ" | "Последний редактировавший" |
			| "ВА - Проверка настроек доступа (да)" | "Венера ООО"   | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "Администрация" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           | "Администратор"             |
			| "ВА - Проверка настроек доступа (да)" | "Меркурий ООО" | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "Администрация" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           | "Администратор"             |
		
	* Проверяем ЭО по организации "Меркурий"
		И в таблице 'Список' я перехожу к строке:
			| "Вид отчета"                          | "Организация"  | "Период отчета"  | "Период окончания" | "Сценарий"               | "Состояние" | "Проект"               | "Аналитика 1"   | "Основная валюта" | "Последний редактировавший" |
			| "ВА - Проверка настроек доступа (да)" | "Меркурий ООО" | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "Администрация" | "RUB"             | "Администратор"             |
		И в таблице 'Список' я выбираю текущую строку
		* Очищаем версии
			И Открылся экземпляр отчета для вида отчета "ВА - Проверка настроек доступа (да)" валюта "RUB" организация "Меркурий ООО" сценарий "ВА - Основной сценарий" периодичность 'Месяц' проект "ВА - Основной проект" аналитики "Администрация" '' '' '' '' '' 
			Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек.mxl'
			И я нажимаю на кнопку с именем 'ФормаРаботаСВерсиями'
			Тогда открылось окно "Управление версиями показателей"
			И я нажимаю на кнопку с именем 'СписокУдалитьВерсии'
			Тогда открылось окно "1С:Предприятие"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "1С:Предприятие"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Управление версиями показателей *"
			И Я закрываю окно "Управление версиями показателей *"
			Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_Пустой.mxl'			
			И открылось окно '$ЗаголовокОкна$'
			И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
			И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд
		* Редактируем документ
			Тогда открылось окно "Экземпляры отчетов"
			И в таблице 'Список' я выбираю текущую строку
			И открылось окно '$ЗаголовокОкна$'	
			Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_Пустой.mxl'				
			И я нажимаю на кнопку с именем 'РазрешитьРедактирование'				
			И Я ввожу значение '100' в ячейку 'R6C2'
			И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
			И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд
		* Проверяем результат
			Тогда открылось окно "Экземпляры отчетов"
			И в таблице 'Список' я выбираю текущую строку
			И открылось окно '$ЗаголовокОкна$'	
			Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек.mxl'
			И открылось окно '$ЗаголовокОкна$'
			И я закрываю окно '$ЗаголовокОкна$'
		
	* Проверяем ЭО по организации "Венера"
		Тогда открылось окно "Экземпляры отчетов"
		И в таблице 'Список' я перехожу к строке:
			| "Вид отчета"                          | "Организация" | "Период отчета"  | "Период окончания" | "Сценарий"               | "Состояние" | "Проект"               | "Аналитика 1"   | "Основная валюта" | "Последний редактировавший" |
			| "ВА - Проверка настроек доступа (да)" | "Венера ООО"  | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "Администрация" | "RUB"             | "Администратор"             |
		И в таблице 'Список' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "ВА - Проверка настроек доступа (да)" валюта "RUB" организация "Венера ООО" сценарий "ВА - Основной сценарий" периодичность 'Месяц' проект "ВА - Основной проект" аналитики "Администрация" '' '' '' '' '' 
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек.mxl'	
		И я нажимаю на кнопку с именем 'РазрешитьРедактирование'
		Тогда в логе сообщений TestClient есть строки:
			|'У пользователя Бюджетирование2\nотсутствуют права на изменение экземпляров отчетов с бланком ВА - Проверка настроек доступа (нет) по организации Венера ООО'|
		И я закрываю окно '$ЗаголовокОкна$'							
		Тогда открылось окно "Экземпляры отчетов"
		И Я закрываю окно "Экземпляры отчетов"

Сценарий: 20.08 Проверка СТ для пользователя "Бюджетирование2"

	И я подключаю TestClient "УХ - Бюджетирование" логин "Бюджетирование2" пароль ''

	* Открываем сводную таблицу
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Сводная таблица"
		Тогда открылось окно "Сводная таблица: *"			
		И я нажимаю на гиперссылку с именем 'ОтборыЗаголовок'
		И я нажимаю кнопку выбора у поля с именем 'Бланк'
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По началу строки"
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (да)"
		И Пауза 1		
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (да)"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"                                           |
			| "ВА - Проверка настроек доступа (нет) (сводная таблица)" |
		И я нажимаю на кнопку с именем 'СписокВыбрать'
		Тогда открылось окно "Сводная таблица: *"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Основной"
		И я нажимаю на кнопку с именем 'ИзменитьПериод'
		Тогда открылось окно "Выберите период"
		И в поле с именем 'DateBegin' я ввожу текст '01.01.2024'
		И я перехожу к следующему реквизиту
		И в поле с именем 'DateEnd' я ввожу текст '31.03.2024'
		И я нажимаю на кнопку с именем 'Select'
		Тогда Открылась сводная таблица для вида отчета "ВА - Проверка настроек доступа (нет)"
		Тогда открылось окно '$ЗаголовокОкна$'
		И из выпадающего списка с именем 'ВалютаОтображения' я выбираю точное значение 'RUB'
		И из выпадающего списка с именем 'Элемент_Сценарий' я выбираю по строке "ВА - Основной сценарий"
		И из выпадающего списка с именем 'Элемент_Организация' я выбираю по строке "Меркурий ООО"
		И из выпадающего списка с именем 'Элемент_Проект' я выбираю по строке "ВА - Основной проект"
		И из выпадающего списка "Подразделения организаций" я выбираю по строке "Администрация"
		И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы1'
		И я жду открытия формы '$ЗаголовокОкна$' в течение 20 секунд
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_СТ.mxl'

	* Редактируем СТ по организации "Меркурий"
		И я нажимаю на кнопку с именем 'РаботаСВерсиями'
		Тогда открылось окно "Управление версиями показателей"
		И я нажимаю на кнопку с именем 'СписокУдалитьВерсии'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Управление версиями показателей *"
		И Я закрываю окно "Управление версиями показателей *"
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_СТ_Пустой.mxl'
		И Я ввожу значение '100' в ячейку 'R4C2'
		И я нажимаю на кнопку с именем 'Применить'
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_СТ.mxl'

	* Проверяем СТ по организации "Венера"
		И Я устанавливаю отбор сводной таблицы 'Элемент_Организация' со значением "Венера ООО"
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_СТ.mxl'				
		И Я ввожу значение '100' в ячейку 'R4C3'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_СТ.mxl'		

	* Проверяем СТ по организации "Земля"
		И Я устанавливаю отбор сводной таблицы 'Элемент_Организация' со значением "Земля ООО"
		И я жду недоступности элемента с именем 'ПолеТабличногоДокументаМакет' в течение 20 секунд
		// ДОДЕЛАТЬ: Сделать проверку через новый шаг, с помощью метода ПолучитьОтображениеСостояния()	

	И я закрываю сеанс текущего клиента тестирования		
								
Сценарий: 20.09 Проверка ЭО для пользователя "Бюджетирование3"
	
	И я подключаю TestClient "УХ - Бюджетирование" логин "Бюджетирование3" пароль ''

	* Отчета "ВА - Проверка настроек доступа (нет)" не должно быть в списке
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Виды и бланки отчетов"
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (нет)"
		И я нажимаю на кнопку с именем 'Find'				
		Тогда в таблице 'СписокВидовОтчетов' количество строк "равно" 0
				
	* Ищем отчет "ВА - Проверка настроек доступа (да)"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (да)"
		И я нажимаю на кнопку с именем 'Find'				
		Тогда в таблице 'СписокВидовОтчетов' количество строк "равно" 1	
		И Я закрываю окно "Виды и бланки отчетов"

	* Ищем экземпляры отчетов	
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Экземпляры отчетов"
		И Я в списке "Экземпляры отчетов" по полю "Вид отчета" ищу элемент "ВА - Проверка настроек доступа" "По началу строки"
		И я нажимаю кнопку очистить у поля с именем 'СохраненнаяНастройка'
		Тогда в таблице 'Список' количество строк "равно" 1	
		Тогда таблица 'Список' стала равной по шаблону:
			| "Вид отчета"                          | "Организация"  | "Период отчета"  | "Период окончания" | "Сценарий"               | "Состояние" | "Проект"               | "Аналитика 1"            | "Аналитика 2" | "Аналитика 3" | "Аналитика 4" | "Аналитика 5" | "Аналитика 6" | "Основная валюта" | "Внешняя ИБ" |
			| "ВА - Проверка настроек доступа (да)" | "Меркурий ООО" | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" | "Черновик"  | "ВА - Основной проект" | "<Объект не найден> (*)" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           |
		Когда открылось окно "Экземпляры отчетов"
		И в таблице 'Список' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "ВА - Проверка настроек доступа (да)" валюта "RUB" организация "Меркурий ООО" сценарий "ВА - Основной сценарий" периодичность 'Месяц' проект "ВА - Основной проект" аналитики "<Объект не найден> (*)" '' '' '' '' '' 
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек.mxl'
		И элемент формы с именем 'РазрешитьРедактирование' отсутствует на форме
		Когда открылось окно '$ЗаголовокОкна$'
		И из выпадающего списка с именем 'ВыбраннаяВалюта' я выбираю точное значение "USD"
		И я нажимаю на кнопку с именем 'ФормаОбновитьСУчетомВерсий'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_USD.mxl'		
		Когда открылось окно '$ЗаголовокОкна$'
		И я закрываю окно '$ЗаголовокОкна$'
		
Сценарий: 20.10 Проверка СТ для пользователя "Бюджетирование3"

	И я подключаю TestClient "УХ - Бюджетирование" логин "Бюджетирование3" пароль ''

	* Открываем сводную таблицу
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Сводная таблица"
		Тогда открылось окно "Сводная таблица: *"			
		И я нажимаю на гиперссылку с именем 'ОтборыЗаголовок'
		И я нажимаю кнопку выбора у поля с именем 'Бланк'
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
		И я меняю значение переключателя с именем 'CompareType' на "По началу строки"
		И в поле с именем 'Pattern' я ввожу текст "ВА - Проверка настроек доступа (да)"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"                                           |
			| "ВА - Проверка настроек доступа (нет) (сводная таблица)" |
		И я нажимаю на кнопку с именем 'СписокВыбрать'
		Тогда открылось окно "Сводная таблица: *"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Основной"
		И я нажимаю на кнопку с именем 'ИзменитьПериод'
		Тогда открылось окно "Выберите период"
		И в поле с именем 'DateBegin' я ввожу текст '01.01.2024'
		И я перехожу к следующему реквизиту
		И в поле с именем 'DateEnd' я ввожу текст '31.03.2024'
		И я нажимаю на кнопку с именем 'Select'
		Тогда Открылась сводная таблица для вида отчета "ВА - Проверка настроек доступа (нет)"
		Тогда открылось окно '$ЗаголовокОкна$'
		И из выпадающего списка с именем 'ВалютаОтображения' я выбираю точное значение 'RUB'
		И из выпадающего списка с именем 'Элемент_Сценарий' я выбираю по строке "ВА - Основной сценарий"
		И из выпадающего списка с именем 'Элемент_Организация' я выбираю по строке "Меркурий ООО"
		И из выпадающего списка с именем 'Элемент_Проект' я выбираю по строке "ВА - Основной проект"
		И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы1'
		И я жду открытия формы '$ЗаголовокОкна$' в течение 20 секунд

	* Элементы должны быть недоступны
		И Я ввожу значение '100' в ячейку 'R4C4'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\20\ВА_ПроверкаНастроек_СТ_Пустой.mxl'
		И элемент формы с именем 'Применить' не доступен
		И элемент с именем 'КомандыРаботыСРедактированиемЗначений' доступен только для просмотра
		И элемент с именем 'РаботаСВерсиями' доступен только для просмотра
		И элемент формы с именем 'ГруппаПересчитать' не доступен
				
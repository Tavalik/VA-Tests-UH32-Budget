﻿#language: ru

@tree


Функционал: 10. Расчет показателей с заполнением по ADO

Как Администратор я хочу
Проверить, что данные по ADO загружаются в экземпляры отчетов

Контекст: 

	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 10.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 10.01 Создание информационных баз

	И Я создаю тип информационной базы с именем "ВА - Импорт ADO (Excel)" с версией "Подключение через ADO"

	И Я создаю внешнюю информационную базу "ВА - Импорт ADO (Excel)" тип "ВА - Импорт ADO (Excel)" каталог "$КаталогПроекта$\Макеты\ADO" тип хранилища 'Excel'

Сценарий: 10.02 Настройка информационных баз

	И В командном интерфейсе я выбираю "Интеграция и управление мастер-данными" "Типы ИБ"
	И Я в списке "Типы информационных баз" по полю "Наименование" ищу и выбираю элемент "ВА - Импорт ADO (Excel)" "По началу строки"
	Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И из выпадающего списка с именем 'ВИБПоУмолчанию' я выбираю по строке "ВА - Импорт ADO (Excel)"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И В текущем окне я нажимаю кнопку командного интерфейса "Таблицы ADO"
	И в таблице 'Список' я нажимаю на кнопку с именем 'ОбновитьСписокТаблиц'
	Когда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И В текущем окне я нажимаю кнопку командного интерфейса "Соответствие внешним ИБ"
	
	* Номенклатура
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Соответствие внешним ИБ (создание)"
		И я нажимаю кнопку выбора у поля с именем 'ОписаниеОбъектаВИБ'
		Тогда открылось окно "Таблицы ADO"
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Соответствие внешним ИБ (создание) *"
		И из выпадающего списка с именем 'ТипОбъектаКонсолидации' я выбираю точное значение "Справочник"
		И я нажимаю кнопку выбора у поля с именем 'ОписаниеОбъектаТек'
		Тогда открылось окно "Справочники ИБ"
		И в таблице 'Список' я перехожу к строке:
			| "Контролируемый" | "Отсутствует в конфигурации" | "Согласуется" | "Справочник"   |
			| "Нет"            | "Нет"                        | "Нет"         | "Номенклатура" |
		И в таблице 'Список' я выбираю текущую строку
		* Наименование
			Тогда открылось окно "Соответствие внешним ИБ (создание) *"
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Поле"         |
				| "Наименование" |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
			И в таблице 'ТабличноеПолеИзмеренийБД' я перехожу к строке:
				| "Используется в сопоставлении" | "Поле"         |
				| "Нет"                          | "Номенклатура" |
			И я выбираю пункт контекстного меню с именем 'ТаблицаСоответствияКонтекстноеМенюКоманднаяПанельСоответствияКнопкаСопоставитьАналитики' на элементе формы с именем 'ТаблицаСоответствия'
		* Артикул
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Поле"    |
				| "Артикул" |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
			И в таблице 'ТабличноеПолеИзмеренийБД' я перехожу к строке:
				| "Используется в сопоставлении" | "Поле"    |
				| "Нет"                          | "Артикул" |
			И я выбираю пункт контекстного меню с именем 'ТаблицаСоответствияКонтекстноеМенюКоманднаяПанельСоответствияКнопкаСопоставитьАналитики' на элементе формы с именем 'ТаблицаСоответствия'	
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Источник" | "Ключевой" | "Поле"    | "Способ заполнения" |
				| "Артикул"  | "Нет"      | "Артикул" | "Поле источника"    |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияКлючевой'
			И в таблице 'ТаблицаСоответствия' я изменяю флаг с именем 'ТаблицаСоответствияКлючевой'
			И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
		* Вид номенклатуры
			Если 'НЕ $$ЭтоPerform$$' Тогда
				Когда открылось окно "Соответствие внешним ИБ (создание) *"
				И в таблице 'ТаблицаСоответствия' я перехожу к строке:
					| "Поле"             |
					| "Вид номенклатуры" |
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Фиксированное значение"
				И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимВИБ'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				И Я в списке "Введите значение" по полю "Наименование" ищу и выбираю элемент "ВА - Номенклатура" "По началу строки"
		* Номенклатурная группа
			Когда открылось окно "Соответствие внешним ИБ (создание) *"
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Поле"                  |
				| "Номенклатурная группа" |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
			И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
			И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Фиксированное значение"
			И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимВИБ'
			И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
			И Я в списке "Введите значение" по полю "Наименование" ищу и выбираю элемент "ВА - Номенклатурная группа" "По началу строки"	
		* Единица измерения
			Когда открылось окно "Соответствие внешним ИБ (создание) *"
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Поле"    |
				| "Единица" |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
			И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
			И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Фиксированное значение"
			И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимВИБ'
			И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
			И Я в списке "Введите значение" по полю "Наименование" ищу и выбираю элемент "Штука" "По началу строки"	
		* Корневой каталог				
			И я нажимаю кнопку выбора у поля с именем 'КорневойКаталог'
			И Я в списке 'Справочник.Номенклатура' по полю "Ссылка" ищу элемент "ВА - Номенклатура" "По началу строки"
			И в таблице 'Список' я нажимаю на кнопку с именем 'СписокВыбрать'
			Тогда элемент формы с именем 'КорневойКаталог' стал равен "ВА - Номенклатура"			
		И я нажимаю на кнопку с именем 	'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Соответствие внешним ИБ (создание) *" в течение 20 секунд

	Когда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Соответствие внешним ИБ (создание)"
	И из выпадающего списка с именем 'ОписаниеОбъектаВИБ' я выбираю точное значение "Лист1$"
	И из выпадающего списка с именем 'ТипОбъектаКонсолидации' я выбираю точное значение "Справочник"
	И я нажимаю кнопку выбора у поля с именем 'ОписаниеОбъектаТек'
	Тогда открылось окно "Справочники ИБ"
	И в таблице 'Список' я перехожу к строке:
		| "Контролируемый" | "Отсутствует в конфигурации" | "Согласуется" | "Справочник"                |
		| "Нет"            | "Нет"                        | 'Да'          | 'Статьи доходов и расходов' |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Соответствие внешним ИБ (создание) *"
	И в таблице 'ТабличноеПолеИзмеренийБД' я перехожу к строке:
		| "Используется в сопоставлении" | "Поле"         |
		| "Нет"                          | "Деятельность" |
	И в таблице 'ТаблицаСоответствия' я перехожу к строке:
		| "Поле"         |
		| "Наименование" |
	И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
	И я выбираю пункт контекстного меню с именем 'ТаблицаСоответствияКонтекстноеМенюКоманднаяПанельСоответствияКнопкаСопоставитьАналитики' на элементе формы с именем 'ТаблицаСоответствия'
	И в таблице 'ТаблицаСоответствия' я перехожу к строке:
		| "Поле" |
		| "Код"  |
	И в таблице 'ТаблицаСоответствия' я перехожу к строке:
		| "Источник"     | "Ключевой" | "Поле"         | "Способ заполнения" |
		| "Деятельность" | "Нет"      | "Наименование" | "Поле источника"    |
	И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияКлючевой'
	И в таблице 'ТаблицаСоответствия' я изменяю флаг с именем 'ТаблицаСоответствияКлючевой'
	И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
	* Корневой каталог
		И я нажимаю кнопку выбора у поля с именем 'КорневойКаталог'
		И Я в списке 'Справочник.СтатьиДоходовИРасходов' по полю "Ссылка" ищу элемент "ВА - Статьи доходов и расходов" "По началу строки"
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокВыбрать'
		Тогда элемент формы с именем 'КорневойКаталог' стал равен "ВА - Статьи доходов и расходов"
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "Соответствие внешним ИБ (создание) *" в течение 20 секунд
	
	Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И В текущем окне я нажимаю кнопку командного интерфейса "Основное"
	И В текущем окне я нажимаю кнопку командного интерфейса "Таблицы ADO"
	И в таблице 'Список' я нажимаю на кнопку с именем 'СписокПросмотрДанных'
	Тогда открылось окно "Форма просмотра таблицы ADO"
	И Я закрываю окно "Форма просмотра таблицы ADO"
	Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И Я закрываю окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	Тогда открылось окно "Типы информационных баз"
	И Я закрываю окно "Типы информационных баз"
			
Сценарий: 10.03 Создание вида отчета

	И Я создаю вид отчета с именем "ВА - Импорт ADO (Excel)" и родителем "ВА - Группа отчетов"

	* Настройка структуры отчета
		И Я открываю контруктор отчета с именем "ВА - Импорт ADO (Excel)"
		И Я в конструкторе отчета добавляю строку с именем "Продажи" 
		И Я в конструкторе отчета добавляю колонку с именем "Цена" 
		И Я в конструкторе отчета добавляю колонку с именем "Количество"
		И Я в конструкторе отчета добавляю колонку с именем "Артикул"
		И Я в конструкторе отчета в ячейке 'R2C4' меняю свойство показателя 'ТипЗначения' на "Строка"
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R2C2'
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СДохРас" в ячейку 'R2C3'

	* Настройки обмена файлами
		Тогда открылось окно "Конструктор отчета"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Формулы расчета показателей"
		И я нажимаю на кнопку открытия поля с именем 'ПравилоОбработки'
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Правила расчета)"
		И из выпадающего списка с именем 'ТипБД' я выбираю по строке "ВА - Импорт ADO (Excel)"
		И я нажимаю на кнопку открытия поля с именем 'ТипБД'
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
		И я нажимаю на кнопку открытия поля с именем 'ВИБПоУмолчанию'
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Внешние информационные базы)"
		И я нажимаю на кнопку с именем 'ОткрытьНастройкиОбменаФайламиОрганизаций'
		И Я добавляю элемент пути к файлам организаций для типа 'ВидОтчета' объект "ВА - Импорт ADO (Excel)" значение "ВА_ЗагрузкаADO"
		Тогда открылось окно "Элементы пути к файлам организаций: Форма списка"
		И Я закрываю окно "Элементы пути к файлам организаций: Форма списка"		
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Внешние информационные базы)"
		И Я закрываю окно "ВА - Импорт ADO (Excel) (Внешние информационные базы)"
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "ВА - Импорт ADO (Excel) (Тип информационной базы)" в течение 20 секунд
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Правила расчета) *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "ВА - Импорт ADO (Excel) (Правила расчета) *" в течение 20 секунд

	* Настройка формул
		* Цена
			Тогда открылось окно "Конструктор отчета"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C2'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно "Источник данных (создание)"
			И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Таблицы из подключения по ADO"
			И я нажимаю кнопку выбора у поля с именем 'ТаблицаADO'
			Тогда открылось окно "Таблицы ADO"
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "Источник данных (создание) *"
			И в таблице 'ДеревоПолейБД' я разворачиваю текущую строку
			И в таблице 'ДеревоПолейБД' я перехожу к строке:
				| "Поле" |
				| "Цена" |
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Аналитика приемника" | "Имя колонки"  | "Способ заполнения" |
				| "Значение"            | "[Количество]" | "Поле источника"    |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
			И я выбираю пункт контекстного меню с именем 'КнопкаСопоставитьАналитики' на элементе формы с именем 'ТаблицаСоответствия'
			И я перехожу к закладке с именем 'СтраницаОтборы'
			И в таблице 'ДеревоПолейБД' я перехожу к строке:
				| "Поле"   |
				| "Период" |
			И я нажимаю на кнопку с именем 'ДобавитьЭлементУсловия'
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'СпособВычисленияПараметра'
			И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
			И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "В интервале"
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'УточнениеСпособаОпределения'
			И в таблице 'ДеревоПараметровОтбораБД' я нажимаю кнопку выбора у реквизита с именем 'УточнениеСпособаОпределения'
			Тогда открылось окно "Укажите способы вычисления границ интервала"
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно "Источник данных (создание) *"
			И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаВыбрать'
			Тогда открылось окно "Конструктор отчета *"
			И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		* Количества
			Тогда открылось окно "Конструктор отчета"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C3'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно "Источник данных (создание)"
			И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Таблицы из подключения по ADO"
			И из выпадающего списка с именем 'ТаблицаADO' я выбираю точное значение "Лист1$"
			И я перехожу к закладке с именем 'СтраницаОтборы'
			И в таблице 'ДеревоПолейБД' я разворачиваю текущую строку
			И в таблице 'ДеревоПолейБД' я перехожу к строке:
				| "Поле"   |
				| "Период" |
			И я нажимаю на кнопку с именем 'ДобавитьЭлементУсловия'
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'СпособВычисленияПараметра'
			И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
			И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "В интервале"
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'УточнениеСпособаОпределения'
			И в таблице 'ДеревоПараметровОтбораБД' я нажимаю кнопку выбора у реквизита с именем 'УточнениеСпособаОпределения'
			Тогда открылось окно "Укажите способы вычисления границ интервала"
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно "Источник данных (создание) *"
			И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаВыбрать'
			Тогда открылось окно "Конструктор отчета *"
			И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		* Артикул
			Тогда открылось окно "Конструктор отчета"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C4'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно "Источник данных (создание)"
			И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Таблицы из подключения по ADO"
			И из выпадающего списка с именем 'ТаблицаADO' я выбираю точное значение "Лист1$"
			И я перехожу к закладке с именем 'СтраницаОтборы'
			И в таблице 'ДеревоПолейБД' я разворачиваю текущую строку
			И в таблице 'ДеревоПолейБД' я перехожу к строке:
				| "Поле"   |
				| "Период" |
			И я нажимаю на кнопку с именем 'ДобавитьЭлементУсловия'
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'СпособВычисленияПараметра'
			И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
			И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "В интервале"
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'УточнениеСпособаОпределения'
			И в таблице 'ДеревоПараметровОтбораБД' я нажимаю кнопку выбора у реквизита с именем 'УточнениеСпособаОпределения'
			Тогда открылось окно "Укажите способы вычисления границ интервала"
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно "Источник данных (создание) *"
			И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаВыбрать'
			Тогда открылось окно "Конструктор отчета *"
			И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
			Тогда открылось окно "Конструктор отчета"
			И Я закрываю окно "Конструктор отчета"

	* Создаем бланк
		И Я Для вида отчета "ВА - Импорт ADO (Excel)" создаю бланк для импорта по умолчанию		

Сценарий: 10.04 Настройка справочников ИБ

	И В командном интерфейсе я выбираю "Общие справочники и настройки" "Справочники"
	Тогда открылось окно "Справочники текущей информационной базы"
	И в таблице 'Список' я перехожу к строке:
		| "Справочник текущей ИБ" |
		| "Номенклатура"          |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Номенклатура (Справочники ИБ)"
	И Для каждой строки таблицы 'Реквизиты' я выполняю
		И в таблице 'Реквизиты' я активизирую поле с именем 'РеквизитыОбязательный'
		И в таблице 'Реквизиты' я снимаю флаг с именем 'РеквизитыОбязательный'	
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "Номенклатура (Справочники ИБ) *" в течение 20 секунд
	Тогда открылось окно "Справочники текущей информационной базы"
	И в таблице 'Список' я перехожу к строке:
		| "Справочник текущей ИБ"     |
		| 'Статьи доходов и расходов' |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Статьи доходов и расходов (Справочники ИБ)"
	И Для каждой строки таблицы 'Реквизиты' я выполняю
		И в таблице 'Реквизиты' я активизирую поле с именем 'РеквизитыОбязательный'
		И в таблице 'Реквизиты' я снимаю флаг с именем 'РеквизитыОбязательный'	
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И Я закрываю окно "Справочники текущей информационной базы"

Сценарий: 10.05 Создание экземпляра отчета

	И Я создаю экземпляр отчета для вида отчета "ВА - Импорт ADO (Excel)" сценарий "ВА - Основной сценарий" период '01.01.2021' '31.03.2021' периодичность "Месяц" организация "Меркурий ООО" проект '' аналитики '' '' '' '' '' '' 		
	
	* Устанавливаем ИБ
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаОткрытьНастройки'
		Тогда открылось окно "Редактирование настроек отчета"
		И я перехожу к закладке с именем 'ГруппаСтраницаНастройкиОтчета'
		И из выпадающего списка с именем 'ИспользуемаяИБ' я выбираю точное значение "ВА - Импорт ADO (Excel)"
		И я нажимаю на кнопку с именем 'ФормаПрименитьИЗакрыть'
	
	* Делаем расчет
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано табличный документ 'ПолеТабличногоДокументаМакет' равен макету "Макеты\ADO\ВА_ЭкземплярОтчетаADO.mxl"
		И я нажимаю на кнопку с именем 'Записать'
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаОткрытьДвиженияДокументаПлоскаяТаблица'
		Тогда открылось окно "Плоская таблица значений показателей"
		И я жду когда в табличном документе 'ОтчетТабличныйДокумент' заполнится ячейка 'R2C1' в течение 60 секунд
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Макеты\ADO\ВА_ДвиженияДокументаADO.mxl" по шаблону
		И Я закрываю окно "Плоская таблица значений показателей"
		Тогда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'

Сценарий: 10.06 Изменим вид номенклатуры

	Если '$$ЭтоPerform$$' Тогда
		И Я Для номенклатуры с именем "1С:КП ГУ ПРОФ на 12 месяцев" для реквизита 'НоменклатурнаяГруппа' выбираю значение '' в группе ''
		И Я Для номенклатуры с именем "1С:КП ГУ ПРОФ на 6 месяцев" для реквизита 'НоменклатурнаяГруппа' выбираю значение '' в группе ''

	ИначеЕсли '$$ЭтоУХ$$' Тогда 
		И В командном интерфейсе я выбираю "Справочники" "Номенклатура"
		Тогда открылось окно "Номенклатура"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"      |
			| "ВА - Номенклатура" |
		И в таблице  'Список' я перехожу на один уровень вниз

		* 1С:КП ГУ ПРОФ на 12 месяцев
			Если в таблице 'Список' есть строка Тогда
				| "Артикул"    | 'Единица' | "Наименование"                |
				| "КПГУПроф12" | 'шт'      | "1С:КП ГУ ПРОФ на 12 месяцев" |			
				И в таблице 'Список' я перехожу к строке:
					| "Артикул"    | 'Единица' | "Наименование"                |
					| "КПГУПроф12" | 'шт'      | "1С:КП ГУ ПРОФ на 12 месяцев" |
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура)"
				И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура) *" в течение 20 секунд

		* 1С:КП ГУ ПРОФ на 6 месяцев
			Если в таблице 'Список' есть строка Тогда
				| "Артикул"   | 'Единица' | "Наименование"               |
				| "КПГУПроф6" | 'шт'      | "1С:КП ГУ ПРОФ на 6 месяцев" |
				И в таблице 'Список' я перехожу к строке:
					| "Артикул"   | 'Единица' | "Наименование"               |
					| "КПГУПроф6" | 'шт'      | "1С:КП ГУ ПРОФ на 6 месяцев" |
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура)"
				И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура) *" в течение 20 секунд	
		
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
		И В командном интерфейсе я выбираю "Главное" "Номенклатура"
		Тогда открылось окно "Номенклатура"
		
		* 1С:КП ГУ ПРОФ на 6 месяцев
			И в таблице 'ВидыНоменклатуры' я перехожу к строке:
				| "Наименование"      |
				| "ВА - Номенклатура" |
			Если в таблице 'СписокРасширенныйПоискНоменклатура' есть строка Тогда
				| "Артикул "  | "Наименование"               |
				| "КПГУПроф6" | "1С:КП ГУ ПРОФ на 6 месяцев" |
				И в таблице 'СписокРасширенныйПоискНоменклатура' я перехожу к строке:
					| "Артикул "  | "Наименование"               |
					| "КПГУПроф6" | "1С:КП ГУ ПРОФ на 6 месяцев" |
				И в таблице 'СписокРасширенныйПоискНоменклатура' я выбираю текущую строку
				Тогда открылось окно "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура)"
				И я перехожу к закладке с именем 'СтраницаРеквизитыНоменклатуры'
				Если открылось окно 'Полезный совет' Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура)"
				И я разворачиваю группу с именем 'СворачиваемаяГруппаОсновныеПараметрыУчета'
				И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'				
				Если открылось окно 'Ставка НДС применяется с:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '01.01.2021'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно "1С:КП ГУ ПРОФ на * месяцев (Номенклатура)"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура) *" в течение 20 секунд
		
		* 1С:КП ГУ ПРОФ на 12 месяцев
			И в таблице 'ВидыНоменклатуры' я перехожу к строке:
				| "Наименование"      |
				| "ВА - Номенклатура" |
			Если в таблице 'СписокРасширенныйПоискНоменклатура' есть строка Тогда
				| "Артикул "   | "Наименование"                |
				| "КПГУПроф12" | "1С:КП ГУ ПРОФ на 12 месяцев" |
				И в таблице 'СписокРасширенныйПоискНоменклатура' я перехожу к строке:
					| "Артикул "   | "Наименование"                |
					| "КПГУПроф12" | "1С:КП ГУ ПРОФ на 12 месяцев" |
				И в таблице 'СписокРасширенныйПоискНоменклатура' я выбираю текущую строку
				Тогда открылось окно "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура)"
				И я перехожу к закладке с именем 'СтраницаРеквизитыНоменклатуры'
				Тогда открылось окно "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура)"
				И я разворачиваю группу с именем 'СворачиваемаяГруппаОсновныеПараметрыУчета'
				И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				Если открылось окно 'Ставка НДС применяется с:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '01.01.2021'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно "1С:КП ГУ ПРОФ на * месяцев (Номенклатура)"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура) *" в течение 20 секунд

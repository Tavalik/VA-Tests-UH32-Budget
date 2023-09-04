﻿#language: ru
@tree

Функционал: 06. Проверка заполнения аналитик из других источников

	Как Администратор я хочу
	Проверить что коорректно отрабатывало заполнение аналитик из других источников
	чтобы показатели отчетов рассчитывались без ошибок

Контекст: 

	И я закрыл все окна клиентского приложения

Сценарий: 06.00 Определение типа приложения

	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ''
	Пусть Инициализация переменных

Сценарий: 06.01 Создание группы отчетов "ВА - Аналитики других источников (группа)"

	И Я создаю группу видов отчетов с именем "ВА - Аналитики других источников (группа)" и родителем "ВА - Группа отчетов"

Сценарий: 06.02 Создание вида отчета "ВА - Данные для дополнения аналитик"	

	И Я создаю вид отчета с именем "ВА - Данные для дополнения аналитик" и родителем "ВА - Аналитики других источников (группа)"
	И Я открываю вид отчета с именем "ВА - Данные для дополнения аналитик"
	И я перехожу к закладке с именем 'АналитикиОтчета'
	И из выпадающего списка с именем 'ВидАналитики1' я выбираю по строке "ВА0ТовКате"				
	И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'
	Когда открылось окно "Реструктуризация данных"
	И я нажимаю на кнопку с именем 'ФормаОК'		

	И я нажимаю на кнопку с именем 'РедактироватьДерево'
	Когда открылось окно "Конструктор отчета"
	И Я в конструкторе отчета добавляю строку с именем "Статьи ДДС"
	И Я в конструкторе отчета добавляю строку с именем "Товары"
	И Я в конструкторе отчета добавляю колонку с именем "Количество"
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СтатДДС" в ячейку 'R2C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R3C3'

	И Я Для вида отчета "ВА - Данные для дополнения аналитик" создаю бланк по умолчанию

Сценарий: 06.03 Создание экземпляра отчета "ВА - Данные для дополнения аналитик"

	И Я создаю экземпляр отчета для вида отчета "ВА - Данные для дополнения аналитик" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Меркурий ООО" проект '' аналитики "Программные продукты" '' '' '' '' '' 
	И я запоминаю текущее окно как 'ЗаголовокОкна'

	* Документ должен быть пустой
		И табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Данные для дополнения аналитик" | ''               | ''                | ''             | ''           |
			| ''                                    | ''               | ''                | ''             | ''           |
			| ''                                    | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО"      |
			| ''                                    | "Количество"     | "Количество"      | "Количество"   | "Количество" |
			| "Статьи ДДС"                          | '0'              | '0'               | '0'            | '0'          |
			| "Товары"                              | '0'              | '0'               | '0'            | '0'          |

	* Вводим значения показателей
		* Товарные категории
			И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
				| "ВА0СтатДДС"                       | 'Значение1' |
				| "Реализация программных продуктов" | '1,00000'   |
				| "Внедрение программных продуктов"  | '2,00000'   |
			И Я ввожу значение '1,00000' в ячейку 'R7C3'
			И Я ввожу значение '2,00000' в ячейку 'R8C3'
		* Товары
			И Я добавляю значения с раскрытием показателей в ячейку 'R9C2'
				| "ВА0Номенкл"                                                     | 'Значение1' |
				| "1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64)"           | '1,00000'   |
				| "1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест" | '3,00000'   |
				| "1С:Управление холдингом 8"                                      | '2,00000'   |
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R10C2:R12C2'
			И я нажимаю на кнопку с именем 'ПолеТабличногоДокументаМакетСкопироватьДанныеПоСтроке'
			И я изменяю значение на '100,00000' процентов в ячейке 'R10C3:R12C3'
			И я изменяю значение на '200,00000' процентов в ячейке 'R10C4:R12C4'

	* Записываем и закрываем документ	
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: 06.04 Создание вида отчета "ВА - Аналитики из полей других источников"

	И Я создаю вид отчета с именем "ВА - Аналитики из полей других источников" и родителем "ВА - Аналитики других источников (группа)"
	И Я открываю вид отчета с именем "ВА - Аналитики из полей других источников"
	И я перехожу к закладке с именем 'АналитикиОтчета'
	И из выпадающего списка с именем 'ВидАналитики1' я выбираю по строке "ВА0ТовКате"				
	И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'
	Когда открылось окно "Реструктуризация данных"
	И я нажимаю на кнопку с именем 'ФормаОК'	

	И я нажимаю на кнопку с именем 'РедактироватьДерево'
	Тогда открылось окно "Конструктор отчета"
	И Я в конструкторе отчета добавляю строку с именем "Текущая формула"
	И Я в конструкторе отчета добавляю строку с именем "Другой источник"
	И Я в конструкторе отчета добавляю строку с именем "Трансформация аналитик"
	И Я в конструкторе отчета добавляю строку с именем "Рассчитываемый источник"
	И Я в конструкторе отчета добавляю строку с именем "Пересчет в коде"
	И Я в конструкторе отчета добавляю колонку с именем "Количество"
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R2C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R3C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СтатДДС" в ячейку 'R4C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R4C4'
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СтатДДС" в ячейку 'R5C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R5C4'
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СтатДДС" в ячейку 'R6C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R6C4'

	* Устанавливаем формулы расчета
		Когда открылось окно "Конструктор отчета*"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Формулы расчета показателей"
		* Текущая формула
			* Основной источник
				И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C2'
				И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'СсылкаНаПоказатель1'
				И Я выбираю показатель с кодом "Товары_Количество" вида отчета "ВА - Данные для дополнения аналитик"
				Когда открылось окно "Конструктор отчета*"
				И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
				* Источник с доп. аналитиками
					Когда открылось окно "Конструктор отчета"
					И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C2'
					И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
					И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
					Тогда открылось окно "Источники данных"
					И я нажимаю на кнопку с именем 'ФормаСоздать'
					Тогда открылось окно "Источник данных (создание)"
					И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Произвольный запрос к текущей ИБ"
					И я изменяю флаг с именем 'ИспользоватьМногопериодныйКонтекст'
					И в поле с именем 'ТекстЗапросаФорма' я ввожу текст 'ВЫБРАТЬ 2 КАК ЗНАЧЕНИЕ'
					И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'
					И я перехожу к закладке с именем 'СоответствиеАналитик'
					И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Поле другого источника"
					И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
					И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
					Тогда открылось окно "Источники данных"
					И в таблице 'Список' я выбираю текущую строку
					Тогда открылось окно "Источник данных (создание)*"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					И я жду закрытия окна "Источник данных (создание)*" в течение 20 секунд
				Тогда открылось окно "Источники данных"
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Конструктор отчета*"
				И я нажимаю на кнопку с именем 'КнопкаУмножить'
				И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		* Другой источник
			* Источник с прозвольным запросом №1
				Когда открылось окно "Конструктор отчета"
				И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R3C2'
				И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
				Тогда открылось окно "Источники данных"
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно "Источник данных (создание)"
				И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Произвольный запрос к текущей ИБ"
				И я изменяю флаг с именем 'ИспользоватьМногопериодныйКонтекст'
				И в поле с именем 'ТекстЗапросаФорма' я ввожу текст 'ВЫБРАТЬ 2 КАК ЗНАЧЕНИЕ'
				И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'
				И я перехожу к закладке с именем 'СоответствиеАналитик'
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Поле другого источника"
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				* Источник для дополнения аналитик
					Тогда открылось окно "Источники данных"
					И я нажимаю на кнопку с именем 'ФормаСоздать'
					Тогда открылось окно "Источник данных (создание)"
					И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Данные для дополнения аналитик"
					И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
					И Я выбираю показатель с кодом "Товары_Количество"
					Тогда открылось окно "Источник данных (создание)*"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				Тогда открылось окно "Источники данных"
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Источник данных (создание)*"
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "Источник данных (создание)*" в течение 20 секунд
				Тогда открылось окно "Источники данных"
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Конструктор отчета*"
				И я нажимаю на кнопку с именем 'КнопкаПлюс'
			* Источник с прозвольным запросом №1
				Когда открылось окно "Конструктор отчета*"
				И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
				Тогда открылось окно "Источники данных"
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно "Источник данных (создание)"
				И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Произвольный запрос к текущей ИБ"
				И я изменяю флаг с именем 'ИспользоватьМногопериодныйКонтекст'
				И в поле с именем 'ТекстЗапросаФорма' я ввожу текст 'ВЫБРАТЬ 3 КАК ЗНАЧЕНИЕ'
				И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'
				И я перехожу к закладке с именем 'СоответствиеАналитик'
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Поле другого источника"
				И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				Когда открылось окно "Источники данных"
				И в таблице 'Список' я перехожу к строке:
					| "Наименование"                                          | "Способ получения"                                 | "Показатель отбор"  |
					| "ВА - Данные для дополнения аналитик_Товары количество" | "Показатель отчета текущей ИБ (простая настройка)" | "Товары количество" |
				И в таблице 'Список' я выбираю текущую строку				
				Тогда открылось окно "Источник данных (создание)*"
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "Источник данных (создание)*" в течение 20 секунд
				Тогда открылось окно "Источники данных"
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Конструктор отчета*"
				И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		* Трансформация аналитик
			* Источник данных для трансформации
				Когда открылось окно "Конструктор отчета"
				И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C2'
				И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
				Тогда открылось окно "Источники данных"
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно "Источник данных (создание)"
				И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Данные для дополнения аналитик"
				И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
				И Я выбираю показатель с кодом "Товары_Количество"
				Тогда открылось окно "Источник данных (создание) *"
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Фиксированное значение"
				И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				Тогда открылось окно "Статьи движения денежных средств"
				И я нажимаю на кнопку с именем 'ФормаНайти'
				Тогда открылась форма с именем 'UniversalListFindExtForm'
				И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
				И в поле с именем 'Pattern' я ввожу текст "Апгрейд программных продуктов"
				И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Статьи движения денежных средств"
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Источник данных (создание) *"
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
				Тогда открылось окно "Источники данных"
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Конструктор отчета *"
				И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'											
		* Рассчитываемый источник
			* Произвольный запрос к БД с многопериодным контекстом
				Когда открылось окно "Конструктор отчета"
				И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R5C2'
				И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
				Тогда открылось окно "Источники данных"
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно "Источник данных (создание)"
				И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Произвольный запрос к текущей ИБ"
				И в поле с именем 'ТекстЗапросаФорма' я ввожу текст 
					|'ВЫБРАТЬ'|
					|' Периоды.ДатаНачала КАК Дата,'|
					|' МЕСЯЦ(Периоды.ДатаОкончания) КАК Значение'|
					|'ИЗ'|
					|' Справочник.Периоды КАК Периоды'|
					|'ГДЕ'|
					|' Периоды.Ссылка В (&Периоды)'|
				И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'
				И я перехожу к закладке с именем 'СоответствиеАналитик'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Поле другого источника"
				И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				* Источник для заполнения Анилитики2
					Тогда открылось окно "Источники данных"
					И я нажимаю на кнопку с именем 'ФормаСоздать'
					Тогда открылось окно "Источник данных (создание)"
					И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Данные для дополнения аналитик"
					И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
					И Я выбираю показатель с кодом "СтатьиДДС_Количество"
					Тогда открылось окно "Источник данных (создание)*"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					Тогда открылось окно "Источники данных"
					И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Источник данных (создание) *"
				И в таблице 'ТаблицаСоответствия' я перехожу к строке:
					| "Аналитика приемника"       | "Вид аналитики" |
					| "Аналитика 3: Номенклатура" | "Номенклатура"  |
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Поле другого источника"
				И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				* Источник для заполненния Анилитики3
					Тогда открылось окно "Источники данных"
					И я нажимаю на кнопку с именем 'ФормаСоздать'
					Тогда открылось окно "Источник данных (создание)"
					И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Аналитики из полей других источников"
					И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
					И Я выбираю показатель с кодом "ТрансформациАналитик_Количество"
					Тогда открылось окно "Источник данных (создание)*"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					Тогда открылось окно "Источники данных"
					И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Источник данных (создание)*"
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "Источник данных (создание)*" в течение 20 секунд
				Тогда открылось окно "Источники данных"
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Конструктор отчета*"
				И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		* Пересчет в коде
			* Основной источник
				Когда открылось окно "Конструктор отчета"
				И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R6C2'
				И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
				Тогда открылось окно "Источники данных"
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно "Источник данных (создание)"
				И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Регистр сведений текущей ИБ"
				Если '$$ЭтоЕРПУХ$$' Тогда
					И из выпадающего списка с именем 'РегистрСведенийБД' я выбираю по строке 'ЦеныНоменклатуры25'
				Иначе
					И из выпадающего списка с именем 'РегистрСведенийБД' я выбираю по строке 'ЦеныНоменклатуры'
				И из выпадающего списка с именем 'ВидСреза' я выбираю точное значение "Срез последних"
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Поле другого источника"
				И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				* Источник с доп. аналитиками - Статьи ДДС 
					Тогда открылось окно "Источники данных"
					И я нажимаю на кнопку с именем 'ФормаСоздать'
					Тогда открылось окно "Источник данных (создание)"
					И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Аналитики из полей других источников"
					И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
					И Я выбираю показатель с кодом "ТрансформациАналитик_Количество"
					Тогда открылось окно "Источник данных (создание) *"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					Тогда открылось окно "Источники данных"
					И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Источник данных (создание)*"
				И в таблице 'ТаблицаСоответствия' я перехожу к строке:
					| "Аналитика приемника"       | "Вид аналитики" | "Имя колонки"    | "Способ заполнения" |
					| "Аналитика 3: Номенклатура" | "Номенклатура"  | "[Номенклатура]" | "Поле источника"    |
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Поле другого источника"
				И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				* Источник с доп. аналитиками - Товары 
					Тогда открылось окно "Источники данных"
					И я нажимаю на кнопку с именем 'ФормаСоздать'
					Тогда открылось окно "Источник данных (создание)"
					И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Аналитики из полей других источников"
					И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
					И Я выбираю показатель с кодом "ТекущаяФормула_Количество"
					Тогда открылось окно "Источник данных (создание) *"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					Тогда открылось окно "Источники данных"
					И в таблице 'Список' я выбираю текущую строку
				* Устанавливаем отборы
					Тогда открылось окно "Источник данных (создание)*"
					И я перехожу к закладке с именем 'СтраницаОтборы'
					И в таблице 'ДеревоПолейБД' я разворачиваю текущую строку
					И в таблице 'ДеревоПолейБД' я перехожу к строке:
						| "Поле"         |
						| "Номенклатура" |
					И я нажимаю на кнопку с именем 'ДобавитьЭлементУсловия'
					И в таблице 'ДеревоПараметровОтбораБД' я перехожу к строке:
						| "Поле"           |
						| "[Номенклатура]" |
					И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "Фиксированное значение"
					И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'УточнениеСпособаОпределения' я выбираю по строке "1С:Управление холдингом 8"
					И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
					Если '$$ЭтоУХ$$' Тогда
						И в таблице 'ДеревоПолейБД' я перехожу к строке:
							| "Поле"    |
							| "Тип цен" |
						И я нажимаю на кнопку с именем 'ДобавитьЭлементУсловия'
						И в таблице 'ДеревоПараметровОтбораБД' я перехожу к строке:
							| "Поле"      |
							| "[Тип цен]" |
					Если '$$ЭтоЕРПУХ$$' Тогда
						И в таблице 'ДеревоПолейБД' я перехожу к строке:
							| "Поле"    |
							| 'Вид цены' |
						И я нажимаю на кнопку с именем 'ДобавитьЭлементУсловия'
						И в таблице 'ДеревоПараметровОтбораБД' я перехожу к строке:
							| "Поле"       |
							| "[Вид цены]" |
					И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "Фиксированное значение"
					И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'УточнениеСпособаОпределения' я выбираю по строке "ВА - Номенклатура"
					И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "Источник данных (создание)*" в течение 20 секунд
				Тогда открылось окно "Источники данных"
				И в таблице 'Список' я выбираю текущую строку
			* Вводим формулу расчета
				Когда открылось окно "Конструктор отчета*"
				И я нажимаю на кнопку с именем 'ПроизвольныйКод'
				И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст ' '
				Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда					
					Если '$$ЭтоPerform$$' Тогда
						И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст 'Результат = Макс([IR_ЦеныНомен_Цена_], 1500000)'
					ИначеЕсли '$$ЭтоЕПРУХ$$' Тогда	
						И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст 'Результат = Макс([РС_ЦенНоме25_Цена_], 1500000)'
					Иначе
						И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст 'Результат = Макс([РС_ЦеныНомен_Цена_], 1500000)'
				Иначе
					И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст 'Result = Max([InformationRegister_ProRanPri_Price_], 1500000)' 
				И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
	
	И Я Для вида отчета "ВА - Аналитики из полей других источников" создаю бланк по умолчанию
	И Я Для вида отчета "ВА - Аналитики из полей других источников" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Номенклатура" "Артикул"
	И Я Для вида отчета "ВА - Аналитики из полей других источников" в бланке для группы раскрытия с адресом 'R10C1' задаю сортировку "Номенклатура" "Артикул"
	И Я Для вида отчета "ВА - Аналитики из полей других источников" в бланке для группы раскрытия с адресом 'R13C1' меняю сортировку "Номенклатура" "Наименование" на сортировку "Номенклатура" "Артикул"
	И Я Для вида отчета "ВА - Аналитики из полей других источников" в бланке для группы раскрытия с адресом 'R16C1' меняю сортировку "Номенклатура" "Наименование" на сортировку "Номенклатура" "Артикул"
	И Я Для вида отчета "ВА - Аналитики из полей других источников" в бланке для группы раскрытия с адресом 'R19C1' меняю сортировку "Номенклатура" "Наименование" на сортировку "Номенклатура" "Артикул"

Сценарий: 06.05 Создание экземпляра отчета "ВА - Аналитики из полей других источников"

	И Я создаю экземпляр отчета для вида отчета "ВА - Аналитики из полей других источников" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Меркурий ООО" проект '' аналитики "Программные продукты" '' '' '' '' ''
	И я запоминаю текущее окно как 'ЗаголовокОкна' 

	* Документ должен быть пустой
		И табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Аналитики из полей других источников" | ''               | ''                | ''             | ''           |
			| ''                                          | ''               | ''                | ''             | ''           |
			| ''                                          | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО"      |
			| ''                                          | "Количество"     | "Количество"      | "Количество"   | "Количество" |
			| "Текущая формула"                           | '0'              | '0'               | '0'            | '0'          |
			| "Другой источник"                           | '0'              | '0'               | '0'            | '0'          |
			| "Трансформация аналитик"                    | '0'              | '0'               | '0'            | '0'          |
			| "Рассчитываемый источник"                   | '0'              | '0'               | '0'            | '0'          |
			| "Пересчет в коде"                           | '0'              | '0'               | '0'            | '0'          |

	* Выполняем расчет
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'

	* Сравниваем результат
		Тогда открылось окно '$ЗаголовокОкна$'	
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Аналитики из полей других источников"                       | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО"      |
			| ''                                                                | "Количество"     | "Количество"      | "Количество"   | "Количество" |
			| "Текущая формула"                                                 | '12'             | '24'              | '36'           | '72'         |
			| "1С:Управление холдингом 8 "                                      | '4'              | '8'               | '12'           | '24'         |
			| "1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) "           | '2'              | '4'               | '6'            | '12'         |
			| "1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест " | '6'              | '12'              | '18'           | '36'         |
			| "Другой источник"                                                 | '15'             | '15'              | '15'           | '45'         |
			| "1С:Управление холдингом 8 "                                      | '5'              | '5'               | '5'            | '15'         |
			| "1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) "           | '5'              | '5'               | '5'            | '15'         |
			| "1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест " | '5'              | '5'               | '5'            | '15'         |
			| "Трансформация аналитик"                                          | '6'              | '12'              | '18'           | '36'         |
			| "Апгрейд программных продуктов "                                  | '6'              | '12'              | '18'           | '36'         |
			| "1С:Управление холдингом 8 "                                      | '2'              | '4'               | '6'            | '12'         |
			| "1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) "           | '1'              | '2'               | '3'            | '6'          |
			| "1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест " | '3'              | '6'               | '9'            | '18'         |
			| "Рассчитываемый источник"                                         | '6'              | '12'              | '9'            | '27'         |
			| ' '                                                               | '0'              | '0'               | '9'            | '9'          |
			| "1С:Управление холдингом 8 "                                      | '0'              | '0'               | '3'            | '3'          |
			| "1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) "           | '0'              | '0'               | '3'            | '3'          |
			| "1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест " | '0'              | '0'               | '3'            | '3'          |
			| "Внедрение программных продуктов "                                | '3'              | '6'               | '0'            | '9'          |
			| "1С:Управление холдингом 8 "                                      | '1'              | '2'               | '0'            | '3'          |
			| "1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) "           | '1'              | '2'               | '0'            | '3'          |
			| "1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест " | '1'              | '2'               | '0'            | '3'          |
			| "Реализация программных продуктов "                               | '3'              | '6'               | '0'            | '9'          |
			| "1С:Управление холдингом 8 "                                      | '1'              | '2'               | '0'            | '3'          |
			| "1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) "           | '1'              | '2'               | '0'            | '3'          |
			| "1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест " | '1'              | '2'               | '0'            | '3'          |
			| "Пересчет в коде"                                                 | '4 500 000'      | '4 500 000'       | '4 661 400'    | '13 661 400' |
			| "Апгрейд программных продуктов "                                  | '4 500 000'      | '4 500 000'       | '4 661 400'    | '13 661 400' |
			| "1С:Управление холдингом 8 "                                      | '1 500 000'      | '1 500 000'       | '1 553 800'    | '4 553 800'  |
			| "1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) "           | '1 500 000'      | '1 500 000'       | '1 553 800'    | '4 553 800'  |
			| "1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест " | '1 500 000'      | '1 500 000'       | '1 553 800'    | '4 553 800'  |
			
	* Записываем и закрываем документ
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: 06.06 Проверка на рекурсивное вложение дополнения аналитик

	И Я открываю контруктор отчета с именем "ВА - Аналитики из полей других источников"
	И Я в конструкторе отчета добавляю строку с именем 'Рекурсия в аналитиках'
	И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R7C3'

	* Вводим источники данных	
		Тогда открылось окно "Конструктор отчета"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Формулы расчета показателей"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R7C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
		Тогда открылось окно "Источники данных"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Источник данных (создание)"
		И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Аналитики из полей других источников"
		И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
		И Я выбираю показатель с кодом "ТекущаяФормула_Количество"
		Тогда открылось окно "Источник данных (создание)*"
		И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
		И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Поле другого источника"
		И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
		И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
		И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
		* Источник данных для дополнения аналитик №1
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно "Источник данных (создание)"
			И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Данные для дополнения аналитик"
			И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
			И Я выбираю показатель с кодом "Товары_Количество"
			Тогда открылось окно "Источник данных (создание) *"
			И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
			И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Поле другого источника"
			И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
			И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
			* Источник данных для дополнения аналитик №2
				Тогда открылось окно "Источники данных"
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно "Источник данных (создание)"
				И из выпадающего списка с именем 'ВидОтчетаОтбор' я выбираю по строке "ВА - Данные для дополнения аналитик"
				И я нажимаю кнопку выбора у поля с именем 'ПоказательОтбор'
				И Я выбираю показатель с кодом "Товары_Количество"
				Тогда открылось окно "Источник данных (создание)*"
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			Тогда открылось окно "Источники данных"
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "Источник данных (создание)*"
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		Тогда открылось окно "Источники данных"
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Источник данных (создание)*"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		* Получаем сообщение об ошибке
			Тогда открылось окно "1С:Предприятие"
			И я нажимаю на кнопку с именем 'OK'
			Затем я жду, что в сообщениях пользователю будет подстрока "Источник данных используемый для дополнения аналитик не может содержать способ заполнения аналитик \"Поле другого источника\"." в течение 30 секунд

	* Закрываем все окна
		Когда открылось окно "Источник данных (создание)*"
		И Я закрываю окно "Источник данных (создание)*"
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button1'
		Тогда открылось окно "Источники данных"
		И Я закрываю окно "Источники данных"
		Тогда открылось окно "Конструктор отчета"
		И я нажимаю на кнопку с именем 'ОтменаРедактированияФормулы'
	
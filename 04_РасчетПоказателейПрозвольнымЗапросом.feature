﻿#language: ru
@tree

Функционал: 04. Проверка произвольных запросов расчета показателей

Как Администратор я хочу
Проверить что произвольные запросы работают для расчета показателей
чтобы показатели рассчитывались без ошибок

Контекст: 

	И я подключаю TestClient 'УХ - Бюджетирование' логин "Администратор" пароль ''	
	И я закрыл все окна клиентского приложения

Сценарий: 04.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 04.01 Создание вида отчета 'ВА - Произвольный запрос'

	И Я создаю вид отчета с именем 'ВА - Произвольный запрос' и родителем 'ВА - Группа отчетов'
	
	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем 'ВА - Произвольный запрос'
		И Я в конструкторе отчета добавляю строку с именем 'Номенклатура'
		И Я в конструкторе отчета добавляю колонку с именем 'Цена'
		И Я в конструкторе отчета добавляю аналитику с кодом 'ВА0Номенкл' в ячейку 'R2C2' 

	И Я Для вида отчета 'ВА - Произвольный запрос' я создаю бланк по умолчанию

Сценарий: 04.02 Проверка поведения формы настройки показателей

	И Я открываю контруктор отчета с именем 'ВА - Произвольный запрос'
				
	* Вводим формулу расчета	
		Тогда открылось окно "Конструктор отчета"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Формулы расчета показателей"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст ' '
		И я нажимаю на кнопку с именем 'ДобавитьОперанд1'

	* Проверяем поведение формы при расширенном движке расчета показателей
		Тогда открылось окно "Источники данных"
		И я нажимаю на кнопку с именем 'ФормаСоздать'			
		Когда открылось окно "Источник данных (создание)"
		И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Показатель отчета текущей ИБ"
		И элемент формы с именем 'ИспользоватьМногопериодныйКонтекст' отсутствует на форме
		И элемент формы с именем 'Справка' отсутствует на форме
		И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Регистр накопления текущей ИБ"
		И элемент формы с именем 'ИспользоватьМногопериодныйКонтекст' отсутствует на форме
		И элемент формы с именем 'Справка' отсутствует на форме
		И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Регистр бухгалтерии текущей ИБ"
		И элемент формы с именем 'ИспользоватьМногопериодныйКонтекст' отсутствует на форме
		И элемент формы с именем 'Справка' отсутствует на форме
		И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Регистр сведений текущей ИБ"
		И элемент формы с именем 'ИспользоватьМногопериодныйКонтекст' отсутствует на форме
		И элемент формы с именем 'Справка' отсутствует на форме
		И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Справочник текущей ИБ"
		И элемент формы с именем 'ИспользоватьМногопериодныйКонтекст' отсутствует на форме
		И элемент формы с именем 'Справка' отсутствует на форме
		И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Произвольный запрос к текущей ИБ"
		И элемент формы с именем 'ИспользоватьМногопериодныйКонтекст' присутствует на форме
		И элемент формы с именем 'Справка' присутствует на форме			
		И я нажимаю на кнопку с именем 'Справка'
		Тогда открылось окно "Справка"
		И Я закрываю окно "Справка"

	* Устанавливаем текст запроса
		Когда открылось окно "Источник данных (создание) *"
		Если '$$ЭтоУХ$$' Тогда 
			И в поле с именем 'ТекстЗапросаФорма' я ввожу текст 
				|'ВЫБРАТЬ'|
				|'	ЦеныНоменклатуры.Период КАК Дата,'|
				|'	ЦеныНоменклатуры.Номенклатура КАК Номенклатура,'|
				|'	МАКСИМУМ(ЦеныНоменклатуры.Цена) КАК Цена'|
				|'ПОМЕСТИТЬ втРасчетная'|
				|'ИЗ'|
				|'	РегистрСведений.ЦеныНоменклатуры КАК ЦеныНоменклатуры'|
				|'ГДЕ'|
				|'	ЦеныНоменклатуры.Период >= &ПериодНачала'|
				|'	И ЦеныНоменклатуры.Период <= &ПериодОкончания'|
				|'	И ЦеныНоменклатуры.ТипЦен = &ТипЦен'|
				|''|
				|'СГРУППИРОВАТЬ ПО'|
				|'	ЦеныНоменклатуры.Период,'|
				|'	ЦеныНоменклатуры.Номенклатура'|
				|';'|
				|''|
				|'////////////////////////////////////////////////////////////////////////////////'|
				|'ВЫБРАТЬ'|
				|'	втРасчетная.Дата КАК Дата,'|
				|'	втРасчетная.Номенклатура КАК Номенклатура,'|
				|'	втРасчетная.Цена КАК Цена'|
				|'ИЗ'|
				|'	втРасчетная КАК втРасчетная'|
		Если '$$ЭтоЕРПУХ$$' Тогда
			И в поле с именем 'ТекстЗапросаФорма' я ввожу текст 
				|'ВЫБРАТЬ'|
				|'	ЦеныНоменклатуры.Период КАК Дата,'|
				|'	ЦеныНоменклатуры.Номенклатура КАК Номенклатура,'|
				|'	МАКСИМУМ(ЦеныНоменклатуры.Цена) КАК Цена'|
				|'ПОМЕСТИТЬ втРасчетная'|
				|'ИЗ'|
				|'	РегистрСведений.ЦеныНоменклатуры КАК ЦеныНоменклатуры'|
				|'ГДЕ'|
				|'	ЦеныНоменклатуры.Период >= &ПериодНачала'|
				|'	И ЦеныНоменклатуры.Период <= &ПериодОкончания'|
				|'	И ЦеныНоменклатуры.ВидЦены = &ТипЦен'|
				|''|
				|'СГРУППИРОВАТЬ ПО'|
				|'	ЦеныНоменклатуры.Период,'|
				|'	ЦеныНоменклатуры.Номенклатура'|
				|';'|
				|''|
				|'////////////////////////////////////////////////////////////////////////////////'|
				|'ВЫБРАТЬ'|
				|'	втРасчетная.Дата КАК Дата,'|
				|'	втРасчетная.Номенклатура КАК Номенклатура,'|
				|'	втРасчетная.Цена КАК Цена'|
				|'ИЗ'|
				|'	втРасчетная КАК втРасчетная'|
		И я нажимаю на кнопку с именем 'КонструкторЗапроса'
		Тогда открылось окно "Конструктор запроса"
		И Я закрываю окно "Конструктор запроса"
		Тогда открылось окно "Источник данных (создание) *"
		И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'
		И я перехожу к закладке с именем 'СоответствиеАналитик'
		
	* Проверяем заполнение таблиц
		Когда открылось окно "Источник данных (создание) *"
		И в таблице 'ДеревоПолейБД' я разворачиваю строку:
			| "Поле"                 |
			| "Параметры запроса(3)" |
		И в таблице 'ДеревоПолейБД' я разворачиваю строку
			| "Поле"                 |
			| "Поля источника данных(3)" |				
		Тогда таблица 'ДеревоПолейБД' стала равной:
			| "Поле"                     |
			| "Параметры запроса(3)"     |
			| 'ПериодНачала'             |
			| 'ПериодОкончания'          |
			| 'ТипЦен'                   |
			| "Поля источника данных(3)" |
			| 'Дата'                     |
			| 'Номенклатура'             |
			| 'Цена'                     |
		Тогда таблица 'ТаблицаСоответствия' стала равной:
			| "Аналитика приемника"       | "Способ заполнения" | "Имя колонки"  | "Вид аналитики" |
			| 'Аналитика 1: Номенклатура' | "Поле источника"    | 'Номенклатура' | 'Номенклатура'  |
			| 'Значение'                  | "Поле источника"    | 'Цена'         | ''              |
			| 'Период'                    | "Поле источника"    | 'Дата'         | ''              |
		И я перехожу к закладке с именем 'СтраницаОтборы'
		Когда открылось окно "Источник данных (создание) *"
		Тогда таблица 'ДеревоПараметровОтбораБД' стала равной:
			| "Поле"            | "Отбор" | "Уточнение отбора" | "Значение для проверки" |
			| 'ПериодНачала'    | ''      | ''                 | ''                      |
			| 'ПериодОкончания' | ''      | ''                 | ''                      |
			| 'ТипЦен'          | ''      | ''                 | ''                      |	

	* Заполняем параметры		
		Когда открылось окно "Источник данных (создание) *"	
		И в таблице 'ДеревоПараметровОтбораБД' я перехожу к строке:
			| "Поле"            |
			| 'ПериодНачала'	|	
		И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "Дата начала периода отчета"
		И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
		И в таблице 'ДеревоПараметровОтбораБД' я перехожу к строке:
			| "Поле"            |
			| 'ПериодОкончания' |
		И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
		И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "Дата конца периода отчета"
		И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
		И в таблице 'ДеревоПараметровОтбораБД' я перехожу к строке:
			| "Поле"   |
			| 'ТипЦен' |
		И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
		И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "Фиксированное значение"
		И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'УточнениеСпособаОпределения'
		И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'УточнениеСпособаОпределения' я выбираю по строке 'ВА - Номенклатура'
		И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
		Тогда таблица 'ДеревоПараметровОтбораБД' стала равной:
			| "Поле"            | "Отбор"                      | "Уточнение отбора"  | "Значение для проверки" |
			| 'ПериодНачала'    | "Дата начала периода отчета" | ''                  | ''                      |
			| 'ПериодОкончания' | "Дата конца периода отчета"  | ''                  | ''                      |
			| 'ТипЦен'          | "Фиксированное значение"     | 'ВА - Номенклатура' | ''                      |

	* Записываем элемент
		Когда открылось окно "Источник данных (создание) *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
		Тогда открылось окно "Источники данных"
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Конструктор отчета *"
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'

Сценарий: 04.03 Создание экземпляра отчета - 'ВА - Основной сценарий' с использованием многопериодного контекста

	И Я создаю экземпляр отчета для вида отчета 'ВА - Произвольный запрос' сценарий 'ВА - Основной сценарий' период '01.01.2021' '31.03.2021' периодичность "Месяц" организация 'Меркурий ООО' проект '' аналитики '' '' '' '' '' ''

	* Документ должен быть пустой
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| 'ВА - Произвольный запрос' | ''               | ''                | ''             | ''      |
			| ''                         | ''               | ''                | ''             | ''      |
			| ''                         | 'Январь 2021 г.' | 'Февраль 2021 г.' | 'Март 2021 г.' | 'ИТОГО' |
			| ''                         | 'Цена'           | 'Цена'            | 'Цена'         | 'Цена'  |
			| 'Номенклатура'             | '0'              | '0'               | '0'            | '0'     |

	* Рассчитываем значения показателей	
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| 'ВА - Произвольный запрос'                                        | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | 'Январь 2021 г.' | 'Февраль 2021 г.' | 'Март 2021 г.' | 'ИТОГО'      |
			| ''                                                                | 'Цена'           | 'Цена'            | 'Цена'         | 'Цена'       |
			| 'Номенклатура'                                                    | '6 030 000'      | '6 633 000'       | '7 495 400'    | '20 158 400' |
			| '1С:ERP. Управление холдингом '                                   | '1 950 000'      | '2 145 000'       | '2 423 900'    | '6 518 900'  |
			| '1С:Корпорация '                                                  | '2 050 000'      | '2 255 000'       | '2 548 200'    | '6 853 200'  |
			| '1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест ' | '600 000'        | '660 000'         | '745 800'      | '2 005 800'  |
			| '1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) '           | '180 000'        | '198 000'         | '223 700'      | '601 700'    |
			| '1С:Управление холдингом 8 '                                      | '1 250 000'      | '1 375 000'       | '1 553 800'    | '4 178 800'  |

	* Записываем документ
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: 04.04 Проверка поведениея формы настройки показателей без использования многопериодного контекста

	И Я открываю контруктор отчета с именем 'ВА - Произвольный запрос'

	* Снимаем флаг многопериодного контекста у источника данных	
		Тогда открылось окно "Конструктор отчета"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Формулы расчета показателей"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
		Когда открылось окно "Источники данных"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем 'Список'
		Тогда открылось окно "Произвольный запрос к текущей ИБ (Источник данных)"
		И я запоминаю текущее окно как 'ЗаголовокОкна'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

	* Проверяем поведение формы при расширенном движке расчета показателей		
		Тогда открылось окно "Источники данных"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем 'Список'
		Тогда открылось окно '$ЗаголовокОкна$'
		И элемент формы с именем 'ИспользоватьМногопериодныйКонтекст' присутствует на форме
		И элемент формы с именем 'Справка' присутствует на форме
		И я снимаю флаг с именем 'ИспользоватьМногопериодныйКонтекст'
		Если 'НЕ $$ЭтоCPMWE$$' Тогда
			// ДОДЕЛАТЬ: В текущей версии УХ отборы не очищаются
			Тогда таблица 'ДеревоПараметровОтбораБД' стала равной:
				| "Поле"              | "Отбор"                      | "Уточнение отбора"  | "Значение для проверки" |
				| '[ПериодНачала]'    | "Дата начала периода отчета" | ''                  | ''                      |
				| '[ПериодОкончания]' | "Дата конца периода отчета"  | ''                  | ''                      |
				| '[ТипЦен]'          | "Фиксированное значение"     | 'ВА - Номенклатура' | ''                      |
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И флаг с именем 'ИспользоватьМногопериодныйКонтекст' равен 'Ложь'												
								
	* Проверяем заполнение таблиц
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'
		И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'				
		И в таблице 'ДеревоПолейБД' я разворачиваю строку:
			| "Поле"                 |
			| "Параметры запроса(3)" |
		И в таблице 'ДеревоПолейБД' я разворачиваю строку
			| "Поле"                 |
			| "Поля источника данных(3)" |				
		Тогда таблица 'ДеревоПолейБД' стала равной:
			| "Поле"                     |
			| "Параметры запроса(3)"     |
			| 'ПериодНачала'             |
			| 'ПериодОкончания'          |
			| 'ТипЦен'                   |
			| "Поля источника данных(3)" |
			| 'Дата'                     |
			| 'Номенклатура'             |
			| 'Цена'                     |
		Тогда таблица 'ТаблицаСоответствия' стала равной:
			| "Аналитика приемника"       | "Способ заполнения" | "Имя колонки"  | "Вид аналитики" |
			| 'Аналитика 1: Номенклатура' | "Поле источника"    | 'Номенклатура' | 'Номенклатура'  |
			| 'Значение'                  | "Поле источника"    | 'Цена'         | ''              |
		И я перехожу к закладке с именем 'СтраницаОтборы'
		Когда открылось окно '$ЗаголовокОкна$'
		Тогда таблица 'ДеревоПараметровОтбораБД' стала равной:
			| "Поле"              | "Отбор"                      | "Уточнение отбора"  | "Значение для проверки" |
			| '[ПериодНачала]'    | "Дата начала периода отчета" | ''                  | ''                      |
			| '[ПериодОкончания]' | "Дата конца периода отчета"  | ''                  | ''                      |
			| '[ТипЦен]'          | "Фиксированное значение"     | 'ВА - Номенклатура' | ''                      |
	 			
	* Закрываем источник данных
		Когда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'
		Тогда открылось окно "Источники данных"
		И Я закрываю окно "Источники данных"
		Тогда открылось окно "Конструктор отчета"
		И я нажимаю на кнопку с именем 'ОтменаРедактированияФормулы'

Сценарий: 04.05 Создание экземпляра отчета - 'ВА - Основной сценарий' без использования многопериодного контекста

	И Я создаю экземпляр отчета для вида отчета 'ВА - Произвольный запрос' сценарий 'ВА - Основной сценарий' период '01.01.2021' '31.03.2021' периодичность "Месяц" организация 'Венера ООО' проект '' аналитики '' '' '' '' '' ''

	* Документ должен быть пустой
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| 'ВА - Произвольный запрос' | ''               | ''                | ''             | ''      |
			| ''                         | ''               | ''                | ''             | ''      |
			| ''                         | 'Январь 2021 г.' | 'Февраль 2021 г.' | 'Март 2021 г.' | 'ИТОГО' |
			| ''                         | 'Цена'           | 'Цена'            | 'Цена'         | 'Цена'  |
			| 'Номенклатура'             | '0'              | '0'               | '0'            | '0'     |

	* Рассчитываем значения показателей	
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| 'ВА - Произвольный запрос'                                        | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | 'Январь 2021 г.' | 'Февраль 2021 г.' | 'Март 2021 г.' | 'ИТОГО'      |
			| ''                                                                | 'Цена'           | 'Цена'            | 'Цена'         | 'Цена'       |
			| 'Номенклатура'                                                    | '6 030 000'      | '6 633 000'       | '7 495 400'    | '20 158 400' |
			| '1С:ERP. Управление холдингом '                                   | '1 950 000'      | '2 145 000'       | '2 423 900'    | '6 518 900'  |
			| '1С:Корпорация '                                                  | '2 050 000'      | '2 255 000'       | '2 548 200'    | '6 853 200'  |
			| '1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест ' | '600 000'        | '660 000'         | '745 800'      | '2 005 800'  |
			| '1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) '           | '180 000'        | '198 000'         | '223 700'      | '601 700'    |
			| '1С:Управление холдингом 8 '                                      | '1 250 000'      | '1 375 000'       | '1 553 800'    | '4 178 800'  |

	* Записываем документ
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

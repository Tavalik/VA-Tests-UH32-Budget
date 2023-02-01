﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Бюджетирование'

Сценарий: Я для вида отчета 'TheReportKindName' изменяю флаг 'TheFlagName' 

	И Я открываю вид отчета с именем '[TheReportKindName]'

	И я изменяю флаг с именем '[TheFlagName]'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "[TheReportKindName] (Виды отчетов)" в течение 20 секунд	

	Тогда открылось окно "Виды и бланки отчетов"
	И я закрываю окно "Виды и бланки отчетов"

Сценарий: Я открываю контруктор отчета с именем 'TheReportKindName'

	И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
	И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'ОткрытьКонструктор'

Сценарий: Я в конструкторе отчета добавляю строку с именем 'TheLineName' 

	Когда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьСтроки'
	Тогда открылось окно "Добавление новых строк"
	И в таблице 'НовыеСтроки' я нажимаю на кнопку с именем 'НовыеСтрокиДобавить'
	И в таблице 'НовыеСтроки' в поле с именем 'НовыеСтрокиНаименование' я ввожу текст '[TheLineName]'
	И в таблице 'НовыеСтроки' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ОК'

Сценарий: Я в конструкторе отчета добавляю колонку с именем 'TheColumnName' 

	Тогда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьКолонку'
	Тогда открылось окно "Добавление новых колонок"
	И в таблице 'НовыеСтроки' я нажимаю на кнопку с именем 'НовыеСтрокиДобавить'
	И в таблице 'НовыеСтроки' в поле с именем 'НовыеСтрокиНаименование' я ввожу текст '[TheColumnName]'
	И в таблице 'НовыеСтроки' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ОК'

Сценарий: Я в конструкторе отчета добавляю аналитику с кодом 'TheDimensionCode' в ячейку 'TheCellAddress' 

	Тогда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Аналитики показателей"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Код"
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И в поле с именем 'Pattern' я ввожу текст '[TheDimensionCode]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И в таблице 'Список' я выбираю текущую строку

Сценарий: Я в конструкторе отчета добавляю аналитику с наименованием 'TheDimensionName' в ячейку 'TheCellAddress' 

	Тогда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Аналитики показателей"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И в поле с именем 'Pattern' я ввожу текст '[TheDimensionCode]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И в таблице 'Список' я выбираю текущую строку	

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' я меняю родителя у строки на 'TheParentName'

	Тогда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Строки отчетов)"
	И из выпадающего списка с именем 'Родитель' я выбираю по строке '[TheParentName]'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "* (Строки отчетов) *" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' я меняю свойство показателя 'TheProperty' на 'TheValue'

	Когда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Показатели отчетов)"
	Если '"[TheValue]" = "Истина" ИЛИ "[TheValue]" = "True"' Тогда
		И я устанавливаю флаг с именем '[TheProperty]'
	ИначеЕсли '"[TheValue]" = "Ложь" ИЛИ "[TheValue]" = "False"' Тогда
		И я снимаю флаг с именем '[TheProperty]'
	Иначе
		И из выпадающего списка с именем '[TheProperty]' я выбираю точное значение "[TheValue]"										
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "* (Показатели отчетов)" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' я меняю свойства показателей 'TheProperty' на 'TheValue'

	Когда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И я выбираю пункт контекстного меню с именем 'ПолеТабличногоДокументаМакетКонтекстноеМенюСвойства' на элементе формы с именем 'ПолеТабличногоДокументаМакет'
	Тогда открылось окно "Групповое изменение показателей"
	И я изменяю флаг с именем '[TheProperty]Изменить'
	И из выпадающего списка с именем '[TheProperty]' я выбираю точное значение "[TheValue]"
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

Сценарий: Я октрываю сводную таблицу отчета с именем 'TheReportKindName'

	И Я нахожу в списке вид отчета с именем '[TheReportKindName]'

	Когда открылось окно "Виды и бланки отчетов"
	И я запоминаю строку '[TheReportKindName]' в переменную 'ReportKindName'
	И в таблице 'Список' я перехожу к строке по шаблону:
		| "Наименование"                       |
		| '$ReportKindName$ (сводная таблица)' |
	И я нажимаю на кнопку с именем 'ПерейтиВРежимОтображенияДанных'
	И я жду открытия формы "Сводная таблица: *" в течение 30 секунд

	И Открылась сводная таблица для вида отчета 'TheReportKindName'	
		
Сценарий: Я устанавливаю отбор сводной таблицы 'TheFilterName' со значением 'TheFilterValue'

	Когда открылось окно "Сводная таблица: *"
	И я нажимаю на гиперссылку с именем 'ОтборыЗаголовок'
	И я жду открытия формы "Сводная таблица: *" в течение 20 секунд
	Если элемент '[TheFilterName]' присутствует на форме Тогда
		И из выпадающего списка с именем '[TheFilterName]' я выбираю по строке '[TheFilterValue]'
		И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы1'
	ИначеЕсли элемент 'Элемент_[TheFilterName]' присутствует на форме Тогда
		И из выпадающего списка с именем 'Элемент_[TheFilterName]' я выбираю по строке '[TheFilterValue]'
		И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы1'	
	И я жду открытия формы "Сводная таблица: *" в течение 20 секунд

Сценарий: Я устанавливаю отборы сводной таблицы: дата начала 'TheStartDate', дата конца 'TheEndDate', валюта 'TheCurrency', сценарий 'TheScenario', организация 'TheBusinessUnit'	

	Когда открылось окно "Сводная таблица: *"
	И я нажимаю на гиперссылку с именем 'ОтборыЗаголовок'
	И я нажимаю на кнопку с именем 'ИзменитьПериод'
	Тогда открылось окно "Выберите период"
	И в поле с именем 'DateBegin' я ввожу текст '[TheStartDate]'
	И я перехожу к следующему реквизиту
	И в поле с именем 'DateEnd' я ввожу текст '[TheEndDate]'
	И я нажимаю на кнопку с именем 'Select'
	Тогда открылось окно "Сводная таблица: *"
	И из выпадающего списка с именем 'ВалютаОтображения' я выбираю по строке '[TheCurrency]'
	И из выпадающего списка с именем 'Элемент_Сценарий' я выбираю по строке '[TheScenario]'
	И из выпадающего списка с именем 'Элемент_Организация' я выбираю по строке '[TheBusinessUnit]'
	И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы1'
	И я жду открытия формы "Сводная таблица: *" в течение 20 секунд

Сценарий: Я Для вида отчета 'TheReportKindName' я создаю бланк для импорта по умолчанию

	* Откроем вид отчета
		Если открылось окно "[TheReportKindName] (Виды отчетов)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'

	* Создаем Бланк экземпляра отчета
		Тогда открылось окно "[TheReportKindName] (Виды отчетов)"
		И я перехожу к закладке с именем 'НастройкиПоУмолчанию'
		Когда открылось окно "[TheReportKindName] (Виды отчетов)"
		И я нажимаю на кнопку открытия поля с именем 'БланкДляИмпортаПоУмолчанию'
		Тогда открылось окно "Бланк [TheReportKindName] вида отчета: [TheReportKindName]"
		И я нажимаю на кнопку с именем 'ФормаВолшебнаяПалочка'
		Тогда открылось окно "Что делать?"
		И я нажимаю на кнопку с именем 'СоздатьНовыйБланк'
		И я нажимаю на кнопку с именем 'КомандаСформироватьМакетЗаново'
		Тогда открылось окно "Бланк [TheReportKindName] вида отчета: [TheReportKindName] *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Бланк [TheReportKindName] вида отчета: [TheReportKindName] *" в течение 5 секунд

Сценарий: Я Для вида отчета 'TheReportKindName' я создаю бланк по умолчанию

	* Откроем вид отчета
		Если открылось окно "[TheReportKindName] (Виды отчетов)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'
	
	* Формируем Бланк экземпляра отчета
		Когда открылось окно "[TheReportKindName] (Виды отчетов)"
		И я перехожу к закладке с именем 'НастройкиПоУмолчанию'
		И я нажимаю на кнопку открытия поля с именем 'БланкОтображенияПоУмолчаниюМногопериодный'
		Тогда открылось окно "Бланк [TheReportKindName] вида отчета: [TheReportKindName]"
		И я нажимаю на кнопку с именем 'ФормаСоздатьМакетИмпорта'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Структура отчета"
		Если поле с именем 'ШаблонОформленияБланковОтчетов' существует тогда
			И из выпадающего списка с именем 'ШаблонОформленияБланковОтчетов' я выбираю по строке "Классический"
		Если поле с именем 'ВыводитьРеквизиты' существует тогда
			И я изменяю флаг с именем 'ВыводитьРеквизиты'
		И я нажимаю на кнопку с именем 'ФормаВыбрать'	

	* Записываем бланк	
		Тогда открылось окно "Бланк [TheReportKindName] вида отчета: [TheReportKindName] *"
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписатьИЗакрыть'
		И я жду закрытия окна "Бланк [TheReportKindName] вида отчета: [TheReportKindName] *" в течение 20 секунд		

Сценарий: Я Для вида отчета 'TheReportKindName' в бланке для группы раскрытия с адресом 'TheCellAddress' задаю сортировку 'TheSorting'

	* Откроем вид отчета
		Если открылось окно "[TheReportKindName] (Виды отчетов)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'
	
	* Открываем бланк по умолчанию
		Когда открылось окно "[TheReportKindName] (Виды отчетов)"
		И я перехожу к закладке с именем 'НастройкиПоУмолчанию'
		И я нажимаю на кнопку открытия поля с именем 'БланкОтображенияПоУмолчаниюМногопериодный'
		Тогда открылось окно "Бланк [TheReportKindName] вида отчета: [TheReportKindName]"

	* Добавляем сортировку
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCellAddress]'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Настройка области аналитического раскрытия"
		И я перехожу к закладке с именем 'РазделСортировка'
		И в таблице 'КомпоновщикНастроекНастройкиПорядок' я выбираю текущую строку
		И в таблице 'КомпоновщикНастроекНастройкиПорядок' из выпадающего списка с именем 'КомпоновщикНастроекНастройкиПорядокПоле' я выбираю по строке '[TheSorting]'
		И в таблице 'КомпоновщикНастроекНастройкиПорядок' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Применить'
				
	* Записываем бланк	
		Тогда открылось окно "Бланк [TheReportKindName] вида отчета: [TheReportKindName] *"
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписатьИЗакрыть'
		И я жду закрытия окна "Бланк [TheReportKindName] вида отчета: [TheReportKindName] *" в течение 20 секунд

Сценарий: Я Для вида отчета 'TheReportKindName' я создаю бланк сводной таблицы по умолчанию с отборами 'TheFilter1' 'TheFilter2' 'TheFilter3'

	* Откроем вид отчета
		// Вариант открытия из формы
		Если открылось окно "[TheReportKindName] (Виды отчетов)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'
		Когда открылось окно "[TheReportKindName] (Виды отчетов)"
		И я перехожу к закладке с именем 'НастройкиПоУмолчанию'
		И я нажимаю на кнопку открытия поля с именем 'БланкСводнойТаблицыПоУмолчанию'

	* Формируем Бланк сводной таблиц
		Тогда Открылся бланк сводной таблицы для вида отчета '[TheReportKindName]'
		И я запоминаю текущее окно как 'ЗаголовокОкна'
		И я нажимаю на кнопку с именем 'ПоказатьСоставСтрок'
		Тогда открылось окно "Настройка состава строк"
		И я нажимаю на кнопку с именем 'ПеренестиВлевоВсе'
		И я нажимаю на кнопку с именем 'ПрименитьИзменения'
		Тогда открылось окно '$ЗаголовокОкна$ *'
		И я нажимаю на кнопку с именем 'ПоказатьСоставКолонок'
		Тогда открылось окно "Настройка состава колонок"
		И в таблице 'НастройкиСоставаКолонокСводнойТаблицы' я нажимаю на кнопку с именем 'НастройкиСоставаКолонокСводнойТаблицыЗаполнитьКолонки'
		И я нажимаю на кнопку с именем 'ФормаПрименить'
		Тогда открылось окно '$ЗаголовокОкна$ *'
		И я нажимаю на кнопку с именем 'ПоказатьНастройкиТаблицыПоОсям'
		Тогда открылось окно "Настройка расположения полей"
		И я запоминаю строку '[TheFilter1]' в переменную 'ИмяПоля'
		Если в таблице 'ТаблицаДоступныеПоля' есть строка Тогда
			| "Доступные аналитики" |
			| '$ИмяПоля$'           |
			И в таблице 'ТаблицаДоступныеПоля' я перехожу к строке:
				| "Доступные аналитики" |
				| '$ИмяПоля$'           |
			И я выбираю пункт контекстного меню с именем 'ТаблицаДоступныеПоляКонтекстноеМенюПеренестиВОтборы' на элементе формы с именем 'ТаблицаДоступныеПоля'
		И я запоминаю строку '[TheFilter2]' в переменную 'ИмяПоля'	
		Если в таблице 'ТаблицаДоступныеПоля' есть строка Тогда
			| "Доступные аналитики" |
			| '$ИмяПоля$'           |
			И в таблице 'ТаблицаДоступныеПоля' я перехожу к строке:
				| "Доступные аналитики" |
				| '$ИмяПоля$'           |
			И я выбираю пункт контекстного меню с именем 'ТаблицаДоступныеПоляКонтекстноеМенюПеренестиВОтборы' на элементе формы с именем 'ТаблицаДоступныеПоля'
		И я запоминаю строку '[TheFilter3]' в переменную 'ИмяПоля'	
		Если в таблице 'ТаблицаДоступныеПоля' есть строка Тогда
			| "Доступные аналитики" |
			| '$ИмяПоля$'           |
			И в таблице 'ТаблицаДоступныеПоля' я перехожу к строке:
				| "Доступные аналитики" |
				| '$ИмяПоля$'           |
			И я выбираю пункт контекстного меню с именем 'ТаблицаДоступныеПоляКонтекстноеМенюПеренестиВОтборы' на элементе формы с именем 'ТаблицаДоступныеПоля'		
		И Пока в таблице 'ТаблицаДоступныеПоля' количество строк 'больше' 0 Тогда
			И я выбираю пункт контекстного меню с именем 'ТаблицаДоступныеПоляКонтекстноеМенюПеренестиВСтроки' на элементе формы с именем 'ТаблицаДоступныеПоля'
		И я запоминаю строку "Проект" в переменную 'ИмяПоля'
		Если '"[TheFilter1]" <> "$ИмяПоля$" И "[TheFilter2]" <> "$ИмяПоля$" И "[TheFilter3]" <> "$ИмяПоля$"' Тогда
			Когда открылось окно "Настройка расположения полей"
			И в таблице 'ТаблицаСтроки' я перехожу к строке:
				| "По горизонтали (в строках)" |
				| "Проект"                     |
			И я выбираю пункт контекстного меню с именем 'ТаблицаСтрокиКонтекстноеМенюПеренестиВДоступныеПоля' на элементе формы с именем 'ТаблицаСтроки'
			
		И я нажимаю на кнопку с именем 'СтрокиПереместитьВВерх'
		И я нажимаю на кнопку с именем 'СтрокиПереместитьВниз'
		И я нажимаю на кнопку с именем 'ВаринатРасположенияАналитик'
		И в меню формы я выбираю "Аналитики в иерархии"
		И я устанавливаю флаг с именем 'ИтогПоКолонокам'
		И в таблице 'ТаблицаКолонки' я перехожу к строке:
			| "По вертикали (в колонках)" |
			| "Колонки отчетов"           |
		И я нажимаю на кнопку с именем 'КолонкиПереместитьВВерх'
		И я нажимаю на кнопку с именем 'КолонкиПереместитьВниз'
		И я нажимаю на кнопку с именем 'КнопкаПрименить'
		
		Тогда открылось окно '$ЗаголовокОкна$ *'		
		И я нажимаю на кнопку с именем 'ПоказатьНастройкиПериодов'
		И я нажимаю на кнопку с именем 'ФормаПрименить'

	* Сохраняем
		Тогда открылось окно '$ЗаголовокОкна$ *'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$ *' в течение 20 секунд

Сценарий: Я для регламента 'TheRegulationName' изменяю флаг 'TheFlagName'

	И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Регламенты подготовки отчетности"
	Тогда открылось окно "Регламенты подготовки отчетности"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылось окно "Найти"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
	И в поле с именем 'Pattern' я ввожу текст '[TheRegulationName]'
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Регламенты подготовки отчетности"
	И в таблице 'Список' я выбираю текущую строку
	Тогда Открылся регламент подготовки отчетности 'TheRegulationName'
	И я перехожу к закладке с именем 'ГруппаСтраницаОсновная'
	И я изменяю флаг с именем '[TheFlagName]'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: Я вставляю из буфера обмена в макете

	И я очищаю окно сообщений пользователю		
	И я делаю 3 раз
		И я нажимаю на кнопку с именем 'ВставитьИзБуфераМакет'
		Если в текущем окне есть сообщения пользователю Тогда
			И Пауза 3
		Иначе
			И я прерываю цикл

Сценарий: Я ввожу значение 'TheValue' в ячейку 'TheCellAddress'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	И в табличный документ 'ПолеТабличногоДокументаМакет' я ввожу текст '[TheValue]'

Сценарий: Я ввожу значение 'TheValue' с раскрытием показателей в ячейку 'TheCellAddress'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	Тогда открылось окно "Раскрытие показателей: *"
	И в таблице 'РаскрытиеПоказателей' я выбираю текущую строку
	И в таблице 'РаскрытиеПоказателей' в поле с именем 'Значение' я ввожу текст '[TheValue]'
	И я нажимаю на кнопку с именем 'ФормаКнопкаОК'

	И я жду закрытия окна "Раскрытие показателей: *" в течение 20 секунд	

Сценарий: Я изменяю значение на 'TheValue' процентов в ячейке 'TheCellAddress'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCellAddress]'
	И я нажимаю на кнопку с именем 'ИзменитьПоказатели'
	Тогда открылось окно "Изменение значений"
	И я меняю значение переключателя с именем 'ВидКорректировки' на "Процент"
	И в поле с именем 'ЗначениеКорректировки' я ввожу текст '[TheValue]'
	И я нажимаю на кнопку с именем 'Применить'

Сценарий: Я изменяю значение на 'TheValue' в ячейке 'TheCellAddress'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCellAddress]'
	И я нажимаю на кнопку с именем 'ИзменитьПоказатели'
	Тогда открылось окно "Изменение значений"
	И я меняю значение переключателя с именем 'ВидКорректировки' на "Значение"
	И в поле с именем 'ЗначениеКорректировки' я ввожу текст '[TheValue]'
	И я нажимаю на кнопку с именем 'Применить'

Сценарий: Я добавляю значения с раскрытием показателей в ячейку 'TheCellAddress'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	
	Тогда открылось окно "Раскрытие показателей: *"
	И я заполняю таблицу 'РаскрытиеПоказателей' данными
		| 'Таблица' |

	И я нажимаю на кнопку с именем 'ФормаКнопкаОК'
	И я жду закрытия окна "Раскрытие показателей: *" в течение 20 секунд

Сценарий: Я создаю экземпляр отчета для вида отчета 'TheReportKind' сценарий 'TheScenario' период 'TheStartDate' 'TheEndDate' периодичность 'TheFrequency' организация 'TheBusinessUnit' проект 'TheProject' аналитики 'TheDimension1' 'TheDimension2' 'TheDimension3' 'TheDimension4' 'TheDimension5' 'TheDimension6' 

	* Откроем форму ключевых реквизитов
		Если открылось окно "Укажите ключевые реквизиты документа" Тогда
			// Форма уже открыта
		Иначе
			И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Экземпляры отчетов"
			Тогда открылось окно "Экземпляры отчетов"
			И я нажимаю на кнопку с именем 'ФормаСоздать'

	* Заполняем ключевые реквизиты
		Тогда открылось окно "Укажите ключевые реквизиты документа"
		И из выпадающего списка с именем 'ВидОтчета' я выбираю по строке '[TheReportKind]'				
		И из выпадающего списка с именем 'Сценарий' я выбираю по строке '[TheScenario]'
		И из выпадающего списка с именем 'Периодичность' я выбираю точное значение '[TheFrequency]'
		И я нажимаю на кнопку с именем 'ИзменитьПериод'
		Тогда открылось окно "Выберите период"
		И в поле с именем 'DateBegin' я ввожу текст '[TheStartDate]'
		И в поле с именем 'DateEnd' я ввожу текст '[TheEndDate]'
		И я нажимаю на кнопку с именем 'Select'
		Тогда открылось окно "Укажите ключевые реквизиты документа"
		И я нажимаю кнопку выбора у поля с именем 'Организация'
		Когда открылось окно "Организаци*"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		Если '$$ЭтоУХ$$' Тогда
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование в программе"
		Если '$$ЭтоЕРПУХ$$' Тогда
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Рабочее наименование"				
		И в поле с именем 'Pattern' я ввожу текст '[TheBusinessUnit]'
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Организаци*"
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Укажите ключевые реквизиты документа"
		Если 'НЕ ПустаяСтрока("[TheProject]")' Тогда
			И из выпадающего списка с именем 'Проект' я выбираю по строке '[TheProject]'
		Если 'НЕ ПустаяСтрока("[TheDimension1]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета1' я выбираю по строке '[TheDimension1]'
		Если 'НЕ ПустаяСтрока("[TheDimension2]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета2' я выбираю по строке '[TheDimension2]'
		Если 'НЕ ПустаяСтрока("[TheDimension3]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета3' я выбираю по строке '[TheDimension3]'
		Если 'НЕ ПустаяСтрока("[TheDimension4]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета4' я выбираю по строке '[TheDimension4]'
		Если 'НЕ ПустаяСтрока("[TheDimension5]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета1' я выбираю по строке '[TheDimension5]'
		Если 'НЕ ПустаяСтрока("[TheDimension6]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета1' я выбираю по строке '[TheDimension6]'
		Когда открылось окно "Укажите ключевые реквизиты документа"
		И я нажимаю на кнопку с именем 'КнопкаОК'
		
		И Открылся экземпляр отчета для вида отчета '[TheReportKind]' валюта '*' организация '[TheBusinessUnit]' сценарий '[TheScenario]' периодичность '[TheFrequency]' проект '[TheProject]' аналитики '[TheDimension1]' '[TheDimension2]' '[TheDimension3]' '[TheDimension4]' '[TheDimension5]' '[TheDimension6]' 	

Сценарий: Я открываю первый экземпляр отчета для вида отчета 'TheReportKind'

	И Я нахожу в списке вид отчета с именем '[TheReportKind]'
	И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовОткрытьСписокЭкземпляров'
	Тогда открылось окно "Экземпляры отчетов"
	И в таблице 'Список' я выбираю текущую строку

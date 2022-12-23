﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Бюджетирование'

Сценарий: Я для вида отчета 'ТекИмяВидаОтчета' изменяю флаг 'ТекИмяФлага' 

	И Я открываю вид отчета с именем '[ТекИмяВидаОтчета]'

	И я изменяю флаг с именем '[ТекИмяФлага]'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "[ТекИмяВидаОтчета] (Виды отчетов)" в течение 20 секунд	

	Тогда открылось окно "Виды и бланки отчетов"
	И я закрываю окно "Виды и бланки отчетов"

Сценарий: Я открываю контруктор отчета с именем 'ТекИмяВидаОтчета'

	И Я нахожу в списке вид отчета с именем '[ТекИмяВидаОтчета]'
	И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'ОткрытьКонструктор'

Сценарий: Я в конструкторе отчета добавляю строку с именем 'ТекИмяСтроки' 

	Когда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьСтроки'
	Тогда открылось окно "Добавление новых строк"
	И в таблице 'НовыеСтроки' я нажимаю на кнопку с именем 'НовыеСтрокиДобавить'
	И в таблице 'НовыеСтроки' в поле с именем 'НовыеСтрокиНаименование' я ввожу текст '[ТекИмяСтроки]'
	И в таблице 'НовыеСтроки' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ОК'

Сценарий: Я в конструкторе отчета добавляю колонку с именем 'ТекИмяКолонки' 

	Тогда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьКолонку'
	Тогда открылось окно "Добавление новых колонок"
	И в таблице 'НовыеСтроки' я нажимаю на кнопку с именем 'НовыеСтрокиДобавить'
	И в таблице 'НовыеСтроки' в поле с именем 'НовыеСтрокиНаименование' я ввожу текст '[ТекИмяКолонки]'
	И в таблице 'НовыеСтроки' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ОК'

Сценарий: Я в конструкторе отчета добавляю аналитику с кодом 'ТекКодАналитики' в ячейку 'ТекАдресЯчейки' 

	Тогда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Аналитики показателей"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[ТекАдресЯчейки]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Код"
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И в поле с именем 'Pattern' я ввожу текст '[ТекКодАналитики]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И в таблице 'Список' я выбираю текущую строку

Сценарий: Я в конструкторе отчета в ячейке 'ТекЯчейка' я меняю родителя у строки на 'ТекИмяРодителя'

	Тогда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[ТекЯчейка]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Строки отчетов)"
	И из выпадающего списка с именем 'Родитель' я выбираю по строке '[ТекИмяРодителя]'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "* (Строки отчетов) *" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'ТекЯчейка' я меняю свойство показателя 'ТекСвойство' на 'ТекЗначение'

	Когда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[ТекЯчейка]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Показатели отчетов)"
	Если '"[ТекЗначение]" = "Истина" ИЛИ "[ТекЗначение]" = "True"' Тогда
		И я устанавливаю флаг с именем '[ТекСвойство]'
	ИначеЕсли '"[ТекЗначение]" = "Ложь" "[ТекЗначение]" = "False"' Тогда
		И я снимаю флаг с именем '[ТекСвойство]'
	Иначе
		И из выпадающего списка с именем '[ТекСвойство]' я выбираю точное значение "[ТекЗначение]"										
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "* (Показатели отчетов)" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'ТекЯчейка' я меняю свойства показателей 'ТекСвойство' на 'ТекЗначение'

	Когда открылось окно "Конструктор отчета*"
	И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Структура отчета"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[ТекЯчейка]'
	И я выбираю пункт контекстного меню с именем 'ПолеТабличногоДокументаМакетКонтекстноеМенюСвойства' на элементе формы с именем 'ПолеТабличногоДокументаМакет'
	Тогда открылось окно "Групповое изменение показателей"
	И я изменяю флаг с именем '[ТекСвойство]Изменить'
	И из выпадающего списка с именем '[ТекСвойство]' я выбираю точное значение "[ТекЗначение]"
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

Сценарий: Я октрываю сводную таблицу отчета с именем 'ТекИмяВидаОтчета'

	И Я нахожу в списке вид отчета с именем '[ТекИмяВидаОтчета]'

	Когда открылось окно "Виды и бланки отчетов"
	И я запоминаю строку '[ТекИмяВидаОтчета]' в переменную 'ИмяВидаОтчета'
	И в таблице 'Список' я перехожу к строке по шаблону:
		| "Наименование"                      |
		| "$ИмяВидаОтчета$ (сводная таблица)" |
	И я нажимаю на кнопку с именем 'ПерейтиВРежимОтображенияДанных'
	И я жду открытия формы "Сводная таблица: *" в течение 30 секунд		

Сценарий: Я устанавливаю отбор сводной таблицы 'ИмяОтбора' со значением 'ЗначениеОтбора'

	Когда открылось окно "Сводная таблица: *"
	И я нажимаю на гиперссылку с именем 'ОтборыЗаголовок'
	И я жду открытия формы "Сводная таблица: *" в течение 20 секунд
	Если элемент 'ИмяОтбора' присутствует на форме Тогда
		И из выпадающего списка с именем '[ИмяОтбора]' я выбираю по строке '[ЗначениеОтбора]'
		И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы1'
	И я жду открытия формы "Сводная таблица: *" в течение 20 секунд

Сценарий: Я устанавливаю отборы сводной таблицы: дата начала 'ТекОтборДатаНачала', дата конца 'ТекОтборДатаКонца', валюта 'ТекОтборВалюта', сценарий 'ТекОтборСценарий', организация 'ТекОтборОрганизация'	

	Когда открылось окно "Сводная таблица: *"
	И я нажимаю на гиперссылку с именем 'ОтборыЗаголовок'
	И я нажимаю на кнопку с именем 'ИзменитьПериод'
	Тогда открылось окно "Выберите период"
	И в поле с именем 'DateBegin' я ввожу текст '[ТекОтборДатаНачала]'
	И я перехожу к следующему реквизиту
	И в поле с именем 'DateEnd' я ввожу текст '[ТекОтборДатаКонца]'
	И я нажимаю на кнопку с именем 'Select'
	Тогда открылось окно "Сводная таблица: *"
	И из выпадающего списка с именем 'ВалютаОтображения' я выбираю по строке '[ТекОтборВалюта]'
	И из выпадающего списка с именем 'Элемент_Сценарий' я выбираю по строке '[ТекОтборСценарий]'
	И из выпадающего списка с именем 'Элемент_Организация' я выбираю по строке '[ТекОтборОрганизация]'
	И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы1'
	И я жду открытия формы "Сводная таблица: *" в течение 20 секунд

Сценарий: Я Для вида отчета 'ТекИмяВидаОтчета' я создаю бланк для импорта по умолчанию

	* Откроем вид отчета
		Если имя текущей формы "[ТекИмяВидаОтчета] (Виды отчетов)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[ТекИмяВидаОтчета]'

	* Создаем Бланк экземпляра отчета
		Тогда открылось окно "[ТекИмяВидаОтчета] (Виды отчетов)"
		И я перехожу к закладке с именем 'НастройкиПоУмолчанию'
		Когда открылось окно "[ТекИмяВидаОтчета] (Виды отчетов)"
		И я нажимаю на кнопку открытия поля с именем 'БланкДляИмпортаПоУмолчанию'
		Тогда открылось окно "Бланк [ТекИмяВидаОтчета] вида отчета: [ТекИмяВидаОтчета]"
		И я нажимаю на кнопку с именем 'ФормаВолшебнаяПалочка'
		Тогда открылось окно "Что делать?"
		И я нажимаю на кнопку с именем 'СоздатьНовыйБланк'
		И я нажимаю на кнопку с именем 'КомандаСформироватьМакетЗаново'
		Тогда открылось окно "Бланк [ТекИмяВидаОтчета] вида отчета: [ТекИмяВидаОтчета] *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Бланк [ТекИмяВидаОтчета] вида отчета: [ТекИмяВидаОтчета] *" в течение 5 секунд

Сценарий: Я Для вида отчета 'ТекИмяВидаОтчета' я создаю бланк по умолчанию

	* Откроем вид отчета
		Если имя текущей формы "[ТекИмяВидаОтчета] (Виды отчетов)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[ТекИмяВидаОтчета]'
	
	* Формируем Бланк экземпляра отчета
		Когда открылось окно "[ТекИмяВидаОтчета] (Виды отчетов)"
		И я перехожу к закладке с именем 'НастройкиПоУмолчанию'
		И я нажимаю на кнопку открытия поля с именем 'БланкОтображенияПоУмолчаниюМногопериодный'
		Тогда открылось окно "Бланк [ТекИмяВидаОтчета] вида отчета: [ТекИмяВидаОтчета]"
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
		Тогда открылось окно "Бланк [ТекИмяВидаОтчета] вида отчета: [ТекИмяВидаОтчета] *"
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписатьИЗакрыть'
		И я жду закрытия окна "Бланк [ТекИмяВидаОтчета] вида отчета: [ТекИмяВидаОтчета] *" в течение 20 секунд		

Сценарий: Я Для вида отчета 'ТекИмяВидаОтчета' я создаю бланк сводной таблицы по умолчанию с отборами 'ТекОтбор1' 'ТекОтбор2' 'ТекОтбор3'

	* Откроем вид отчета
		// Вариант открытия из формы
		Если имя текущей формы "[ТекИмяВидаОтчета] (Виды отчетов)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[ТекИмяВидаОтчета]'
		Когда открылось окно "[ТекИмяВидаОтчета] (Виды отчетов)"
		И я перехожу к закладке с именем 'НастройкиПоУмолчанию'
		И я нажимаю на кнопку открытия поля с именем 'БланкСводнойТаблицыПоУмолчанию'

	* Формируем Бланк сводной таблиц
		Тогда Открылся бланк сводной таблицы для вида отчета '[ТекИмяВидаОтчета]'
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
		И я запоминаю строку '[ТекОтбор1]' в переменную 'ИмяПоля'
		Если в таблице 'ТаблицаДоступныеПоля' есть строка Тогда
			| "Доступные аналитики" |
			| '$ИмяПоля$'           |
			И в таблице 'ТаблицаДоступныеПоля' я перехожу к строке:
				| "Доступные аналитики" |
				| '$ИмяПоля$'           |
			И я выбираю пункт контекстного меню с именем 'ТаблицаДоступныеПоляКонтекстноеМенюПеренестиВОтборы' на элементе формы с именем 'ТаблицаДоступныеПоля'
		И я запоминаю строку '[ТекОтбор2]' в переменную 'ИмяПоля'	
		Если в таблице 'ТаблицаДоступныеПоля' есть строка Тогда
			| "Доступные аналитики" |
			| '$ИмяПоля$'           |
			И в таблице 'ТаблицаДоступныеПоля' я перехожу к строке:
				| "Доступные аналитики" |
				| '$ИмяПоля$'           |
			И я выбираю пункт контекстного меню с именем 'ТаблицаДоступныеПоляКонтекстноеМенюПеренестиВОтборы' на элементе формы с именем 'ТаблицаДоступныеПоля'
		И я запоминаю строку '[ТекОтбор3]' в переменную 'ИмяПоля'	
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
		Если '"[ТекОтбор1]" <> "$ИмяПоля$" И "[ТекОтбор2]" <> "$ИмяПоля$" И "[ТекОтбор3]" <> "$ИмяПоля$"' Тогда
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

Сценарий: Я для регламента 'ТекИмяРегламента' изменяю флаг 'ТекИмяФлага'

	И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Регламенты подготовки отчетности"
	Тогда открылось окно "Регламенты подготовки отчетности"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылось окно "Найти"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
	И в поле с именем 'Pattern' я ввожу текст '[ТекИмяРегламента]'
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Регламенты подготовки отчетности"
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "[ТекИмяРегламента] от * (Регламент подготовки отчетности)"
	И я перехожу к закладке с именем 'ГруппаСтраницаОсновная'
	И я изменяю флаг с именем '[ТекИмяФлага]'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "[ТекИмяРегламента] от * (Регламент подготовки отчетности) *" в течение 20 секунд

Сценарий: Я вставляю из буфера обмена в макете

	И я очищаю окно сообщений пользователю		
	И я делаю 3 раз
		И я нажимаю на кнопку с именем 'ВставитьИзБуфераМакет'
		Если в текущем окне есть сообщения пользователю Тогда
			И Пауза 3
		Иначе
			И я прерываю цикл

Сценарий: Я ввожу значение 'ТекЗначение' в ячейку 'ТекАдресЯчейки'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[ТекАдресЯчейки]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	И в табличный документ 'ПолеТабличногоДокументаМакет' я ввожу текст '[ТекЗначение]'

Сценарий: Я ввожу значение 'ТекЗначение' с раскрытием показателей в ячейку 'ТекАдресЯчейки'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[ТекАдресЯчейки]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	Тогда открылось окно "Раскрытие показателей: *"
	И в таблице 'РаскрытиеПоказателей' я выбираю текущую строку
	И в таблице 'РаскрытиеПоказателей' в поле с именем 'Значение' я ввожу текст '[ТекЗначение]'
	И я нажимаю на кнопку с именем 'ФормаКнопкаОК'

	И я жду закрытия окна "Раскрытие показателей: *" в течение 20 секунд	

Сценарий: Я изменяю значение на 'ТекЗначение' процентов в ячейке 'ТекАдресЯчейки'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[ТекАдресЯчейки]'
	И я нажимаю на кнопку с именем 'ИзменитьПоказатели'
	Тогда открылось окно "Изменение значений"
	И я меняю значение переключателя с именем 'ВидКорректировки' на "Процент"
	И в поле с именем 'ЗначениеКорректировки' я ввожу текст '[ТекЗначение]'
	И я нажимаю на кнопку с именем 'Применить'

Сценарий: Я изменяю значение на 'ТекЗначение' в ячейке 'ТекАдресЯчейки'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[ТекАдресЯчейки]'
	И я нажимаю на кнопку с именем 'ИзменитьПоказатели'
	Тогда открылось окно "Изменение значений"
	И я меняю значение переключателя с именем 'ВидКорректировки' на "Значение"
	И в поле с именем 'ЗначениеКорректировки' я ввожу текст '[ТекЗначение]'
	И я нажимаю на кнопку с именем 'Применить'

Сценарий: Я добавляю значения с раскрытием показателей в ячейку 'ТекАдресЯчейки'

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[ТекАдресЯчейки]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	
	Тогда открылось окно "Раскрытие показателей: *"
	И я заполняю таблицу 'РаскрытиеПоказателей' данными
		| 'Таблица' |

	И я нажимаю на кнопку с именем 'ФормаКнопкаОК'
	И я жду закрытия окна "Раскрытие показателей: *" в течение 20 секунд

Сценарий: Я создаю экземпляр отчета для вида отчета 'ТекВидОтчета' сценарий 'ТекСценарий' период 'ТекДатаНачала' 'ТекДатаОкончания' периодичность 'ТекПериодичность' организация 'ТекОрганизация' проект 'ТекПроект' аналитики 'ТекАналитика1' 'ТекАналитика2' 'ТекАналитика3' 'ТекАналитика4' 'ТекАналитика5' 'ТекАналитика6' 

	* Откроем форму ключевых реквизитов
		Если имя текущей формы "Укажите ключевые реквизиты документа" Тогда
			// Форма уже открыта
		Иначе
			И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Экземпляры отчетов"
			Тогда открылось окно "Экземпляры отчетов"
			И я нажимаю на кнопку с именем 'ФормаСоздать'

	* Заполняем ключевые реквизиты
		Тогда открылось окно "Укажите ключевые реквизиты документа"
		И из выпадающего списка с именем 'ВидОтчета' я выбираю по строке '[ТекВидОтчета]'				
		И из выпадающего списка с именем 'Сценарий' я выбираю по строке '[ТекСценарий]'
		И из выпадающего списка с именем 'Периодичность' я выбираю точное значение '[ТекПериодичность]'
		И я нажимаю на кнопку с именем 'ИзменитьПериод'
		Тогда открылось окно "Выберите период"
		И в поле с именем 'DateBegin' я ввожу текст '[ТекДатаНачала]'
		И в поле с именем 'DateEnd' я ввожу текст '[ТекДатаОкончания]'
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
		И в поле с именем 'Pattern' я ввожу текст '[ТекОрганизация]'
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Организаци*"
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Укажите ключевые реквизиты документа"
		Если 'НЕ ПустаяСтрока("[ТекПроект]")' Тогда
			И из выпадающего списка с именем 'Проект' я выбираю по строке '[ТекПроект]'
		Если 'НЕ ПустаяСтрока("[ТекАналитика1]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета1' я выбираю по строке '[ТекАналитика1]'
		Если 'НЕ ПустаяСтрока("[ТекАналитика2]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета2' я выбираю по строке '[ТекАналитика2]'
		Если 'НЕ ПустаяСтрока("[ТекАналитика3]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета3' я выбираю по строке '[ТекАналитика3]'
		Если 'НЕ ПустаяСтрока("[ТекАналитика4]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета4' я выбираю по строке '[ТекАналитика4]'
		Если 'НЕ ПустаяСтрока("[ТекАналитика5]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета1' я выбираю по строке '[ТекАналитика5]'
		Если 'НЕ ПустаяСтрока("[ТекАналитика6]")' Тогда
			И из выпадающего списка с именем 'АналитикаОтчета1' я выбираю по строке '[ТекАналитика6]'
		Когда открылось окно "Укажите ключевые реквизиты документа"
		И я нажимаю на кнопку с именем 'КнопкаОК'
		
		И Открылся экземпляр отчета для вида отчета '[ТекВидОтчета]' валюта '*' организация '[ТекОрганизация]' сценарий '[ТекСценарий]' периодичность '[ТекПериодичность]' проект '[ТекПроект]' аналитики '[ТекАналитика1]' '[ТекАналитика2]' '[ТекАналитика3]' '[ТекАналитика4]' '[ТекАналитика5]' '[ТекАналитика6]' 	

Сценарий: Я открываю первый экземпляр отчета для вида отчета 'ТекВидОтчета'

	И Я нахожу в списке вид отчета с именем '[ТекВидОтчета]'
	И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовОткрытьСписокЭкземпляров'
	Тогда открылось окно "Экземпляры отчетов"
	И в таблице 'Список' я выбираю текущую строку

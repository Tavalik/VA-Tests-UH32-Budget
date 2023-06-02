﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии общие

Сценарий: Инициализация переменных

	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И НЕ ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную '$$ЭтоУХ$$'
	
	Если '$$ЭтоУХ$$' Тогда
		Если в панели разделов есть команда 'Справочники' Тогда
			И Я запоминаю значение выражения 'Ложь' в переменную '$$ЭтоPerform$$'
		Иначе
			И Я запоминаю значение выражения 'Истина' в переменную '$$ЭтоPerform$$'
	Иначе
		И Я запоминаю значение выражения 'Ложь' в переменную '$$ЭтоPerform$$'
		
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную '$$ЭтоЕРПУХ$$'

	Если в панели разделов есть команда 'Бюджетирование, отчетность и анализ' Тогда
		И Я запоминаю значение выражения 'Ru' в переменную '$$ЯзыкИнтерфейса$$'
	ИначеЕсли в панели разделов есть команда 'Budgeting, reporting, and analysis' Тогда
		И Я запоминаю значение выражения 'En' в переменную '$$ЯзыкИнтерфейса$$'
		
Сценарий: Я устанавливаю отбор в форме списка 'TheField' 'TheComparisonType' 'TheValue' 

	Тогда открылось окно "Настройка списка"
	И я удаляю все строки таблицы 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор'		
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я нажимаю на кнопку с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборДобавитьЭлементОтбора'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я перехожу к последней строке
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборЛевоеЗначение' я выбираю точное значение '[TheField]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я активизирую поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборВидСравнения'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборВидСравнения' я выбираю точное значение '[TheComparisonType]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я активизирую поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение'
	Если 'StrFind(Lower("[TheComparisonType]"),"содержит")>0 ИЛИ StrFind(Lower("[TheComparisonType]"),"начинается с")>0 ИЛИ StrFind(Lower("[TheComparisonType]"),"contain")>0 ИЛИ StrFind(Lower("[TheComparisonType]"),"begin with")>0' Тогда 
		И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение' я ввожу текст '[TheValue]'
	Иначе
		И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение' я выбираю точное значение '[TheValue]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'

Сценарий: Я снимаю все отборы в форме списка

	Тогда открылось окно "Настройка списка"
	И я перехожу к закладке с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0'
	И я удаляю все строки таблицы 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор'
	И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'

Сценарий: Таблица 'TheTable' содержит 'TheNumberOfLines' строк из списка:

	Тогда в таблице '[TheTable]' количество строк 'равно' '[TheNumberOfLines]'

	Тогда таблица '[TheTable]' содержит строки:
		| 'Таблица' |	

Сценарий: Я в списке 'TheListName' по полю 'TheField' ищу элемент 'ThePattern' 'TheCompareType' 

	Тогда открылось окно '[TheListName]'
	И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'
	Тогда открылось окно "Найти"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение '[TheField]'
	И я меняю значение переключателя с именем 'CompareType' на '[TheCompareType]'				
	И в поле с именем 'Pattern' я ввожу текст '[ThePattern]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно '[TheListName]'
	И Я запоминаю в переменную 'VarField' значение '[TheField]'
	И Я запоминаю в переменную 'VarPattern' значение '[ThePattern]'	
	И в таблице 'Список' я перехожу к строке:
		| '$VarField$'   |
		| '$VarPattern$' |
	И в таблице 'Список' я выбираю текущую строку

Сценарий: Я для реквизита 'TheProperty' устанавливаю значение 'TheValue'

	Если 'ВРег("[TheValue]") = "ИСТИНА" ИЛИ ВРег("[TheValue]") = "TRUE"' Тогда
		И я устанавливаю флаг с именем '[TheProperty]'
	ИначеЕсли 'ВРег("[TheValue]") = "ЛОЖЬ" ИЛИ ВРег("[TheValue]") = "FALSE"' Тогда
		И я снимаю флаг с именем '[TheProperty]'
	Иначе
		И из выпадающего списка с именем '[TheProperty]' я выбираю точное значение "[TheValue]"

Сценарий: Я удаляю текущую строку в списке 'TheList'

	Если в таблице '[TheList]' текущая строка не помечена на удаление Тогда
		И я выбираю пункт контекстного меню с именем '[TheList]КонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем '[TheList]'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'

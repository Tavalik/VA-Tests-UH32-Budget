﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии общие

Сценарий: Инициализация переменных

	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И НЕ ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоУХ$$"
	
	Если '$$ЭтоУХ$$' Тогда
		Если в панели разделов есть команда "Справочники" Тогда
			И Я запоминаю значение выражения 'ЛОЖЬ' в переменную "$$ЭтоCPMWE$$"
		Иначе
			И Я запоминаю значение выражения 'ИСТИНА' в переменную "$$ЭтоCPMWE$$"
	Иначе
		И Я запоминаю значение выражения 'ЛОЖЬ' в переменную "$$ЭтоCPMWE$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоЕРПУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ВерсияУправлениеХолдингом()' в переменную "$$ВерсияУХ$$"
		
Сценарий: Я устанавливаю отбор в форме списка "ТекПоле" "ТекВидСравнения" "ТекЗначение" 

	Тогда открылось окно 'Настройка списка'
	И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я нажимаю на кнопку с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборДобавитьЭлементОтбора'
	И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я перехожу к последней строке
	И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборЛевоеЗначение" я выбираю точное значение '[ТекПоле]'
	И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я активизирую поле с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборВидСравнения"
	И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборВидСравнения" я выбираю точное значение '[ТекВидСравнения]'
	И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я активизирую поле с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение"
	Если 'СтрНайти(НРег("[ТекВидСравнения]"), "содержит")>0 ИЛИ СтрНайти(НРег("[ТекВидСравнения]"), "начинается с")>0 ИЛИ СтрНайти(НРег("[ТекВидСравнения]"), "contain")>0 ИЛИ СтрНайти(НРег("[ТекВидСравнения]"), "begin with с")>0 ' Тогда
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение' я ввожу текст '[ТекЗначение]'
	Иначе
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение" я выбираю точное значение '[ТекЗначение]'
	И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'

Сценарий: Я снимаю все отборы в форме списка

	Тогда открылось окно 'Настройка списка'
	И я перехожу к закладке с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0"
	И Пока в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" количество строк "больше" 1 Тогда
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я перехожу к последней строке
		И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я удаляю строку
	И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'
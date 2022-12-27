﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Бюджетирование'
		
Сценарий: Я нахожу в списке вид отчета с именем 'ТекИмяВидаОтчета'

	И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Виды и бланки отчетов"
	Тогда открылось окно "Виды и бланки отчетов"
	И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид отчета"
	И я меняю значение переключателя с именем 'CompareType' на "По части строки"
	И в поле с именем 'Pattern' я ввожу текст '[ТекИмяВидаОтчета]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда в таблице 'СписокВидовОтчетов' количество строк 'равно' 1

Сценарий: Открылся экземпляр отчета для вида отчета 'ТекВидОтчета' валюта 'ТекВалюта' организация 'ТекОрганизация' сценарий 'ТекСценарий' периодичность 'ТекПериодичность' проект 'ТекПроект' аналитики 'ТекАналитика1' 'ТекАналитика2' 'ТекАналитика3' 'ТекАналитика4' 'ТекАналитика5' 'ТекАналитика6' 

	Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда
		И я запоминаю строку 'Экземпляр отчета \"[ТекВидОтчета]\": <[ТекВалюта]> <[ТекОрганизация]> <* - * (Периодичность: [ТекПериодичность]) <[ТекСценарий]>>' в переменную 'ЗаголовокОкна'
	ИначеЕсли '$$ЯзыкИнтерфейса$$ = "En"' Тогда
		И я запоминаю строку 'The \"[ТекВидОтчета]\" report instance: <[ТекВалюта]> <[ТекОрганизация]> <* - * (Frequency: [ТекПериодичность]) <[ТекСценарий]>>' в переменную 'ЗаголовокОкна'		

	Если 'НЕ ПустаяСтрока("[ТекПроект]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[ТекПроект]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[ТекАналитика1]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[ТекАналитика1]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[ТекАналитика2]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[ТекАналитика2]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[ТекАналитика3]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[ТекАналитика3]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[ТекАналитика4]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[ТекАналитика4]>' в переменную 'ЗаголовокОкна'	
	Если 'НЕ ПустаяСтрока("[ТекАналитика5]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[ТекАналитика5]>' в переменную 'ЗаголовокОкна'
	Если 'НЕ ПустаяСтрока("[ТекАналитика6]")' Тогда
		И я запоминаю строку '$ЗаголовокОкна$ <[ТекАналитика6]>' в переменную 'ЗаголовокОкна'

	И я запоминаю строку '$ЗаголовокОкна$*' в переменную 'ЗаголовокОкна'
	И открылось окно '$ЗаголовокОкна$'

Сценарий: Открылся документ управления периодом для сценария 'ТекСценарий' периодичность 'ТекПериодичность' 

	Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда
		Тогда открылось окно '* - * (Периодичность: [ТекПериодичность]) <[ТекСценарий]>'
	ИначеЕсли '$$ЯзыкИнтерфейса$$ = "En"' Тогда
		Тогда открылось окно '* - * (Frequency: [ТекПериодичность]) <[ТекСценарий]>'

	И я запоминаю заголовок формы в переменную 'ЗаголовокОкна'

Сценарий: Открылся бланк для вида отчета 'ТекВидОтчета'

	И открылось окно "Бланк [ТекВидОтчета] вида отчета: [ТекВидОтчета]*"

Сценарий: Открылся бланк сводной таблицы для вида отчета 'ТекВидОтчета'

	И открылось окно "Сводная таблица [макет]: [ТекВидОтчета] (сводная таблица)*"

Сценарий: Открылась сводная таблица для вида отчета 'ТекВидОтчета'

	И открылось окно "Сводная таблица: [ТекВидОтчета] (сводная таблица)*"

Сценарий: Открылась сводная таблица для варианта 'ТекВариант'

	И открылось окно "Сводная таблица: [ТекВариант]*"

Сценарий: Открылась правило расчета для вида отчета 'ТекВидОтчета'

	И открылось окно "[ТекВидОтчета] (Правила расчета)*"
	
Сценарий: Я подставляю в строку 'ТекСтрока' параметры 'ТекПараметр1' 'ТекПараметр2' 'ТекПараметр3'

	И Я запоминаю значение выражения 'СтрШаблон("[ТекСтрока]", "[ТекПараметр1]", "[ТекПараметр2]", "[ТекПараметр3]")' в переменную 'ИтоговаяСтрока'

	
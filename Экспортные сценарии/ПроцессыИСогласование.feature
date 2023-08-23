﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Процесс и согласование'

Сценарий: Я создаю роль контактных лиц 'TheRole'

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Консолидация по МСФО" "Роли контактных лиц"

	* Удаляем элемент
		И Я в списке "Роли контактных лиц" по полю "Наименование" ищу элемент '[TheRole]' "По точному совпадению"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheRole] (Роли контактных лиц)" очищая
	
	* Создаем элемент
		Когда открылось окно "Роли контактных лиц"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Роли контактных лиц (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheRole]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Роли контактных лиц (создание) *" в течение 20 секунд
		И Я закрываю окно "Роли контактных лиц"

Сценарий: Я создаю элемент расширенной адресации 'TheExtendedAddressing' роль 'TheRole'

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Процессы и согласование" "Расширенная адресация согласования"

	* Удаляем элемент
		И Я в списке "Расширенная адресация согласования" по полю "Наименование" ищу элемент '[TheExtendedAddressing]' "По точному совпадению"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheExtendedAddressing] (Расширенная адресация согласования)" очищая

	* Создаем элемент
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Расширенная адресация согласования (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheExtendedAddressing]'
		И я нажимаю кнопку выбора у поля с именем 'Владелец'
		Тогда открылось окно "Выбор типа данных"
		И в таблице "" я перехожу к строке:
			| ''            |
			| 'Документ ИБ' |
		И в таблице "" я выбираю текущую строку
		И Я в списке "Документы ИБ" по полю "Документ" ищу и выбираю элемент "Экземпляр отчета" "По части строки"
		Тогда открылось окно "Расширенная адресация согласования (создание) *"
		И из выпадающего списка с именем 'ВидРасширеннойАдресацииСогласования' я выбираю точное значение "Роль по фиксированному объекту"
		И я перехожу к закладке с именем 'ГруппаСтраницаРольПоФиксированномуОбъекту'
		И я нажимаю кнопку выбора у поля с именем "РольАдресации1"
		И Я в списке "Роли контактных лиц" по полю "Наименование" ищу и выбираю элемент '[TheRole]' "По точному совпадению"
		Тогда открылось окно "Расширенная адресация согласования (создание) *"
		И я нажимаю кнопку выбора у поля с именем 'ФиксированныйОбъектАдресации'
		Тогда открылось окно "Выбор типа данных"
		И в таблице "" я перехожу к строке:
			| ''                        |
			| "Организационная единица" |
		И в таблице "" я выбираю текущую строку
		Тогда открылось окно "Организационные единицы"
		И Я закрываю окно "Организационные единицы"
		Тогда открылось окно "Расширенная адресация согласования (создание) *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "[TheExtendedAddressing] (Расширенная адресация согласования)" в течение 20 секунд	
		И Я закрываю окно "Расширенная адресация согласования"	

Сценарий: Я добавляю строку в матрицу адресации роль 'TheRole' пользователь 'TheUser'

	И В командном интерфейсе я выбираю "Процессы и согласование" 'Матрица адресации'
	
	* Удаляем элемент
		Тогда открылось окно "Матрица адресации"
		И в таблице 'ТаблицаОтветственных' я нажимаю на кнопку с именем 'ТаблицаОтветственныхНайти'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Роль"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст '[TheRole]'
		И я нажимаю на кнопку с именем 'Find'
		
		Тогда открылось окно "Матрица адресации"
		И в таблице 'ТаблицаОтветственных' я нажимаю на кнопку с именем 'ТаблицаОтветственныхНайти'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Пользователь"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст '[TheUser]'
		И я нажимаю на кнопку с именем 'Find'
		
		И Пока в таблице 'ТаблицаОтветственных' количество строк 'больше' 0 Тогда
			И в таблице 'ТаблицаОтветственных' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "Ответственные по объектам*" очищая

	Если в таблице 'ТаблицаОтветственных' количество строк "=" 0 Тогда
		И в таблице 'ТаблицаОтветственных' я нажимаю на кнопку с именем 'ТаблицаОтветственныхСоздать'
		Тогда открылось окно "Ответственные по объектам"
		И я нажимаю кнопку выбора у поля с именем 'Роль'
		И Я в списке "Роли контактных лиц" по полю "Наименование" ищу и выбираю элемент '[TheRole]' "По точному совпадению"
		Тогда открылось окно "Ответственные по объектам *"
		И я нажимаю кнопку выбора у поля с именем 'Пользователь'
		И Я в списке "Выбор пользователя" по полю "Полное имя" ищу элемент '[TheUser]' "По точному совпадению"
		И в таблице 'ПользователиСписок' я выбираю текущую строку
		Тогда открылось окно "Ответственные по объектам *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Ответственные по объектам *" в течение 20 секунд
		
	И в таблице 'ТаблицаОтветственных' я нажимаю на кнопку с именем 'ТаблицаОтветственныхОтменитьПоиск'	
	И Я закрываю окно "Матрица адресации"	

Сценарий: Я добавляю этап согласования с наименованием 'TheStepName' способ адресации 'TheAddressingMethod' пользователь 'TheUser' роль 'TheRole' расширенная адресация 'TheExtendedAddressing'

	И в табличном документе 'ТабличноеПолеВозможныхЭтапов' я перехожу к ячейке "ЭтапСогласования"
	И я нажимаю на кнопку с именем 'ДобавитьВыбранныйЭтап'
	Тогда открылось окно "Этап согласования (Этап универсального процесса)"
	И в поле с именем 'Наименование' я ввожу текст '[TheStepName]'
	И в таблице 'Утверждающие' я активизирую поле с именем 'УтверждающиеСпособАдресации'
	И в таблице 'Утверждающие' я выбираю текущую строку

	Если '"[TheAddressingMethod]" = "Пользователь"' Тогда
		И в таблице 'Утверждающие' из выпадающего списка с именем 'УтверждающиеСпособАдресации' я выбираю точное значение "Пользователь"
		И в таблице 'Утверждающие' я завершаю редактирование строки
		И в таблице 'Утверждающие' я активизирую поле с именем 'УтверждающиеПользователь'
		И в таблице 'Утверждающие' я выбираю текущую строку
		И Я в списке "Пользователи" по полю "Полное имя" ищу и выбираю элемент '[TheUser]' "По точному совпадению"		
	
	Если '"[TheAddressingMethod]" = "Роль"' Тогда
		И в таблице 'Утверждающие' из выпадающего списка с именем 'УтверждающиеСпособАдресации' я выбираю точное значение "Роль"
		И в таблице 'Утверждающие' я завершаю редактирование строки
		И в таблице 'Утверждающие' я активизирую поле с именем 'УтверждающиеПользователь'
		И в таблице 'Утверждающие' я выбираю текущую строку
		И Я в списке "Роли контактных лиц" по полю "Наименование" ищу и выбираю элемент '[TheRole]' "По точному совпадению"
	
	Если '"[TheAddressingMethod]" = "Расширенная адресация"' Тогда
		И в таблице 'Утверждающие' из выпадающего списка с именем 'УтверждающиеСпособАдресации' я выбираю точное значение "Расширенная адресация"
		И в таблице 'Утверждающие' я завершаю редактирование строки
		И в таблице 'Утверждающие' я активизирую поле с именем 'УтверждающиеПользователь'
		И в таблице 'Утверждающие' я выбираю текущую строку
		И Я в списке "Расширенная адресация согласования" по полю "Наименование" ищу и выбираю элемент '[TheExtendedAddressing]' "По точному совпадению"
		
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "Этап согласования (Этап универсального процесса) *" в течение 20 секунд

Сценарий: Я добавляю связь этапа 'TheStepOne' с этапом 'TheStepTwo'

	Когда открылось окно "Редактирование этапов процесса: *"
	И я нажимаю на кнопку с именем 'ДобавитьСвязь'
	И Я в списке "Выберите начальный этап связи" по полю "Наименование" ищу и выбираю элемент '[TheStepOne]' "По точному совпадению"
	И Я в списке "Выберите конечный этап связи" по полю "Наименование" ищу и выбираю элемент '[TheStepTwo]' "По точному совпадению"


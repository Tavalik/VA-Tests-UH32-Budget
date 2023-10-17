﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для создания НСИ в 1C:ERP УХ

Сценарий: Я создаю вид номенклатуры с именем 'ТекИмяВидаНоменклатуры' тип 'ТекТип' в 1C:ERPУХ

	* Удаляем товарные категории
		И В командном интерфейсе я выбираю "Корпоративные закупки" "Товарные категории"
		Когда открылось окно "Товарные категории"
		И я выбираю пункт контекстного меню с именем 'СписокВидовНоменклатурыКонтекстноеМенюНайти' на элементе формы с именем 'СписокВидовНоменклатуры'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Вид номенклатуры"
		И в поле с именем 'Pattern' я ввожу текст '[ТекИмяВидаНоменклатуры]'
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Товарные категории"
		Если в таблице 'СписокВидовНоменклатуры' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНастройкаСписка'
			И Я устанавливаю отбор в форме списка 'Наименование' 'Не начинается с' 'Удалить_'
			И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
				* Ставим пометку на удаление
					Если в таблице 'Список' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'Список'
					Тогда открылось окно "1С:Предприятие"
					И я нажимаю на кнопку с именем 'Button0'
				* Переименовываем
					И Я запоминаю значение выражения '"Удалить_" + СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
					И в таблице 'Список' я выбираю текущую строку
					Тогда открылось окно "* (Товарные категории)"
					И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					И я жду закрытия окна '* (Товарные категории)' в течение 20 секунд						
			И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНастройкаСписка'
			И Я снимаю все отборы в форме списка

			* Удаляем вид номенклатуры
				Когда открылось окно "Товарные категории"
				И в таблице 'СписокВидовНоменклатуры' я выбираю текущую строку
				Тогда открылось окно "[ТекИмяВидаНоменклатуры] (Вид номенклатуры)"
				И я разворачиваю группу с именем 'СтраницаОсновное'
				И Я запоминаю значение выражения '"Удалить_" + СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Тогда открылось окно "1С:Предприятие"
				И я нажимаю на кнопку с именем 'Button0'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна '[ТекИмяВидаНоменклатуры] (Вид номенклатуры) *' в течение 20 секунд
				Тогда открылось окно "Товарные категории"
				И Я закрываю окно "Товарные категории"

	* Открываем  форму списка	
		И В командном интерфейсе я выбираю "Главное" "Номенклатура"
		Когда открылось окно "Номенклатура"
	
	* Создаем новый элемент
		И я устанавливаю флаг с именем 'ИспользоватьФильтры'
		И я нажимаю на кнопку с именем 'СоздатьВидНоменклатуры'
		Тогда открылось окно "Вид номенклатуры (создание)"
		И у поля с именем 'ТипНоменклатуры' я нажимаю гиперссылку 'указать'
		Тогда открылось окно "Выберите тип номенклатуры"
		И я меняю значение переключателя с именем 'ТипНоменклатурыТовар' на '[ТекТип]'
		И я нажимаю на кнопку с именем 'ОК'
		Тогда открылось окно "Вид номенклатуры (создание) *"
		И в поле с именем 'Родитель' я ввожу текст ''
		И в поле с именем 'Наименование' я ввожу текст '[ТекИмяВидаНоменклатуры]'	
		И я разворачиваю группу с именем 'СтраницаЗначенияПоУмолчанию'
		И из выпадающего списка с именем 'СтавкаНДС' я выбираю точное значение '20%'
		И из выпадающего списка с именем 'ЕдиницаИзмерения' я выбираю по строке "шт"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Вид номенклатуры (создание) *' в течение 20 секунд

	* Закрываем формы
		Когда открылось окно "Номенклатура"
		И Я закрываю окно "Номенклатура"

Сценарий: Я создаю соглашение с клиентом с именем 'ТекИмяСоглашения' валютой 'ТекВалюта' в 1C:ERPУХ

	* Удаляем существующие элементы
		И В командном интерфейсе я выбираю "CRM и маркетинг" "Типовые соглашения с клиентами"
		И Я в списке "Типовые соглашения об условиях продаж" по полю "Наименование" ищу элемент '[ТекИмяСоглашения]' "По точному совпадению"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'Список'					
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "Типовое соглашение об условиях продаж"
			И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
			И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Типовое соглашение об условиях продаж *' в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокСоздать'
		Тогда открылось окно "Типовое соглашение об условиях продаж (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[ТекИмяСоглашения]'
		И я перехожу к закладке с именем 'СтраницаУсловияПродаж'
		И из выпадающего списка с именем 'Валюта' я выбираю точное значение '[ТекВалюта]'
		И я изменяю флаг с именем 'ЦенаВключаетНДС'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Типовое соглашение об условиях продаж (создание) *"		
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Типовое соглашение об условиях продаж (создание) *" в течение 20 секунд

	* Закрываем форму списка
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И я закрываю окно "Типовые соглашения об условиях продаж"

Сценарий: Я создаю соглашение с поставщиком 'ТекПоставщик' с именем 'ТекИмяСоглашения' валютой 'ТекВалюта' в 1C:ERPУХ

	* Удаляем существующие элементы
		И В командном интерфейсе я выбираю "Закупки" "Соглашения с поставщиками"
		И Я в списке "Соглашения об условиях закупок" по полю "Наименование" ищу элемент '[ТекИмяСоглашения]' "По точному совпадению"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'Список'					
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "[ТекИмяСоглашения] (Соглашение об условиях закупок)"
			И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
			И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "[ТекИмяСоглашения] (Соглашение об условиях закупок) *" в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Соглашения об условиях закупок"
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокСоздать'
		Тогда открылось окно "Соглашение об условиях закупок (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[ТекИмяСоглашения]'
		И из выпадающего списка с именем "Партнер" я выбираю по строке '[ТекПоставщик]'				
		И я перехожу к закладке с именем 'ГруппаУсловияЗакупок'
		И из выпадающего списка с именем 'Валюта' я выбираю точное значение '[ТекВалюта]'
		И я изменяю флаг с именем 'ЦенаВключаетНДС'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Соглашение об условиях закупок (создание) *"		
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Соглашение об условиях закупок (создание) *" в течение 20 секунд

	* Закрываем форму списка
		Тогда открылось окно "Соглашения об условиях закупок"
		И я закрываю окно "Соглашения об условиях закупок"		

Сценарий: Я создаю партнера с именем 'ТекИмяПартнера' тип 'ТекТип' в 1C:ERPУХ		

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Главное" "Партнеры"
		И я жду открытия окна 'Партнеры' в течение 20 секунд

	* Удаляем существующие элементы	
		И Я в списке "Партнеры" по полю "Наименование" ищу элемент '[ТекИмяПартнера]' "По точному совпадению"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'Список'	
			И Я запоминаю значение выражения '"Удалить_" + СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "[ТекИмяПартнера] (Партнер)"
			* Удаляем контрагентов
				И В текущем окне я нажимаю кнопку командного интерфейса "Контрагенты"
				Когда открылось окно "[ТекИмяПартнера] (Партнер)"
				И я нажимаю на кнопку с именем 'ФормаНастройкаСписка'
				И Я устанавливаю отбор в форме списка 'Рабочее наименование' 'Не начинается с' 'Удалить_'
				И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
					И Я удаляю текущую строку в списке 'Список'
					И в таблице 'Список' я выбираю текущую строку
					Тогда открылось окно "* (Контрагент*)"
					И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					И я жду закрытия окна '* (Контрагент*)' в течение 20 секунд
				И я нажимаю на кнопку с именем 'ФормаНастройкаСписка'
				И Я снимаю все отборы в форме списка
			* Удаляем договоры
				И В текущем окне я нажимаю кнопку командного интерфейса "Договоры"
				И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНастройкаСписка'
				И Я устанавливаю отбор в форме списка 'Рабочее наименование' 'Не начинается с' 'Удалить_'
				И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
					И Я удаляю текущую строку в списке 'Список'
					И в таблице 'Список' я выбираю текущую строку
					Тогда открылось окно "* (Договор*)"
					Если элемент 'РедактироватьВерсию' доступен для редактирования Тогда 
						И я нажимаю на кнопку с именем 'РедактироватьВерсию'
					И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
					И я нажимаю на кнопку с именем 'ФормаЗаписать'
					Тогда открылось окно "*"
					И Я закрываю окно "*"
				И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНастройкаСписка'
				И Я снимаю все отборы в форме списка
			* Переименовываем
				И В текущем окне я нажимаю кнопку командного интерфейса "Основное"
				Тогда открылось окно "* (Партнер)"
				И в поле с именем 'НаименованиеПолноеКомпания' я ввожу значение переменной 'УИД'
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна '* (Партнер) *' в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Партнеры"
		И в таблице 'Список' я нажимаю на кнопку с именем 'СоздатьНового'
		Тогда открылось окно "Партнер (создание)"
		И в поле с именем 'НаименованиеПолноеКомпания' я ввожу текст '[ТекИмяПартнера]'
		И я изменяю флаг с именем '[ТекТип]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Партнер (создание) *' в течение 20 секунд					

	* Закрываем формы
		Когда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Для партнера 'ТекИмяПартнера' я создаю контрагента с именем 'ТекИмяКонтрагента' вид 'ТекВидКонтрагента' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Главное" "Партнеры"
		И я жду открытия окна 'Партнеры' в течение 20 секунд

	* Находим партнера			
		И Я в списке "Партнеры" по полю "Наименование" ищу и выбираю элемент '[ТекИмяПартнера]' "По точному совпадению"
		//И в таблице 'Список' количество строк 'равно' 1
		//И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "[ТекИмяПартнера] (Партнер)"		

	* Удаляем существующие элементы
		И В текущем окне я нажимаю кнопку командного интерфейса "Контрагенты"
		И Я в списке "[ТекИмяПартнера] (Партнер)" по полю "Рабочее наименование" ищу элемент '[ТекИмяКонтрагента]' "По точному совпадению"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'Список'
			И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "* (Контрагент*)"
			И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна '* (Контрагент*)' в течение 20 секунд

	* Создаем контрагента
		Тогда открылось окно "[ТекИмяПартнера] (Партнер)"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Контрагент (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[ТекИмяКонтрагента]'
		Когда открылось окно "Контрагент (создание)"
		И из выпадающего списка с именем 'ВидКонтрагента' я выбираю точное значение '[ТекВидКонтрагента]'				
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

	* Закрываем форму
		Когда открылось окно "[ТекИмяПартнера] (Партнер)"
		И Я закрываю окно "[ТекИмяПартнера] (Партнер)"
		Тогда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Для партнера 'ТекИмяПартнера' контрагента 'ТекИмяКонтрагента' я создаю договор с видом 'ТекВидДоговора' номер 'ТекНомер' от 'ТекДата' организация 'ТекОрганизация' валюта 'ТекВалюта' сумма 'ТекСумма' соглашение 'ТекСоглашение' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Главное" "Партнеры"
		И я жду открытия окна 'Партнеры' в течение 20 секунд

	* Находим партнера
		И Я в списке "Партнеры" по полю "Наименование" ищу элемент '[ТекИмяПартнера]' "По точному совпадению"			
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "[ТекИмяПартнера] (Партнер)"		

	* Находим контрагента
		И В текущем окне я нажимаю кнопку командного интерфейса "Контрагенты"
		И Я в списке "[ТекИмяПартнера] (Партнер)" по полю "Рабочее наименование" ищу и выбираю элемент '[ТекИмяКонтрагента]' "По точному совпадению"
		Тогда открылось окно "[ТекИмяКонтрагента] (Контрагент *)"		

	* Удаляем договор
		И В текущем окне я нажимаю кнопку командного интерфейса "Договоры"
		Тогда открылось окно '[ТекИмяКонтрагента] (Контрагент *)'
		Если открылось окно 'Проверка контрагентов' Тогда
			И я нажимаю на кнопку с именем 'РучнаяПроверка'
		И Я в списке "[ТекИмяКонтрагента] (Контрагент *)" по полю "Рабочее наименование" ищу элемент '[ТекНомер] от [ТекДата]' "По точному совпадению"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'Список'
			И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "* (Договор*)"
			Если элемент 'РедактироватьВерсию' доступен для редактирования Тогда
				И я нажимаю на кнопку с именем 'РедактироватьВерсию'						
			И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно "*"
			И Я закрываю окно "*"

	* Создаем договор
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокСоздать'
		Если открылось окно 'Проверка контрагентов' Тогда
			И я нажимаю на кнопку с именем 'РучнаяПроверка'
		Тогда открылось окно "Выберите вид договора"
		И в таблице 'ВидыДоговоров' я перехожу к строке:
			| 'Вид договора'     |
			| '[ТекВидДоговора]' |
		И в таблице 'ВидыДоговоров' я выбираю текущую строку
		Тогда открылось окно "Договор * (создание)"
		И в поле с именем 'Номер' я ввожу текст '[ТекНомер]'
		И в поле с именем 'Дата' я ввожу текст '[ТекДата]'
		И в поле с именем 'Наименование' я ввожу текст "[ТекНомер] от [ТекДата]"
		И из выпадающего списка с именем 'Организация' я выбираю по строке '[ТекОрганизация]'
		И из выпадающего списка с именем 'ВалютаВзаиморасчетов' я выбираю точное значение '[ТекВалюта]'
		И я устанавливаю флаг с именем 'ФиксированнаяСуммаДоговора'
		И в поле с именем 'СуммаДоговора' я ввожу текст '[ТекСумма]'		
		Тогда открылось окно "Договор с * (создание) *"
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Договор с * (создание) *' в течение 20 секунд

	* Закрываем форму
		Когда открылось окно "[ТекИмяКонтрагента] (Контрагент *)"
		И Я закрываю окно "[ТекИмяКонтрагента] (Контрагент *)"				
		Когда открылось окно "[ТекИмяПартнера] (Партнер)"
		И Я закрываю окно "[ТекИмяПартнера] (Партнер)"
		Тогда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Я для организации "ТекОрганизация" создаю подразделение с именем "ТекИмяПодразделения" в 1C:ERPУХ

	* Удаляем существующие элементы
		И В командном интерфейсе я выбираю "НСИ и администрирование" "Структура предприятия"
		И Я в списке "Структура предприятия" по полю "Наименование" ищу элемент '[ТекИмяПодразделения]' "По точному совпадению"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'Список'					
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "[ТекИмяПодразделения] (Подразделение)"
			И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
			И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

	* Создаем элемент
		Тогда открылось окно "Структура предприятия"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Подразделение (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[ТекИмяПодразделения]'
		И из выпадающего списка с именем 'ОрганизацияУХ' я выбираю по строке '[ТекОрганизация]'
		И из выпадающего списка с именем 'ЦФО' я выбираю по строке '[ТекОрганизация]'
		Тогда открылось окно "Подразделение (создание) *"		
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Подразделение (создание) *" в течение 20 секунд

	* Закрываем форму списка
		Тогда открылось окно "Структура предприятия"
		И я закрываю окно "Структура предприятия"		
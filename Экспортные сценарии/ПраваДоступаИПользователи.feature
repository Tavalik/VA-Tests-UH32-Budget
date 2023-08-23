﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для настройки пользователей и прав доступа

Сценарий: Я создаю профиль с именем 'TheName' на основании профиля 'TheProfile'

	* Открываем список
		И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПрофилиГруппДоступа'
		Тогда открылось окно "Профили групп доступа"

	* Удаляем существующий профиль
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'				
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И в поле с именем 'Pattern' я ввожу текст '[TheName]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Профили групп доступа"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'Список'
			* Переименовываем
				И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "* (Профиль групп доступа)"
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "* (Профиль групп доступа) *" в течение 20 секунд

	* Ищем предопределенный профиль
		Тогда открылось окно "Профили групп доступа"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'				
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И в поле с именем 'Pattern' я ввожу текст '[TheProfile]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Профили групп доступа"
		И в таблице 'Список' количество строк 'равно' 1

	* Копируем профиль
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюСкопировать' на элементе формы с именем "Список"
		Тогда открылось окно 'Профиль групп доступа (создание)'
		И в поле с именем 'Наименование' я ввожу текст '[TheName]'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'	
	
	* Закрываем окна
		Тогда открылось окно "[TheName] (Профиль групп доступа)"	
		И я закрываю окно "[TheName] (Профиль групп доступа)"
		Тогда открылось окно "Профили групп доступа"
		И Я закрываю окно "Профили групп доступа"	

Сценарий: Я добавляю в профиль 'TheProfile' ограничение доступа с видом 'TheType' значением	'TheValue'

	* Открываем список
		И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПрофилиГруппДоступа'
		Тогда открылось окно "Профили групп доступа"

	* Ищем существующий профиль
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'				
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И в поле с именем 'Pattern' я ввожу текст '[TheProfile]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Профили групп доступа"
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку

	* Удаляем вид доступа если он уже задан
		Тогда открылось окно '[TheProfile] (Профиль групп доступа)'
		И я перехожу к закладке с именем 'ВидыИЗначенияДоступа'
		И Я запоминаю значение выражения '[TheType]' в переменную 'ТекущийТип'
		Если в таблице 'ВидыДоступа' есть строка Тогда
			| "Вид доступа"  |
			| '$ТекущийТип$' |
			И в таблице 'ВидыДоступа' я перехожу к строке
				| "Вид доступа" |
				| '$ТекущийТип$' |
			И я выбираю пункт контекстного меню с именем 'ВидыДоступаКонтекстноеМенюУдалить' на элементе формы с именем 'ВидыДоступа'
						
	* Добавляем ограничение доступа		
		И в таблице 'ВидыДоступа' я нажимаю на кнопку с именем 'ВидыДоступаДобавить'
		И в таблице 'ВидыДоступа' из выпадающего списка с именем 'ВидыДоступаВидДоступаПредставление' я выбираю точное значение '[TheType]'
		И я перехожу к следующему реквизиту
		И в таблице 'ВидыДоступа' из выпадающего списка с именем 'ВидыДоступаВсеРазрешеныПредставление' я выбираю точное значение '[TheValue]'
		И в таблице 'ВидыДоступа' я завершаю редактирование строки

	* Записываем элемент
		Когда открылось окно "[TheProfile] (Профиль групп доступа) *"		
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'		
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		И я жду закрытия окна "[TheProfile] (Профиль групп доступа) *" в течение 20 секунд
		Тогда открылось окно "Профили групп доступа"
		И Я закрываю окно "Профили групп доступа"

Сценарий: Я нахожу или создаю группу доступа с именем 'TheName' по профилю 'TheProfile'

	* Открываем список
		И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьГруппыДоступа'
		Тогда открылось окно "Группы доступа"

	* Ищем или создаем нужную группу
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст '[TheName]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Группы доступа"
		Если в таблице 'Список' количество строк "равно" 1 Тогда
			И в таблице 'Список' я выбираю текущую строку
		Иначе
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно "Группа доступа (создание)"
			И в поле с именем 'Наименование' я ввожу текст '[TheName]'

	* Обновляем настройки
		Если 'NOT StrStartsWith("[TheProfile]", "Администратор")' Тогда
			И из выпадающего списка с именем "Профиль" я выбираю по строке '[TheProfile]'
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно '[TheName] (Группа доступа)'

	И я закрываю окно "[TheName] (Группа доступа)"
	Тогда открылось окно "Группы доступа"
	И Я закрываю окно "Группы доступа"		

Сценарий: Я добавляю в группу доступа 'TheProfile' значения доступа с видом 'TheType' из таблицы

	* Открываем список
		И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьГруппыДоступа'
		Тогда открылось окно "Группы доступа"
	
	* Ищем группу доступа
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И в поле с именем 'Pattern' я ввожу текст '[TheProfile]'
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Группы доступа"
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку

	* Настраиваем ограничения
		Тогда открылось окно "[TheProfile] (Группа доступа)"
		И я перехожу к закладке с именем 'Доступ'
		И я удаляю все строки таблицы 'ЗначенияДоступа'		
		И я заполняю таблицу 'ЗначенияДоступа' данными
			| 'Таблица' |

	* Сохраняем профиль
		Когда открылось окно "[TheProfile] (Группа доступа) *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "[TheProfile] (Группа доступа) *" в течение 20 секунд
		Тогда открылось окно "Группы доступа"
		И Я закрываю окно "Группы доступа"

Сценарий: Я нахожу или создаю группу пользователей с именем 'TheName'

	* Открываем список
		И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПользователи'
		Тогда открылось окно "Пользователи"

	* Ищем или создаем нужную группу
		И я выбираю пункт контекстного меню с именем 'ГруппыПользователейКонтекстноеМенюНайти' на элементе формы с именем 'ГруппыПользователей'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст '[TheName]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Пользователи"
		Если в таблице 'ГруппыПользователей' количество строк "равно" 0 Тогда
			И я нажимаю на кнопку с именем 'СоздатьГруппуПользователей'	
			Когда открылось окно 'Группа пользователей (создание)'
			И в поле с именем 'Наименование' я ввожу текст '[TheName]'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Группа пользователей (создание) *' в течение 20 секунд

	Тогда открылось окно "Пользователи"
	И Я закрываю окно "Пользователи"

Сценарий: Я нахожу или создаю пользователя 'TheUser' язык отчетности 'TheLanguage' группа доступа 'TheProfile' группа 'TheGroup'

	* Открываем список
		И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я нажимаю на кнопку с именем 'ОткрытьПользователи'
		Тогда открылось окно "Пользователи"

	* Ищем или создаем нужного пользователя
		И я выбираю пункт контекстного меню с именем 'ПользователиСписокКонтекстноеМенюНайти' на элементе формы с именем 'ПользователиСписок'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Полное имя"
		И в поле с именем 'Pattern' я ввожу текст '[TheUser]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Пользователи'
		Если в таблице 'ПользователиСписок' количество строк "равно" 1 Тогда
			И в таблице 'ПользователиСписок' я выбираю текущую строку
		Иначе
			И я нажимаю на кнопку с именем 'СоздатьПользователя'
			Тогда открылось окно "Пользователь (создание)"
			И в поле с именем 'Наименование' я ввожу текст '[TheUser]'
							
	* Обновляем настройки
		И я устанавливаю флаг с именем 'ВходВПрограммуРазрешен'
		И я устанавливаю флаг с именем 'ПользовательИБАутентификацияСтандартная'
		И я устанавливаю флаг с именем 'ПользовательИБПоказыватьВСпискеВыбора'
		И из выпадающего списка с именем "ПользовательИБРежимЗапуска" я выбираю точное значение "Авто"
		И из выпадающего списка с именем "ОсновнойЯзыкУХ" я выбираю точное значение '[TheLanguage]'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно "[TheUser] (Пользователь)"	

	Если 'NOT IsBlankString("[TheProfile]")' Тогда
		* Очищаем группы и устанавливаем переданную
			И В текущем окне я нажимаю кнопку командного интерфейса "Права доступа"
			И пока в таблице 'ГруппыДоступа' количество строк ">" 0 Тогда
				И в таблице "ГруппыДоступа" я нажимаю на кнопку с именем 'ГруппыДоступаИсключитьИзГруппы'	
			И в таблице 'ГруппыДоступа' я нажимаю на кнопку с именем 'ГруппыДоступаВключитьВГруппу'
			Тогда открылось окно "Группы доступа"
			И я выбираю пункт контекстного меню с именем 'ГруппыДоступаНайти' на элементе формы с именем 'ГруппыДоступа'
			Тогда открылось окно "Найти"
			И в поле с именем 'Pattern' я ввожу текст '[TheProfile]'
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Группы доступа"
			И в таблице 'ГруппыДоступа' я выбираю текущую строку

	Если 'NOT IsBlankString("[TheGroup]")' Тогда
		Когда открылось окно "[TheUser] (Пользователь)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Группы"
		И Я запоминаю значение выражения '[TheGroup]' в переменную 'ТекущаяГруппа'
		И в таблице "ДеревоГрупп" я перехожу к строке:
			| 'Группа'          |
			| '$ТекущаяГруппа$' |
		И в таблице "ДеревоГрупп" я устанавливаю флаг с именем 'ДеревоГруппПометка'
		И в таблице "ДеревоГрупп" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'					

	Когда открылось окно "[TheUser] (Пользователь)"	
	И я закрываю окно "[TheUser] (Пользователь)"			
	Тогда открылось окно "Пользователи"
	И Я закрываю окно "Пользователи"				

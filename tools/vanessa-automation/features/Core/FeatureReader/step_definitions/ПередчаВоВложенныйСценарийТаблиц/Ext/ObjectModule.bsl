//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////


// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 

// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 

// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;


// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУдалилИзПеременнойКонтекстСохраняемыйВсеЗначенияУКоторыхВИмениСодержитсяСтрока(Парам01)","ЯУдалилИзПеременнойКонтекстСохраняемыйВсеЗначенияУКоторыхВИмениСодержитсяСтрока","И я удалил из переменной КонтекстСохраняемый все значения у которых в имени содержится строка ""Значение""","","");

	Возврат ВсеТесты;
КонецФункции
	
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	Возврат ПолучитьМакет(ИмяМакета);
КонецФункции
	

// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////


// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры


// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////


//И я удалил из переменной КонтекстСохраняемый все значения у которых в имени содержится строка "Значение"
//@ЯУдалилИзПеременнойКонтекстСохраняемыйВсеЗначенияУКоторыхВИмениСодержитсяСтрока(Парам01)
Процедура ЯУдалилИзПеременнойКонтекстСохраняемыйВсеЗначенияУКоторыхВИмениСодержитсяСтрока(Стр) Экспорт
	Массив = Новый Массив;
	ИД = -1;
	Для Каждого Элем Из КонтекстСохраняемый Цикл
		ИД = ИД + 1;
		Если Найти(НРег(Элем.Ключ),НРег(Стр)) > 0 Тогда
			Массив.Добавить(Элем.Ключ);
		КонецЕсли;	 
	КонецЦикла;	
	
	Для Каждого Ключ Из Массив Цикл
		КонтекстСохраняемый.Удалить(Ключ);
	КонецЦикла;	
КонецПроцедуры

//окончание текста модуля  
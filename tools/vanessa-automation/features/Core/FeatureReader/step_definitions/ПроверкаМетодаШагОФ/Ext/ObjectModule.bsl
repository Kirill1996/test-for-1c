
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

// контекст фреймворка Vanessa-Behavior
Перем Ванесса;

// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЭтотШагПринимаетНаВходТаблицу(ТабПарам)","ЭтотШагПринимаетНаВходТаблицу","Когда этот шаг принимает на вход таблицу:","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВСвоёмМетодеЯВызовуСлужебныйШагСВызовомТаблицы()","ВСвоёмМетодеЯВызовуСлужебныйШагСВызовомТаблицы","Когда в своём методе я вызову служебный шаг с вызовом таблицы","","");

	Возврат ВсеТесты;
КонецФункции
	
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакет(ИмяМакета);
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

//Когда этот шаг принимает на вход таблицу:
//@ЭтотШагПринимаетНаВходТаблицу(ТабПарам)
Процедура ЭтотШагПринимаетНаВходТаблицу(ТабПарам) Экспорт
	Если ТабПарам[0].Количество() <> 2 Тогда
		ВызватьИсключение "Должно было быть 2 колонки у таблицы.";
	КонецЕсли;	 
КонецПроцедуры

//Когда в своём методе я вызову служебный шаг с вызовом таблицы
//@ВСвоёмМетодеЯВызовуСлужебныйШагСВызовомТаблицы()
Процедура ВСвоёмМетодеЯВызовуСлужебныйШагСВызовомТаблицы() Экспорт
	Стр = "
	|Когда этот шаг принимает на вход таблицу:
	|| Колонка1  | Колонка2  |
	|| Значение1 | Значение2 |
	|";
	Ванесса.Шаг(Стр);
КонецПроцедуры

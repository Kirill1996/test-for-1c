//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВПеременнойКонтекстБудетЗначениеИ(Значение,Тип)","ВПеременнойКонтекстБудетЗначениеИ","Тогда в переменной контекст будет значение <Значение> и <Тип>");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Тогда в переменной контекст будет значение <Значение> и <Тип>
//@ВПеременнойКонтекстБудетЗначениеИ(Значение,Тип)
Процедура ВПеременнойКонтекстБудетЗначениеИ(Значение,Тип) Экспорт
	Если Контекст[Тип] <> Значение Тогда
		ТекстСообщения = "Ожидали, что в переменной контекст будет: Контекст.%1 = %2";
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",Тип);
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",Значение);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
КонецПроцедуры

//окончание текста модуля

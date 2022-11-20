Процедура Информация(Текст);
	Сообщить("ИНФОРМАЦИЯ - " + Текст);
КонецПроцедуры

Процедура ПроверитьСуществованиеКаталога(Путь)
	ФайлКаталога = Новый Файл(Путь);
	Если НЕ ФайлКаталога.Существует() Тогда
		ПроверитьСуществованиеКаталога(ФайлКаталога.Путь);
		Информация("Создан каталог: " + Путь);
		СоздатьКаталог(Путь);
	КонецЕсли;
КонецПроцедуры

Функция ФайлыРазличаются(Каталог, ПутьФайлаМакета, Маска = "*.*")

	ФайлМакета = Новый Файл(ПутьФайлаМакета);
	Если НЕ ФайлМакета.Существует() Тогда
		Возврат Истина;
	КонецЕсли;

	ТаблицаЗначений = Новый ТаблицаЗначений;
	ТаблицаЗначений.Колонки.Добавить("ХешСумма");
	ТаблицаЗначений.Колонки.Добавить("Оригинал");
	ТаблицаЗначений.Колонки.Добавить("МакетZip");

	МассивФайлов = НайтиФайлы(Каталог, Маска, Ложь);

	Если МассивФайлов.Количество() = 0 Тогда
		ТекстСообщения = "Каталог <" + Каталог + "> пуст";
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;

	Для каждого ФайлСкрипта Из МассивФайлов Цикл
		ХешированиеДанных = Новый ХешированиеДанных(ХешФункция.SHA256);
		ХешированиеДанных.ДобавитьФайл(ФайлСкрипта.ПолноеИмя);
		Стр = ТаблицаЗначений.Добавить();
		Стр.ХешСумма = ХешированиеДанных.ХешСуммаСтрокой;
		Стр.Оригинал = 1;
	КонецЦикла;

	ВременныйКаталог = ПолучитьИмяВременногоФайла();
	УдалитьФайлы(ВременныйКаталог);
	СоздатьКаталог(ВременныйКаталог);

	ЧтениеZipФайла = Новый ЧтениеZipФайла(ПутьФайлаМакета);
	МассивЭлементовБиблиотеки = Новый Массив;
	Для Каждого ЭлементZipФайла Из ЧтениеZipФайла.Элементы Цикл
		ЧтениеZipФайла.Извлечь(ЭлементZipФайла, ВременныйКаталог, РежимВосстановленияПутейФайловZIP.Восстанавливать);
		ИмяФайлаСкрипта = ВременныйКаталог + "/" + ЭлементZipФайла.ПолноеИмя;
		ХешированиеДанных = Новый ХешированиеДанных(ХешФункция.SHA256);
		ДвоичныеДанные = Новый ДвоичныеДанные(ИмяФайлаСкрипта);
		ХешированиеДанных.Добавить(ДвоичныеДанные);
		Стр = ТаблицаЗначений.Добавить();
		Стр.ХешСумма = ХешированиеДанных.ХешСуммаСтрокой;
		Стр.МакетZip = 1;
	КонецЦикла;
	УдалитьФайлы(ВременныйКаталог);
	ЧтениеZipФайла.Закрыть();

	ТаблицаЗначений.Свернуть("ХешСумма", "Оригинал,МакетZip");
	Для каждого Стр Из ТаблицаЗначений Цикл
		Если Стр.Оригинал <> Стр.МакетZip Тогда
			Возврат Истина;
		КонецЕсли;
	КонецЦикла;

	Возврат Ложь;

КонецФункции

Процедура УпаковатьМакет(Каталог, ПутьФайлаМакета, Маска = "*.*")

	ФайлКаталога = Новый Файл(Каталог);
	Если НЕ ФайлКаталога.Существует() Тогда
		ТекстСообщения = "Каталог <" + ФайлКаталога + "> не существует.";
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;

	ФайлМакета = Новый Файл(ПутьФайлаМакета);
	ПроверитьСуществованиеКаталога(ФайлМакета.Путь);
	УдалитьФайлы(ПутьФайлаМакета);

	ЗаписьZIP = Новый ЗаписьZipФайла(ПутьФайлаМакета);
	МассивФайлов = НайтиФайлы(Каталог, Маска, Ложь);
	Для каждого ФайлСкрипта Из МассивФайлов Цикл
		ЗаписьZIP.Добавить(ФайлСкрипта.ПолноеИмя, РежимСохраненияПутейZIP.НеСохранятьПути);
		Информация("Добавлен файл: " + ФайлСкрипта.Имя);
	КонецЦикла;
	ЗаписьZIP.Записать();
	Информация("Создан макет: " + ПутьФайлаМакета);

КонецПроцедуры

Маска = "*.js";
КаталогФайлов = "./lib/VA_Chrome/";
ПутьФайлаМакета = "./VanessaAutomation/Templates/БиблиотекаJavaScript/Ext/Template.bin";
Информация("Сборка макета библиотеки скриптов JavaScript.");
Если ФайлыРазличаются(КаталогФайлов, ПутьФайлаМакета, Маска) Тогда
	УпаковатьМакет(КаталогФайлов, ПутьФайлаМакета, Маска);
Иначе
	Информация("Состав библиотеки JavaScript не изменился.");
КонецЕсли;

КаталогФайлов = "./lib/Keywords/";
ПутьФайлаМакета = "./VanessaAutomation/Templates/КлючевыеСловаGherkin/Ext/Template.bin";
Информация("Сборка макета ключевых слов.");
Если ФайлыРазличаются(КаталогФайлов, ПутьФайлаМакета) Тогда
	УпаковатьМакет(КаталогФайлов, ПутьФайлаМакета);
Иначе
	Информация("Набор ключевых слов не изменился.");
КонецЕсли;

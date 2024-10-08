// BSLLS:MissingVariablesDescription-off

#Использовать ".."
#Использовать "."
#Использовать asserts

&Тест
Процедура НаследникСоздается() Экспорт

	// Дано
	ТестовыйНаследник = Новый ТестовыйНаследник;
	ТестовыйРодитель = Новый ТестовыйРодитель;
	ПостроительНаследника = Новый ПостроительНаследника(ТестовыйНаследник, ТестовыйРодитель);

	// Когда
	Наследник = ПостроительНаследника.Построить();

	// Тогда
	Ожидаем.Что(Наследник).Не_().Равно(Неопределено);

КонецПроцедуры

&Тест
Процедура УНаследникаДобавляютсяМетодыРодителя() Экспорт

	// Дано
	ТестовыйНаследник = Новый ТестовыйНаследник;
	ТестовыйРодитель = Новый ТестовыйРодитель;
	ПостроительНаследника = Новый ПостроительНаследника(ТестовыйНаследник, ТестовыйРодитель);
	Наследник = ПостроительНаследника.Построить();

	// Когда
	Результат = Наследник.ТестоваяФункция();

	// Тогда
	Ожидаем.Что(Результат).Равно(1);

КонецПроцедуры

&Тест
Процедура УНаследникаДоступныСобственныеМетоды() Экспорт

	// Дано
	ТестовыйНаследник = Новый ТестовыйНаследник;
	ТестовыйРодитель = Новый ТестовыйРодитель;
	ПостроительНаследника = Новый ПостроительНаследника(ТестовыйНаследник, ТестовыйРодитель);
	Наследник = ПостроительНаследника.Построить();

	// Когда
	Результат = Наследник.ТестоваяДобавленаяФункция();

	// Тогда
	Ожидаем.Что(Результат).Равно(2);

КонецПроцедуры


&Тест
Процедура НаследникПереопределяетМетодыРодителя() Экспорт

	// Дано
	ТестовыйНаследник = Новый ТестовыйНаследник;
	ТестовыйРодитель = Новый ТестовыйРодитель;
	ПостроительНаследника = Новый ПостроительНаследника(ТестовыйНаследник, ТестовыйРодитель);
	Наследник = ПостроительНаследника.Построить();

	// Когда
	Результат = Наследник.ТестоваяПереопределяемаяФункция();

	// Тогда
	Ожидаем.Что(Результат).Равно(3);

КонецПроцедуры

&Тест
Процедура ПроцедурыРодителяВызываютсяБезОшибок() Экспорт

	// Дано
	ТестовыйНаследник = Новый ТестовыйНаследник;
	ТестовыйРодитель = Новый ТестовыйРодитель;
	ПостроительНаследника = Новый ПостроительНаследника(ТестовыйНаследник, ТестовыйРодитель);
	Наследник = ПостроительНаследника.Построить();

	// Когда-тогда
	Ожидаем.Что(Наследник).Метод("ТестоваяПроцедура").Не_().ВыбрасываетИсключение();

КонецПроцедуры
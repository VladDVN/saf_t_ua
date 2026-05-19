-- SAF-T UA v2.0 (XSD) -> PostgreSQL (скелет реляційної схеми)
-- -----------------------------------------------------------------------------
-- Цей скрипт створює "стартову" схему під імпорт SAF-T XML у PostgreSQL:
-- Цей файл дає основу, яку можна нарощувати.
-- -----------------------------------------------------------------------------

BEGIN;

CREATE SCHEMA IF NOT EXISTS saf_t_ua;

SET search_path = saf_t_ua, public;

END;


-- ========== MasterFiles ==========

CREATE TABLE IF NOT EXISTS AccountingPolicies (
	KEY character(40) NOT NULL PRIMARY KEY,
	VALUE JSONB NOT NULL
	
);

INSERT INTO
	AccountingPolicies (KEY, VALUE)
VALUES
	(
		'AccountingPolicy',
		'{
    		"NameOfAccountingPolicy": "Метод оцінки вибуття запасів",
    		"DescriptionOfAccountingPolicy": "Пpи відпycтці зaпacів y виpoбництвo, з виpoбництвa, пpoдaж тa іншoмy вибyтті oцінкa їx здійcнюєтьcя зa мeтoдoм coбівapтocті пepшиx зa чacoм нaдxoджeнь зaпacів (ФІФО)",
    		"AccountingPolicyDocument": "Наказ №1 від 01.01.2015",
    		"AccountingStandart": "П. 25 МСБО 2"
  }'::JSONB
	);
	
COMMIT;	

	
CREATE TABLE IF NOT EXISTS TransactionFeatures (
	ID character(18) PRIMARY KEY,
	KEY character(40) NOT NULL,
	VALUE JSONB NOT NULL
	
);

INSERT INTO
	TransactionFeatures (ID, KEY, VALUE)
VALUES
	(
		'Покупка',
		'TransactionFeature',
		'{
    		"TransactionType": "Покупка",
    		"TransactionTypeDescription": "Покупка товару"
		}'::JSONB),	
	(
		'Комисия',
		'TransactionFeature',
		'{
    		"TransactionType": "Комісія",
    		"TransactionTypeDescription": "Надходження товару на комісію"
  }'::JSONB),
	(
		'ВПереробку',
		'TransactionFeature',
		'{
    		"TransactionType": "ВПереробку",
    		"TransactionTypeDescription": "Надходження товару на переробку"
  }'::JSONB
	),
	(
		'Обладнання',
		'TransactionFeature',
		'{
    		"TransactionType": "Обладнання",
    		"TransactionTypeDescription": "Надходження обладнання"
  }'::JSONB),
	(
		'ОББудівництва',
		'TransactionFeature',
		'{
    		"TransactionType": "ОББудівництва",
    		"TransactionTypeDescription": "Надходження об`єктів будівництва"
  }'::JSONB
	),
	(
		'ПоверненняЗПер',
		'TransactionFeature',
		'{
    		"TransactionType": "ПоверненняЗПер",
    		"TransactionTypeDescription": "Повернення матеріалів з переробки"
  }'::JSONB
	),
	(
		'ПоверненняВідЗ',
		'TransactionFeature',
		'{
    		"TransactionType": "ПоверненняВідЗ",
    		"TransactionTypeDescription": "Повернення продукції від замовника"
  }'::JSONB
	),
	(
		'ПоверненняВідПок',
		'TransactionFeature',
		'{
    		"TransactionType": "ПоверненняВідПок",
    		"TransactionTypeDescription": "Повернення товарів від покупця"
  }'::JSONB
	),
	(
		'ПоверненняЗКом',
		'TransactionFeature',
		'{
    		"TransactionType": "ПоверненняЗКом",
    		"TransactionTypeDescription": "Повернення товарів від комісіонера"
  }'::JSONB
	),
	(
		'ПоверненняПост',
		'TransactionFeature',
		'{
    		"TransactionType": "ПоверненняПост",
    		"TransactionTypeDescription": "Повернення товарів постачальнику"
  }'::JSONB
	),
	(
		'ПоверненняКт',
		'TransactionFeature',
		'{
    		"TransactionType": "ПоверненняКт",
    		"TransactionTypeDescription": "Повернення товарів комітенту"
  }'::JSONB
	),
	(
		'ПН',
		'TransactionFeature',
		'{
    		"TransactionType": "ПН",
    		"TransactionTypeDescription": "Податкова накладна"
  }'::JSONB
	),
	(
		'РКП',
		'TransactionFeature',
		'{
    		"TransactionType": "РКП",
    		"TransactionTypeDescription": "Розрахунок коригування (поверненння)"
  }'::JSONB
	),
	(
		'РКС',
		'TransactionFeature',
		'{
    		"TransactionType": "РКС",
    		"TransactionTypeDescription": "Розрахунок коригування (зміна суми)"
  }'::JSONB
	),
	(
		'ТОТК',
		'TransactionFeature',
		'{
    		"TransactionType": "ТОТК",
    		"TransactionTypeDescription": "Тамож. оформлення товарів комітента (право на кредит)"
  }'::JSONB
	),
	(
		'ВПК',
		'TransactionFeature',
		'{
    		"TransactionType": "ВПК",
    		"TransactionTypeDescription": "Відновлення податкового кредиту"
  }'::JSONB
	),
	(
		'Комплектація',
		'TransactionFeature',
		'{
    		"TransactionType": "Комплектація",
    		"TransactionTypeDescription": "Комплектація номенклатури"
  }'::JSONB
	),
	(
		'ВипускПрод',
		'TransactionFeature',
		'{
    		"TransactionType": "ВипускПрод",
    		"TransactionTypeDescription": "Випуск продукції"
  }'::JSONB
	),
	(
		'ЗПереробки',
		'TransactionFeature',
		'{
    		"TransactionType": "ЗПереробки",
    		"TransactionTypeDescription": "Надходження продукції з переробки"
  }'::JSONB
	),
	(
		'Фуза',
		'TransactionFeature',
		'{
    		"TransactionType": "Фуза",
    		"TransactionTypeDescription": "Відокремлення фузи"
  }'::JSONB
	),
	(
		'ЗмінаБорг',
		'TransactionFeature',
		'{
    		"TransactionType": "ЗмінаБорг",
    		"TransactionTypeDescription": "Зміна заборгованості"
  }'::JSONB
	),
	(
		'СписБорг',
		'TransactionFeature',
		'{
    		"TransactionType": "СписБорг",
    		"TransactionTypeDescription": "Списання заборгованості"
  }'::JSONB
	),
	(
		'НарахЗП',
		'TransactionFeature',
		'{
    		"TransactionType": "НарахЗП",
    		"TransactionTypeDescription": "Нарахування заробітної плати"
  }'::JSONB
	),
	(
		'ВиплатаЗП',
		'TransactionFeature',
		'{
    		"TransactionType": "ВиплатаЗП",
    		"TransactionTypeDescription": "Виплата заробітної плати"
  }'::JSONB
	),
	(
		'ПереміщенняТМЦ',
		'TransactionFeature',
		'{
    		"TransactionType": "ПереміщенняТМЦ",
    		"TransactionTypeDescription": "Переміщення товарно-матеріальних цінностей"
  }'::JSONB
	),
	(
		'ОплатаПок',
		'TransactionFeature',
		'{
    		"TransactionType": "ОплатаПок",
    		"TransactionTypeDescription": "Оплата покупця"
  }'::JSONB
	),
	(
		'ОплатаПост',
		'TransactionFeature',
		'{
    		"TransactionType": "ОплатаПост",
    		"TransactionTypeDescription": "Оплата постачальнику"
  }'::JSONB
	),
	(
		'ПоверненняКошт',
		'TransactionFeature',
		'{
    		"TransactionType": "ПоверненняКошт",
    		"TransactionTypeDescription": "Повернення коштів"
  }'::JSONB
	),
	(
		'ІншіРозрахунки',
		'TransactionFeature',
		'{
    		"TransactionType": "ІншіРозрахунки",
    		"TransactionTypeDescription": "Інші розрахунки з контрагентами"
  }'::JSONB
	),
	(
		'ПокупкаВалюти',
		'TransactionFeature',
		'{
    		"TransactionType": "ПокупкаВалюти",
    		"TransactionTypeDescription": "Покупка валюти"
  }'::JSONB
	),
	(
		'ПослугаПок',
		'TransactionFeature',
		'{
    		"TransactionType": "ПослугаПок",
    		"TransactionTypeDescription": "Надання послуг"
  }'::JSONB
	),
	(
		'ПослугаПост',
		'TransactionFeature',
		'{
    		"TransactionType": "ПослугаПост",
    		"TransactionTypeDescription": "Отримання послуг"
  }'::JSONB
	),
	(
		'ВитратаН',
		'TransactionFeature',
		'{
    		"TransactionType": "ВитратаН",
    		"TransactionTypeDescription": "Надходження витрат"
  }'::JSONB
	),
	(
		'ВитратаС',
		'TransactionFeature',
		'{
    		"TransactionType": "ВитратаС",
    		"TransactionTypeDescription": "Списання витрат"
  }'::JSONB
	),
	(
		'ІншВитр',
		'TransactionFeature',
		'{
    		"TransactionType": "ІншВитр",
    		"TransactionTypeDescription": "Інші витрати"
  }'::JSONB
	),
	(
		'Пр.накл.',
		'TransactionFeature',
		'{
    		"TransactionType": "Пр.накл.",
    		"TransactionTypeDescription": "Покупка"
  }'::JSONB
	),
	(
		'ПрибВПер',
		'TransactionFeature',
		'{
    		"TransactionType": "ПрибВПер",
    		"TransactionTypeDescription": "Передача в переробку"
  }'::JSONB
	),
	(
		'ПеремТов',
		'TransactionFeature',
		'{
    		"TransactionType": "ПеремТов",
    		"TransactionTypeDescription": "Переміщення товарів"
  }'::JSONB
	),
	(
		'РТУ',
		'TransactionFeature',
		'{
    		"TransactionType": "РТУ",
    		"TransactionTypeDescription": "Реалізація товарів та послуг"
  }'::JSONB
	),
	(
		'Комплект',
		'TransactionFeature',
		'{
    		"TransactionType": "Комплект",
    		"TransactionTypeDescription": "Комплектація"
  }'::JSONB
	),
	(
		'ПередТов',
		'TransactionFeature',
		'{
    		"TransactionType": "ПередТов",
    		"TransactionTypeDescription": "Передача товарів"
  }'::JSONB
	),
	(
		'ПрибПер',
		'TransactionFeature',
		'{
    		"TransactionType": "ПрибПер",
    		"TransactionTypeDescription": "Прибуткування товарів з переробки"
  }'::JSONB
	),
	(
		'НакВим',
		'TransactionFeature',
		'{
    		"TransactionType": "НакВим",
    		"TransactionTypeDescription": "Накладна-вимога"
  }'::JSONB
	),
	(
		'ВП',
		'TransactionFeature',
		'{
    		"TransactionType": "ВП",
    		"TransactionTypeDescription": "Виготовлення продукції"
  }'::JSONB
	),
	(
		'ПрОбл',
		'TransactionFeature',
		'{
    		"TransactionType": "ПрОбл",
    		"TransactionTypeDescription": "Прийняття до обліку"
  }'::JSONB
	),
	(
		'Посл.Стор.',
		'TransactionFeature',
		'{
    		"TransactionType": "Посл.Стор.",
    		"TransactionTypeDescription": "Отримання послуг сторонніх організацій"
  }'::JSONB
	),
	(
		'Ав.звіт',
		'TransactionFeature',
		'{
    		"TransactionType": "Ав.звіт",
    		"TransactionTypeDescription": "Авансовий звіт"
  }'::JSONB
	),
	(
		'ПТВК',
		'TransactionFeature',
		'{
    		"TransactionType": "ПТВК",
    		"TransactionTypeDescription": "Повернення товарів від покупця"
  }'::JSONB
	),
	(
		'ПТВП',
		'TransactionFeature',
		'{
    		"TransactionType": "ПТВП",
    		"TransactionTypeDescription": "Повернення товарів від постачальника"
  }'::JSONB
	),
	(
		'Бух.дов.',
		'TransactionFeature',
		'{
    		"TransactionType": "Бух.дов.",
    		"TransactionTypeDescription": "Бухгалтерська довідка"
  }'::JSONB
	),
	(
		'РеалізаціяТМЦ',
		'TransactionFeature',
		'{
    		"TransactionType": "РеалізаціяТМЦ",
    		"TransactionTypeDescription": "Реалізація товарів"
  }'::JSONB
	),
	(
		'ПТП',
		'TransactionFeature',
		'{
    		"TransactionType": "ПТП",
    		"TransactionTypeDescription": "Повернення товарів покупцю"
  }'::JSONB
	),
	(
		'ВМД',
		'TransactionFeature',
		'{
    		"TransactionType": "ВМД",
    		"TransactionTypeDescription": "Вантажо-митна декларація імпорт"
  }'::JSONB
	),
	(
		'ПередМат',
		'TransactionFeature',
		'{
    		"TransactionType": "ПередМат",
    		"TransactionTypeDescription": "Передача матеріалів в експлуатацію."
  }'::JSONB
	),
	(
		'РозСоб',
		'TransactionFeature',
		'{
    		"TransactionType": "РозСоб",
    		"TransactionTypeDescription": "Розрахунок собівартості випуску"
  }'::JSONB
	);
	
COMMIT;	

CREATE TABLE IF NOT EXISTS GeneralLedgerAccounts (
  
  ID character(35) PRIMARY KEY,
  KEY character(120) NOT NULL,
  VALUE JSONB NOT NULL,
  DESCR character(256)

);

INSERT INTO
	GeneralLedgerAccounts (ID, KEY, VALUE, DESCR)
VALUES
	(
		'101',
		'Account',
		'{
    		"AccountID": "101",
    		"AccountDescription": "Земельные участки",
    		"StandardAccountID": "101",
    		"GroupingCategory": "1",
    		"GroupingCode": "10",
    		"OpeningDebitBalance": "0",
    		"OpeningCreditBalance": "0",
    		"DebitTurnover": "0",
			"CreditTurnover": "0",
			"ClosingDebitBalance": "0",
			"ClosingCreditBalance": "0"
  }'::JSONB,
		'Земельные участки'
	);

COMMIT;

CREATE TABLE IF NOT EXISTS Customers (
	ID character(35) PRIMARY KEY,
	KEY character(120) NOT NULL,
	VALUE JSONB NOT NULL,
	DESCR character(256)
  
);

INSERT INTO
	Customers (ID, KEY, VALUE, DESCR)
VALUES
	(
		'426426426426',
		'Customer',
		'{
    		"RegistrationNumber": "426426426426",
    		"Name": "ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ &amp;quot;ПРИКЛАД&amp;quot;",
    		"CustomerID": "4264264264",
    		"CustomerBalance": {
									"AccountID":"361",
									"OpeningDebitBalance":0,
									"OpeningCreditBalance":0,
									"DebitTurnover":270597.05,
									"CreditTurnover":270597.05,
									"ClosingDebitBalance":0,
									"ClosingCreditBalance":0
								}
    		
		}'::JSONB,
		'ТОВ Приклад'
	);

COMMIT;

CREATE TABLE IF NOT EXISTS Suppliers (
	ID character(35) PRIMARY KEY,
	KEY character(120) NOT NULL,
	VALUE JSONB NOT NULL,
	DESCR character(256)
  
);

INSERT INTO
	Suppliers (ID, KEY, VALUE, DESCR)
VALUES
	(
		'426426426426',
		'Supplier',
		'{
    		"RegistrationNumber": "426426426426",
    		"Name": "ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ &amp;quot;Постачальник&amp;quot;",
    		"SupplierID": "4264264264",
    		"SupplierBalance": {
									"AccountID":"3711",
									"OpeningDebitBalance":0,
									"OpeningCreditBalance":0,
									"DebitTurnover":15000.91,
									"CreditTurnover":15000.91,
									"ClosingDebitBalance":0,
									"ClosingCreditBalance":0
								}
  }'::JSONB,
		'ТОВ Постачальник'
	);

COMMIT;

CREATE TABLE IF NOT EXISTS TaxTable (
	ID character(18) NOT NULL PRIMARY KEY,
	KEY character(120) NOT NULL,
	VALUE JSONB NOT NULL
	
);

INSERT INTO
	TaxTable (ID, KEY, VALUE)
VALUES
	(
		'ПДВ20',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"20",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"20"
								}
									
		}'::JSONB
	),
	(
		'ПДВ7',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"7",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"7"
								}
									
		}'::JSONB
	),
	(
		'ПДВ14',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"14",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"14"
								}
									
		}'::JSONB
	),
	(
		'ПДВ901',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"901",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"0"
								}
									
		}'::JSONB
	),
	(
		'ПДВ902',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"902",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"0"
								}
									
		}'::JSONB
	),
	(
		'ПДВ903',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"903",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"0"
								}
									
		}'::JSONB
	),
	(
		'НеПДВ',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"НеПДВ",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"0"
								}
									
		}'::JSONB
	),
	(
		'ПДВ20/імпорт',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"ПДВ20/імпорт",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"20"
								}
									
		}'::JSONB
	),
	(
		'ПДВ7/імпорт',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"ПДВ7/імпорт",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"7"
								}
									
		}'::JSONB
	),
	(
		'ПДВ14/імпорт',
		'TaxTableEntry',
		'{
    		"TaxType": "ПДВ",
    		"Description": "Податок на додану вартість",
			"TaxCodeDetails": {
									"TaxCode":"14/імпорт",
									"Description":"Податок на додану вартість",
									"TaxPercentage":"14"
								}
									
		}'::JSONB
	),
	(
		'ВійськовийЗбір',
		'TaxTableEntry',
		'{
    		"TaxType": "Збір",
    		"Description": "Військовий збір",
			"TaxCodeDetails": {
									"TaxCode":"ВЗ",
									"Description":"Військовий збір",
									"TaxPercentage":"5"
								}
									
		}'::JSONB
	),
	(
		'ЄСВ',
		'TaxTableEntry',
		'{
    		"TaxType": "ЄСВ",
    		"Description": "Єдиний соціальний внесок",
			"TaxCodeDetails": {
									"TaxCode":"ЄСВ",
									"Description":"Єдиний соціальний внесок",
									"TaxPercentage":"22"
								}
									
		}'::JSONB
	),
	(
		'ЄСВФОП',
		'TaxTableEntry',
		'{
    		"TaxType": "ЄСВ",
    		"Description": "Єдиний соціальний внесок",
			"TaxCodeDetails": {
									"TaxCode":"ЄСВФОП",
									"Description":"Єдиний соціальний внесок",
									"TaxPercentage":"22"
								}
									
		}'::JSONB
	),
	(
		'ПНПП',
		'TaxTableEntry',
		'{
    		"TaxType": "Податок",
    		"Description": "Податок на прибуток підприємств",
			"TaxCodeDetails": {
									"TaxCode":"ПНПП",
									"Description":"Податок на прибуток підприємств",
									"TaxPercentage":"40"
								}
									
		}'::JSONB
	),
	(
		'ЕКО',
		'TaxTableEntry',
		'{
    		"TaxType": "Податок",
    		"Description": "Екологічний податок",
			"TaxCodeDetails": {
									"TaxCode":"ЕКО",
									"Description":"Екологічний податок",
									"TaxPercentage":""
								}
									
		}'::JSONB
	),
	(
		'Рента',
		'TaxTableEntry',
		'{
    		"TaxType": "Рента",
    		"Description": "Рентна плата",
			"TaxCodeDetails": {
									"TaxCode":"Рента",
									"Description":"Рентна плата",
									"TaxPercentage":""
								}
									
		}'::JSONB
	),
	(
		'Мито',
		'TaxTableEntry',
		'{
    		"TaxType": "Мито",
    		"Description": "Митна плата",
			"TaxCodeDetails": {
									"TaxCode":"Мито",
									"Description":"Митна плата",
									"TaxPercentage":""
								}
									
		}'::JSONB
	),
	(
		'ПНМ',
		'TaxTableEntry',
		'{
    		"TaxType": "Податок",
    		"Description": "Податок на майно",
			"TaxCodeDetails": {
									"TaxCode":"ПНМ",
									"Description":"Податок на майно",
									"TaxPercentage":""
								}
									
		}'::JSONB
	);
	
COMMIT;	

CREATE TABLE IF NOT EXISTS UOMTable (
  
  ID character(4) PRIMARY KEY,
  KEY character(120) NOT NULL,
  VALUE JSONB NOT NULL,
  DESCR character(256)

);

INSERT INTO
	UOMTable (ID, KEY, VALUE, DESCR)
VALUES
	(
		'2423',
		'UOMTableEntry',
		'{
    		"UnitOfMeasure": "2423",
    		"Description": "Відсоток"
  		 }'::JSONB,
		'Відсоток'
	),
	(
		'0502',
		'UOMTableEntry',
		'{
    		"UnitOfMeasure": "0502",
    		"Description": "Градус Цельсія"
  		 }'::JSONB,
		'Градус Цельсія'
	),
	(
		'2034',
		'UOMTableEntry',
		'{
    		"UnitOfMeasure": "2034",
    		"Description": "Балон"
  		 }'::JSONB,
		'Балон'
	),
	(
		'2247',
		'UOMTableEntry',
		'{
    		"UnitOfMeasure": "2247",
    		"Description": "Вагон"
  		 }'::JSONB,
		'Вагон'
	),
	(
		'0303',
		'UOMTableEntry',
		'{
    		"UnitOfMeasure": "0303",
    		"Description": "Грам"
  		 }'::JSONB,
		'Грам'
	),
	(
		'0301',
		'UOMTableEntry',
		'{
    		"UnitOfMeasure": "0301",
    		"Description": "Кілограм"
  		 }'::JSONB,
		'Кілограм'
	),
	(
		'0175',
		'UOMTableEntry',
		'{
    		"UnitOfMeasure": "0175",
    		"Description": "Година"
  		 }'::JSONB,
		'Година'
	),
	(
		'2454',
		'UOMTableEntry',
		'{
    		"UnitOfMeasure": "2454",
    		"Description": "Гривня"
  		 }'::JSONB,
		'Гривня'
	),
	(
		'2009',
		'UOMTableEntry',
		'{
    		"UnitOfMeasure": "2009",
    		"Description": "Штука"
  		 }'::JSONB,
		'Штука'
	);

COMMIT;

CREATE TABLE IF NOT EXISTS AnalysisTypeTable (
  
  ID character(9) PRIMARY KEY,
  KEY character(40) NOT NULL,
  VALUE JSONB NOT NULL,
  DESCR character(256)

);

INSERT INTO
	AnalysisTypeTable (ID, KEY, VALUE, DESCR)
VALUES
	(
		'000000007',
		'AnalysisTypeTableEntry',
		'{
    		"AnalysisType": "000000007",
    		"AnalysisTypeDescription": "Банківські рахунки",
			"AnalysisID": "313",
			"AnalysisIDDescription": "Інші рахунки в банку в національній валюті"
  		 }'::JSONB,
		'Банківські рахунки'
	),
	(
		'000000002',
		'AnalysisTypeTableEntry',
		'{
    		"AnalysisType": "000000002",
    		"AnalysisTypeDescription": "Працівники організації",
			"AnalysisID": "66",
			"AnalysisIDDescription": "Розрахунки по виплатам працівникам"
  		 }'::JSONB,
		'Працівники організації'
	),
	(
		'000000003',
		'AnalysisTypeTableEntry',
		'{
    		"AnalysisType": "000000003",
    		"AnalysisTypeDescription": "Основні засоби",
			"AnalysisID": "4231",
			"AnalysisIDDescription": "Дооцінка основних засобів"
  		 }'::JSONB,
		'Основні засоби'
	);
	
	COMMIT;
	
CREATE TABLE IF NOT EXISTS MovementTypeTable (
  
  ID character(9) PRIMARY KEY,
  KEY character(40) NOT NULL,
  VALUE JSONB NOT NULL,
  DESCR character(256)

);

INSERT INTO
	MovementTypeTable (ID, KEY, VALUE, DESCR)
VALUES
	(
		'100',
		'MovementTypeTableEntry',
		'{
    		"MovementType": "100",
    		"Description": "Надходження запасів"
		 }'::JSONB,
		'Надходження запасів'
	),
	(
		'101',
		'MovementTypeTableEntry',
		'{
    		"MovementType": "101",
    		"Description": "Придбано запаси: отримано від постачальників"
		 }'::JSONB,
		'Придбано запаси: отримано від постачальників'
	),
	(
		'102',
		'MovementTypeTableEntry',
		'{
    		"MovementType": "102",
    		"Description": "Оприбутковано товари, повернуті від покупців (способом сторно)"
		 }'::JSONB,
		'Оприбутковано товари, повернуті від покупців (способом сторно)'
	),
	(
		'103',
		'MovementTypeTableEntry',
		'{
    		"MovementType": "103",
    		"Description": "Зараховано до складу первісної вартості запасів транспортно-заготівельні витрати, витрати із страхування, митні збори, мито, суми непрямих податків, інші витрати"
		 }'::JSONB,
		'Зараховано до складу первісної вартості запасів транспортно-заготівельні витрати, витрати із страхування, митні збори, мито, суми непрямих податків, інші витрати'
	),
	(
		'104',
		'MovementTypeTableEntry',
		'{
    		"MovementType": "104",
    		"Description": "Оприбутковано запаси, раніше не враховані на балансі, а також надлишки запасів, виявлених при інвентаризації"
		 }'::JSONB,
		'Оприбутковано запаси, раніше не враховані на балансі, а також надлишки запасів, виявлених при інвентаризації'
	),
	(
		'105',
		'MovementTypeTableEntry',
		'{
    		"MovementType": "105",
    		"Description": "Оприбутковано відходи виробництва"
		 }'::JSONB,
		'Оприбутковано відходи виробництва'
	);
	
	COMMIT;
	
CREATE TABLE IF NOT EXISTS Products (
  
  DESCR character(256),
  KEY character(40) NOT NULL,
  VALUE JSONB NOT NULL,
  ID character(70) PRIMARY KEY
);

INSERT INTO
	Products (DESCR, KEY, VALUE, ID)
VALUES
	(
		'телефон Grandstream GXP2160',
		'Product',
		'{
    		"ProductCode": "e5253fac-1096-11f1-9319-00155dc78e0b",
    		"GoodsServicesID": "1",
			"ProductGroup": "facc5f5c-fd8f-11e2-a924-00151764398c",
			"Description": "телефон Grandstream GXP2160",
			"UOMBase": "2009",
			"UOMStandard": "2009",
			"UOMtoUOMBaseConversionFactor": "1"
		 }'::JSONB,
		'e5253fac-1096-11f1-9319-00155dc78e0b'
	),
	(
		'Піддони 800*1200',
		'Product',
		'{
    		"ProductCode": "0907b1e7-768a-11e6-9412-00155d045201",
    		"GoodsServicesID": "1",
			"ProductGroup": "79bb096b-7171-11e5-9407-00155d044f27",
			"Description": "Піддони 800*1200",
			"UOMBase": "2009",
			"UOMStandard": "2009",
			"UOMtoUOMBaseConversionFactor": "1"
		 }'::JSONB,
		'0907b1e7-768a-11e6-9412-00155d045201'
	);
	
	COMMIT;
	
CREATE TABLE IF NOT EXISTS PhysicalStock(
  
  DESCR character(256),
  KEY character(40) NOT NULL,
  VALUE JSONB NOT NULL,
  ID character(70) PRIMARY KEY
  
);

INSERT INTO
	PhysicalStock (DESCR, KEY, VALUE, ID)
VALUES
	(
		'Паливо',
		'PhysicalStockEntry',
		'{
    		"WarehouseID": "d4f5f696da5911e29811e0cb4e81a453",
    		"LocationID": "Склад ПММ",
			"ProductCode": "7cd237fd-93bf-11e3-a568-00151764398c",
			"AccountID": "203",
			"ProductType": "Паливо",
			"StockAccountCommodityCode": "Код УКТ ЗЕД",
			"UOMPhysicalStock": "2009",
			"UOMtoUOMBaseConversionFactor": "1",
			"OpeningStockQuantity": "50",
			"OpeningUnitPrice": "67.00",
			"OpeningStockValue": "3350.00",
			"ClosingStockQuantity": "40.00",
			"UnitPrice": "67.00",
			"ClosingStockValue": "2680.00"
		 }'::JSONB,
		'7cd237fd-93bf-11e3-a568-00151764398c'
	),
	(
		'Канцтовари',
		'PhysicalStockEntry',
		'{
    		"WarehouseID": "d4f5f696da5911e29811e0cb4e81a454",
    		"LocationID": "Склад №2",
			"ProductCode": "1b839a26-acf9-11e8-a954-00155d045094",
			"AccountID": "204",
			"ProductType": "МШП",
			"StockAccountCommodityCode": "0402993100",
			"UOMPhysicalStock": "2009",
			"UOMtoUOMBaseConversionFactor": "1",
			"OpeningStockQuantity": "2",
			"OpeningUnitPrice": "150.00",
			"OpeningStockValue": "300.00",
			"ClosingStockQuantity": "0.00",
			"UnitPrice": "0.00",
			"ClosingStockValue": "0.00"
		 }'::JSONB,
		'1b839a26-acf9-11e8-a954-00155d045094'
	);
	
	COMMIT;
	
CREATE TABLE IF NOT EXISTS ASSETS (
	ID CHARACTER(35) PRIMARY KEY,
	DESCR CHARACTER(256),
	KEY CHARACTER(120) NOT NULL,
	VALUE JSONB NOT NULL
);

INSERT INTO
	ASSETS (ID, DESCR, KEY, VALUE)
VALUES
	(
		'Пу0003027',
		'Багатофункціональний прист. Develop ineo 227',
		'Asset',
		'{
    		"AssetID": "Пу0003027",
    		"AccountID": "104",
    		"Description": "Багатофункціональний прист. Develop ineo 227",
			"StartUpDate": "19.12.2024",
			"Valuations": {
				"Valuation":{
								"AcquisitionAndProductionCostsBegin":"70833.35",
								"AcquisitionAndProductionCostsEnd":"70833.35",
								"AssetLifeMonth":"60",
								"BookValueBegin":"70833.35",
								"DepreciationForPeriod":"1180.56",
								"AccumulatedDepreciation":"16527.84",
								"BookValueEnd":"87361.19"
							}},
			"ResidualValue": "0"}'::JSONB
	);

COMMIT;

CREATE TABLE IF NOT EXISTS TAXDIFFERENCES (
	ID CHARACTER(18) PRIMARY KEY,
	KEY CHARACTER(40) NOT NULL,
	VALUE JSONB NOT NULL
);

INSERT INTO
	TAXDIFFERENCES (ID, KEY, VALUE)
VALUES
	(
		'1.1.1',
		'TaxDifference',
		'{
    		"TaxDifference": "1.1.1",
    		"TaxDifferencesDescription": "Сума нарахованої амортизації основних засобів або нематеріальних активів відповідно до національних положень (стандартів) бухгалтерського обліку або міжнародних стандартів фінансової звітності (пункт 138.1 статті 138 розділу ІІІ Податкового кодексу України)",
			"OrderOfAccount": "Сума уцінки та втрат від зменшення корисності основних засобів і нематеріальних активів (Дт 975 – Кт 10, 12; Дт 972 – Кт 131, 133); інших необоротних матеріальних активів, вартість яких перевищує 20000 гривень (6000 гривень – для введених в експлуатацію до 22 травня 2020 року), і бібліотечних фондів (Дт 975 – Кт 11; Дт 972 – Кт 132); довгострокових біологічних активів, вартість яких перевищує 20000 гривень (6000 гривень – для введених в експлуатацію до 22 травня 2020 року), що обліковуються за первісною вартістю (Дт 975  Кт – 16; Дт 972 – Кт 134); інвестиційної нерухомості, що обліковується за первісною вартістю (Дт 972 – Кт 135)",
			"TaxDifferenceAmountForPeriod": {
												"PeriodYear":"2026",
												"PartOfPeriodYear":"1 квартал",
												"TaxDifferencesAmount":"89414.30"
											},	
			"TaxDifferenceTransactions": {
											"TransactionID":"4d4b2670-1e1e-11f1-931b-00155dc79322",
											"DocumentID":"4d4b2670-1e1e-11f1-931b-00155dc79322",
											"DocumentDate":"28.02.2026",
											"DocumentDescription":"АмортизаціяОЗ",
											"TransactionDescription":"АмортизаціяОЗ",
											"AccountID":"131",
											"CorrespondingAccountID":"92",
											"Amount":{
														"Amount":"39534.92"
													 },
											"TotalValueOfIncreaseOfFinancialResult": "39534.92",
											"TotalValueOfReductionOfFinancialResult": "39534.92"
										 },
			"TaxDifferenceTransactions": {
											"TransactionID":"4d4b2670-1e1e-11f1-931b-00155dc79322",
											"DocumentID":"4d4b2670-1e1e-11f1-931b-00155dc79322",
											"DocumentDate":"28.02.2026",
											"DocumentDescription":"АмортизаціяОЗ",
											"TransactionDescription":"АмортизаціяОЗ",
											"AccountID":"131",
											"CorrespondingAccountID":"92",
											"Amount":{
														"Amount":"1180.56"
													 },
											"TotalValueOfIncreaseOfFinancialResult": "1180.56",
											"TotalValueOfReductionOfFinancialResult": "1180.56"
										 }							 
		 }'::JSONB
	),
	(
		'1.2.2',
		'TaxDifference',
		'{
    		"TaxDifference": "1.2.2",
    		"TaxDifferencesDescription": "Сума залишкової вартості окремого об&apos;єкта основних засобів або нематеріальних активів, визначеної з урахуванням положень статті 138 розділу III Податкового кодексу України, у разі ліквідації або продажу такого об&apos;єкта (пункт 138.2 статті 138 розділу III Податкового кодексу України)",
			"TaxDifferenceAmountForPeriod": {
												"PeriodYear":"2026",
												"PartOfPeriodYear":"1 квартал",
												"TaxDifferencesAmount":"134585.33"
											},	
			"TaxDifferenceTransactions": {
											"TransactionID":"3ae0a9a9-fb60-11f0-9319-00155dc78e0b",
											"DocumentID":"3ae0a9a9-fb60-11f0-9319-00155dc78e0b",
											"DocumentDate":"17.02.2026",
											"DocumentDescription":"ПодготовкаКПередачеОС",
											"TransactionDescription":"ПодготовкаКПередачеОС",
											"AccountID":"105",
											"CorrespondingAccountID":"131",
											"Amount":{
														"Amount":"134585.33"
													 },
											"TotalValueOfIncreaseOfFinancialResult": "134585.33",
											"TotalValueOfReductionOfFinancialResult": "134585.33"
										 }
		 }'::JSONB
	);

COMMIT;

CREATE TABLE IF NOT EXISTS GeneralLedgerEntries (
	DESCR CHARACTER(256),
	KEY CHARACTER(40) NOT NULL,
	VALUE JSONB NOT NULL,
	ID CHARACTER(36) PRIMARY KEY
);

INSERT INTO
	GENERALLEDGERENTRIES (ID, KEY, VALUE, DESCR)
VALUES
	(
		'8cf1b5a8-08be-11f1-9319-00155dc78e0b',
		'Transaction',
		'{
			"TransactionID": "8cf1b5a8-08be-11f1-9319-00155dc78e0b",
			"Period": "2",
			"PeriodYear": "2026",
			"TransactionDate":"01.02.2026",
			"TransactionType":"ІншВитр",
			"Description":"300",
			"SystemEntryDate":"01.02.2026",
			"GLPostingDate":"01.02.2026",
			"Line":
					{
						"RecordID":"1",
						"AccountID":"6412",
						"CorrespondingAccountID":"6442",
						"SourceDocumentID":"8cf1b5a808be11f1931900155dc78e0b",
						"Description":"ПДВ: податковий кредит: податкова накладна",
						"DebitAmount":{
										"Amount":"397.00"
									  }
					},
			"Line":
					{
						"RecordID":"2",
						"AccountID":"6442",
						"CorrespondingAccountID":"6412",
						"Analysis": {
										"AnalysisType":"000000004",
										"AnalysisID":"6442",
										"AnalysisAmount":{
															"Amount":"397.00"
														 }
									},
						"Analysis": {
										"AnalysisType":"000000011",
										"AnalysisID":"6442",
										"AnalysisAmount":{
															"Amount":"397.00"
														 },
						"SourceDocumentID":"8cf1b5a808be11f1931900155dc78e0b",
						"Description":"ПДВ: податковий кредит: податкова накладна",
						"CreditAmount":{
										"Amount":"397.00"
									  }
									}
					}
		
		}'::JSONB,
		'Запись книги приобретений №ДА000000255 от 01.02.2026'
	),
	(
		'ca1eecd9-0cce-11f1-9319-00155dc78e0b',
		'Transaction',
		'{
			"TransactionID": "ca1eecd9-0cce-11f1-9319-00155dc78e0b",
			"Period": "2",
			"PeriodYear": "2026",
			"TransactionDate":"01.02.2026",
			"TransactionType":"Пр.накл.",
			"Description":"101",
			"SystemEntryDate":"01.02.2026",
			"GLPostingDate":"01.02.2026",
			"Line":
					{
						"RecordID":"1",
						"AccountID":"209",
						"CorrespondingAccountID":"6851",
						"Analysis": {
										"AnalysisType":"000000001",
										"AnalysisID":"209",
										"AnalysisAmount":{
															"Amount":"1564.00"
														 }
									},
						"Analysis": {
										"AnalysisType":"000000013",
										"AnalysisID":"209",
										"AnalysisAmount":{
															"Amount":"1564.00"
														 }
									},
						"SourceDocumentID":"ca1eecd90cce11f1931900155dc78e0b",
						"Description":"Оприбутковано ТМЦ",
						"DebitAmount":{
										"Amount":"1564.00"
									  }
					},
			"Line":
					{
						"RecordID":"1",
						"AccountID":"6851",
						"SupplierID":"39X98X0X",
						"Name":"ТОВ &amp;quot;Постач&amp;quot;",
						"CorrespondingAccountID":"209",
						"Analysis": {
										"AnalysisType":"000000004",
										"AnalysisID":"6851",
										"AnalysisAmount":{
															"Amount":"1564.00"
														 }
									},
						"Analysis": {
										"AnalysisType":"000000011",
										"AnalysisID":"6851",
										"AnalysisAmount":{
															"Amount":"1564.00"
														 }
									},
						"SourceDocumentID":"ca1eecd90cce11f1931900155dc78e0b",
						"Description":"Оприбутковано ТМЦ",
						"CreditAmount":{
										"Amount":"1564.00"
									  }
					},
			"Line":
					{
						"RecordID":"2",
						"AccountID":"209",
						"CorrespondingAccountID":"6851",
						"Analysis": {
										"AnalysisType":"000000001",
										"AnalysisID":"209",
										"AnalysisAmount":{
															"Amount":"160.00"
														 }
									},
						"Analysis": {
										"AnalysisType":"000000013",
										"AnalysisID":"209",
										"AnalysisAmount":{
															"Amount":"160.00"
														 }
									},
						"SourceDocumentID":"ca1eecd90cce11f1931900155dc78e0b",
						"Description":"Оприбутковано ТМЦ",
						"DebitAmount":{
										"Amount":"160.00"
									  }
					},
			"Line":
					{
						"RecordID":"2",
						"AccountID":"6851",
						"SupplierID":"39X98X0X",
						"Name":"ТОВ &amp;quot;Постач&amp;quot;",
						"CorrespondingAccountID":"209",
						"Analysis": {
										"AnalysisType":"000000004",
										"AnalysisID":"6851",
										"AnalysisAmount":{
															"Amount":"160.00"
														 }
									},
						"Analysis": {
										"AnalysisType":"000000011",
										"AnalysisID":"6851",
										"AnalysisAmount":{
															"Amount":"160.00"
														 }
									},
						"SourceDocumentID":"ca1eecd90cce11f1931900155dc78e0b",
						"Description":"Оприбутковано ТМЦ",
						"CreditAmount":{
										"Amount":"160.00"
									  }
					},
			"Line":
					{
						"RecordID":"3",
						"AccountID":"6442",
						"CorrespondingAccountID":"6851",
						"Analysis": {
										"AnalysisType":"000000004",
										"AnalysisID":"6442",
										"AnalysisAmount":{
															"Amount":"344.80"
														 }
									},
						"Analysis": {
										"AnalysisType":"000000011",
										"AnalysisID":"6442",
										"AnalysisAmount":{
															"Amount":"344.80"
														 }
									},
						"SourceDocumentID":"ca1eecd90cce11f1931900155dc78e0b",
						"Description":"ПДВ: податковий кредит: прибуткування",
						"DebitAmount":{
										"Amount":"344.80"
									  }
					},
			"Line":
					{
						"RecordID":"3",
						"AccountID":"6851",
						"SupplierID":"39X98X0X",
						"Name":"ТОВ &amp;quot;Постач&amp;quot;",
						"CorrespondingAccountID":"6442",
						"Analysis": {
										"AnalysisType":"000000004",
										"AnalysisID":"6851",
										"AnalysisAmount":{
															"Amount":"344.80"
														 }
									},
						"Analysis": {
										"AnalysisType":"000000011",
										"AnalysisID":"6851",
										"AnalysisAmount":{
															"Amount":"344.80"
														 }
									},					 
						"SourceDocumentID":"ca1eecd90cce11f1931900155dc78e0b",
						"Description":"ПДВ: податковий кредит: прибуткування",
						"CreditAmount":{
										"Amount":"344.80"
									  }
					},
					
			"Line":
					{
						"RecordID":"4",
						"AccountID":"6851",
						"CorrespondingAccountID":"3771",
						"Analysis": {
										"AnalysisType":"000000004",
										"AnalysisID":"6851",
										"AnalysisAmount":{
															"Amount":"2068.80"
														 }
									},
						"Analysis": {
										"AnalysisType":"000000011",
										"AnalysisID":"6851",
										"AnalysisAmount":{
															"Amount":"2068.80"
														 }
									},
						"SourceDocumentID":"ca1eecd90cce11f1931900155dc78e0b",
						"Description":"Зарахування аванса постачальника",
						"DebitAmount":{
										"Amount":"2068.80"
									  }
					},
			"Line":
					{
						"RecordID":"4",
						"AccountID":"3771",
						"SupplierID":"39X98X0X",
						"Name":"ТОВ &amp;quot;Постач&amp;quot;",
						"CorrespondingAccountID":"6851",
						"Analysis": {
										"AnalysisType":"000000004",
										"AnalysisID":"3771",
										"AnalysisAmount":{
															"Amount":"2068.80"
														 }
									},
						"Analysis": {
										"AnalysisType":"000000011",
										"AnalysisID":"3771",
										"AnalysisAmount":{
															"Amount":"2068.80"
														 }
									},
						"SourceDocumentID":"ca1eecd90cce11f1931900155dc78e0b",
						"Description":"Зарахування аванса постачальника",
						"CreditAmount":{
										"Amount":"2068.80"
									  }
						}	
		}'::JSONB,
		'Поступление товаров и услуг №ДА000000307 от 14.02.2026'
	);
	

COMMIT;	

CREATE TABLE IF NOT EXISTS SalesInvoices (
	DESCR CHARACTER(256),
	KEY CHARACTER(40) NOT NULL,
	VALUE JSONB NOT NULL,
	ID CHARACTER(36) PRIMARY KEY
);

INSERT INTO
	SALESINVOICES (DESCR, KEY, VALUE, ID)
VALUES
	('NumberOfEntries', 'NumberOfEntries', '65', '1'),
	('TotalDebit', 'TotalDebit', '150947126.98', '2'),
	('TotalCredit', 'TotalCredit', '150947126.98', '3'),
	(
		'Реализация товаров и услуг №ДА000000080 от 06.02.2026',
		'Invoice',
		'{
			"InvoiceNo": "ДА000000080:2026",
			"CustomerInfo":
					{
						"CustomerID":"33ХХ8ХХ9",
						"Name":"ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ &amp;quot;Покупець&amp;quot;"
					},
			"AccountID": "361",
			"Period": "2",
			"PeriodYear": "2026",
			"InvoiceDate": "06.02.2026",
			"InvoiceType": "РТУ",
			"TransactionType": "РеалізаціяТМЦ",
			"GLPostingDate": "06.02.2026",
			"SystemID": "ДА000000080:2026",
			"TransactionID": "115f4f05-036c-11f1-9319-00155dc78e0b",
			"Line":
					{
						"LineNumber":"1",
						"AccountID":"26",
						"CorrespondingAccountID":"901",
						"Analysis": {
										"AnalysisType":"000000001",
										"AnalysisID":"26",
										"AnalysisAmount":{
															"Amount":"511657.56"
														 }
									},
						"ProductCode": "fbabe04b-0676-11e4-93fa-00155d044703",
						"ProductDescription": "Дуже ліквідний товар",
						"Quantity": "47.140000",
						"InvoiceUOM": "0306",
						"UnitPrice": "9045.000000",
						"Description": "Реалізація ТМЦ",
						"InvoiceLineAmount":{
												"Amount":"426381.30"
											},
						"DebitCreditIndicator": "C",
						"TaxInformation": {
											"TaxType": "ПДВ",
											"TaxCode": "20",
											"TaxPercentage": "20",
											"TaxBase": "426381.30",
											"TaxAmount": {
															"Amount":"85276.26"
														 }
										  }
					},
			"DocumentTotals": {
								"TaxInformationTotals": {
															"TaxType": "ПДВ",
															"TaxCode": "20",
															"TaxPercentage": "20",
															"TaxBase": "426381.30",
															"TaxAmount": {
																			"Amount":"85276.26"
																		 }
														},
								"NetTotal": "426381.30",
								"GrossTotal": "511657.56"
							  }
		
		}'::JSONB,
		'115f4f05-036c-11f1-9319-00155dc78e0b'
	);

COMMIT;

CREATE TABLE IF NOT EXISTS PurchaseInvoices (
	DESCR CHARACTER(256),
	KEY CHARACTER(40) NOT NULL,
	VALUE JSONB NOT NULL,
	ID CHARACTER(36) PRIMARY KEY
);

INSERT INTO
	PurchaseInvoices (DESCR, KEY, VALUE, ID)
VALUES
	('NumberOfEntries', 'NumberOfEntries', '2412', '1'),
	('TotalDebit', 'TotalDebit', '532654376.72', '2'),
	('TotalCredit', 'TotalCredit', '532654376.72', '3'),
	(
		'Поступление товаров и услуг №ДА000000012 от 06.02.2026',
		'Invoice',
		'{
			"InvoiceNo": "ДА000000012:2026",
			"CustomerInfo":
					{
						"CustomerID":"33ХХ8ХХ9",
						"Name":"ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ &amp;quot;Постачальник&amp;quot;"
					},
			"AccountID": "631",
			"Period": "2",
			"PeriodYear": "2026",
			"InvoiceDate": "06.02.2026",
			"InvoiceType": "Пр.накл.",
			"TransactionType": "101",
			"GLPostingDate": "06.02.2026",
			"SystemID": "ДА000000012:2026",
			"TransactionID": "3255a27a-9f80-11f0-9314-00155d044e16",
			"Line":
					{
						"LineNumber":"1",
						"AccountID":"281",
						"CorrespondingAccountID":"631",
						"Analysis": {
										"AnalysisType":"000000001",
										"AnalysisID":"281",
										"AnalysisAmount":{
															"Amount":"84286.80"
														 }
									},
						"ProductCode": "a8544442-1d63-11e4-93fa-00155d044703",
						"ProductDescription": "Покупний товар",
						"Quantity": "140.478000",
						"InvoiceUOM": "0306",
						"UnitPrice": "500.000000",
						"Description": "Прибуткування",
						"InvoiceLineAmount":{
												"Amount":"84286.80"
											},
						"DebitCreditIndicator": "D",
						"TaxInformation": {
											"TaxType": "ПДВ",
											"TaxCode": "20",
											"TaxPercentage": "20",
											"TaxBase": "70239.00",
											"TaxAmount": {
															"Amount":"14047.80"
														 }
										  }
					},
			"DocumentTotals": {
								"TaxInformationTotals": {
															"TaxType": "ПДВ",
															"TaxCode": "20",
															"TaxPercentage": "20",
															"TaxBase": "70239.00",
															"TaxAmount": {
																			"Amount":"14047.80"
																		 }
														},
								"NetTotal": "70239.00",
								"GrossTotal": "84286.80"
							  }
		
		}'::JSONB,
		'a8544442-1d63-11e4-93fa-00155d044703'
	);

COMMIT;

CREATE TABLE IF NOT EXISTS Payments (
	DESCR CHARACTER(256),
	KEY CHARACTER(40) NOT NULL,
	VALUE JSONB NOT NULL,
	ID CHARACTER(36) PRIMARY KEY
);

INSERT INTO
	Payments (DESCR, KEY, VALUE, ID)
VALUES
	('NumberOfEntries', 'NumberOfEntries', '596', '1'),
	('TotalDebit', 'TotalDebit', '591631774.79', '2'),
	('TotalCredit', 'TotalCredit', '1021602599.90', '3'),
	(
		'Платежное поручение входящее №ДА000000115:2026',
		'Payment',
		'{
			"PaymentRefNo": "ДА000000115:2026",
			"Period": "2",
			"PeriodYear": "2026",
			"TransactionID": "83e67628-033b-11f1-9319-00155dc78e0b",
			"TransactionDate": "02.02.2026",
			"PaymentMethod": "Безг.пл.",
			"Description": "ПДорВх",
			"SystemID": "ППВДА000000115:2026",
			"Line":
					{
						"LineNumber":"1",
						"SourceDocumentID":"100925",
						"AccountID": "312",
						"CorrespondingAccountID":"378",
						"CustomerID": "10ХХ5Х6",
						"Name": "ТОВ Постійний покупець",
						"Description": "покупка товару",
						"DebitCreditIndicator": "D",
						"PaymentLineAmount":{
												"Amount":"23394106.45",
												"CurrencyCode": "USD",
												"CurrencyAmount": "546447.00",
												"ExchangeRate": "42.81"
											 }
					},
			"DocumentTotals": {
								"GrossTotal": "23394106.45"
							  }
		
		}'::JSONB,
		'83e67628-033b-11f1-9319-00155dc78e0b'
	);

COMMIT;

CREATE TABLE IF NOT EXISTS MovementOfGoods (
	DESCR CHARACTER(256),
	KEY CHARACTER(40) NOT NULL,
	VALUE JSONB NOT NULL,
	ID CHARACTER(36) PRIMARY KEY
);

INSERT INTO
	MovementOfGoods (DESCR, KEY, VALUE, ID)
VALUES
	('NumberOfMovementLines', 'NumberOfMovementLines', '526', '1'),
	('TotalQuantityReceived', 'TotalQuantityReceived', '38114.006000', '2'),
	('TotalQuantityIssued', 'TotalQuantityIssued', '38114.006000', '3'),
	(
		'Поступление товаров и услуг №ДА000000076 от 06.02.2026',
		'StockMovement',
		'{
			"MovementReference": "ДА000000076:2026",
			"MovementDate": "01.02.2026",
			"MovementType": "101",
			"SystemID": "ДА000000076:2026",
			"DocumentReference":
					{
						"DocumentType":"Пр.накл.",
						"DocumentNumber":"ДА000000076"
					},
			"Line":
					{
						"LineNumber":"1",
						"AccountID":"281",
						"CorrespondingAccountID":"631",
						"GrossTotal": "560013.66",
						"Analysis": {
										"AnalysisType":"000000001",
										"AnalysisID":"281",
										"AnalysisAmount":{
															"Amount":"560013.66"
														 }
									},
						"TransactionID": "fcb5c8c9-00e9-11f1-9319-00155dc78e0b",
						"ProductCode": "a8544442-1d63-11e4-93fa-00155d044703",
						"Description": "Товар 1",
						"Quantity": "22.300000",
						"UnitOfMeasure": "0306",
						"UOMToUOMPhysicalStockConversionFactor": "1",
						"UnitPrice": "25112.720179",
						"BookValue": "560013.66",
						"MovementSubType": "281"
					}
			
		
		}'::JSONB,
		'a8544442-1d63-11e4-93fa-00155d044703'
	);

COMMIT;

CREATE TABLE IF NOT EXISTS AssetTransactions (
	DESCR CHARACTER(256),
	KEY CHARACTER(40) NOT NULL,
	VALUE JSONB NOT NULL,
	ID CHARACTER(36) PRIMARY KEY
);

INSERT INTO
	AssetTransactions (DESCR, KEY, VALUE, ID)
VALUES
	('NumberOfAssetTransactions', 'NumberOfAssetTransactions', '1386', '1'),
	(
		'Ноутбук ASUS Vivobook 18',
		'AssetTransaction',
		'{
			"AssetTransactionID": "37551909-4e00-11f1-931d-00155dc78e16",
			"AssetID": "3128",
			"AssetName": "Ноутбук ASUS Vivobook 18",
			"AssetTransactionType": "Введення в експлуатацію",
			"AssetTransactionDate": "06.02.2026",
			"TransactionID": "37551909-4e00-11f1-931d-00155dc78e16",
			"DocumentNumber": "ДА000000011",
			"AccountID": "104",
			"AssetTransactionValuations":
				{
					"AssetTransactionValuation":
					{
						"AssetValuationType": "1",
						"AcquisitionAndProductionCostsOnTransaction": "45008.35",
						"BookValueOnTransaction": "45008.35",
						"AssetTransactionAmount": "45008.35"
					}	
					
				},
			"GrossTotal": "45008.35"	
			
		}'::JSONB,
		'3128'
	);

COMMIT;

CREATE TABLE IF NOT EXISTS OtherSourceDocuments (
	DESCR CHARACTER(256),
	KEY CHARACTER(40) NOT NULL,
	VALUE JSONB NOT NULL,
	ID CHARACTER(36) PRIMARY KEY
);

INSERT INTO
	OtherSourceDocuments (DESCR, KEY, VALUE, ID)
VALUES
	('NumberOfEntries', 'NumberOfEntries', '2', '1'),
	('TotalDebit', 'TotalDebit', '76.72', '2'),
	('TotalCredit', 'TotalCredit', '76.72', '3'),
	(
		'Операция №ДА000000002 от 01.02.2026',
		'OtherSourceDocument',
		'{
			"TransactionID": "e6b3b0f0-455a-11f1-931d-00155dc78e16",
			"TransactionType": "Бух.дов.",
			"DocumentNumber": "ДА000000002:2026",
			"DocumentDate": "01.02.2026",
			"DocumentDescription": "Бух.дов.",
			"TransactionDescription": "Списання резерву по безнадійній заборгованості у зв’язку з ліквідацією",
			"Period": "2",
			"PeriodYear": "2026",
			"Line":
					{
						"LineNumber":"1",
						"DebitCreditIndicator": "D",
						"AccountID":"381",
						"Amount":{
									"Amount":"76.72"
								 }
					},
			"Line":
					{
						"LineNumber":"2",
						"DebitCreditIndicator": "C",
						"AccountID":"374",
						"SupplierID":"34Х8Х4Х5",
						"Analysis": {
										"AnalysisType":"000000004",
										"AnalysisID":"374",
										"AnalysisAmount":{
															"Amount":"76.72"
														 }
									},
						"Amount":{
									"Amount":"76.72"
								 }
					},
			"GrossTotal":
							{
								"Amount":"76.72"
							}
		}'::JSONB,
		'e6b3b0f0-455a-11f1-931d-00155dc78e16'
	);

COMMIT;
wizardInGrave = obj
{
	nam = 'Колдун в могиле.',
	dsc = function()
		if wizardBurn then
			return 'Колдун горит! Тело его раздулось, того и гляди лопнет.'
		else
			if wizardOnFire then
				return 'Колдун привязан к столбу на костре.';
			else
				return '{Колдун} лежит в могиле.';
			end;
		end;
	end,
	act = function()
		if gayHelp then
			p '"Берем колдуна и привязываем цепями к столбу в середине костра." - говорите вы парню.';
			p 'Вы привязали колдуна к столбу.';
			nearWizardGrave.obj:del('wizardInGrave');
			wizardOnFire = true;
		else
			p '"Сам я колдуна не подниму" - подумали вы. Надо позвать кого-нибудь из селян на помощь.';
		end;
	end,
};


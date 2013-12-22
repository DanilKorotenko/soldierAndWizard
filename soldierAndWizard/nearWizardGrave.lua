groomBlood = obj
{
	nam = 'Пузырек с кровью жениха',
	use = function(s, w)
		if w ~= deadGroom then
			p 'Тут надо действовать как говорил колдун, а не тыкать предметами куда-попало.'
			return false
		else
			p 'Только вы влили жениху его кровь, тот час же он открыл глаза, сделал глубокий вдох и сел на краю кровати.';
			justMarriedRoom.obj:del('deadGroom');
			justMarriedRoom.obj:add('liveGroom');
			inv():del(groomBlood);
		end
	end
};

brideBlood = obj
{
	nam = 'Пузырек с кровью невесты',
	use = function(s, w)
		if w ~= deadBride then
			p 'Тут надо действовать как говорил колдун, а не тыкать предметами куда-попало.'
			return false
		else
			p 'После того как вы произвели операцию над невестой, она еще некоторое время лежала нешелохнувшись. Вы уже начали было думать что что-то пошло не так. Но как только вы так подумали, невеста подскочила на кровати как ужаленная, улеглась обратно и затихла, лишь поглядывала на вас время от времени.';
			justMarriedRoom.obj:del('deadBride');
			justMarriedRoom.obj:add('liveBride');
			inv():del(brideBlood);
		end
	end
};

wayToWillage = obj {
	nam = 'Дорога в деревню',
	dsc = 'Невдалеке проходит {дорога} в деревню.',
	act = function(s)
		if have('groomBlood') and have('brideBlood') then
			p 'Пора идти к родичам в деревню.'
			return walk(willage);
		else
			return 'Сперва надо обыскать колдуна, авось что то интресное найду.'
		end
	end,
};

deadWizard = obj
{
	nam = 'Мертвый колдун',
	dsc = '{Колдун} упал бездыханен.',
	act = function()
		p 'Из левого кармана колдуна вы достали пузырек с кровью невесты, а из правого с кровью жениха.';
		inv():add(brideBlood);
		inv():add(groomBlood)
	end,

};

nearWizardGrave = room {
	nam = 'Возле могилы колдуна',
	dsc = 'Дрались-дрались, солдат почти из сил выбился; эх, думает, ни за грош пропал! Запели петухи.',
	obj = { 'deadWizard', 'wayToWillage' },
};

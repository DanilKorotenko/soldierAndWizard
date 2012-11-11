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


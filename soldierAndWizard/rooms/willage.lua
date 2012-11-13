willage = room {
	nam = 'Деревня',
	dsc = 'Родная деревня.',
	obj = { 'kinsmen' },
	enter = function(s, f)
		if justMarriedIsLive then
			willage.obj:add('elderPlace');
		end
	end,
};


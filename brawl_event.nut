this.brawl_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.brawl";
		this.m.Title = "פ��֮ʱ...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_06.png[/img]{����ʱ�뿪��ȥ�Ҹ��ط�С�⣬����С������ʱ��ս������������Ȼ�������������Ѹ�ٽ�����⣬ϵ�ÿ������Ѹ�ٸϻ���Ӫ�ء����㷢����Ĳ��Ӳ����������ս�����������Լ������һ�š���Ӷ�������ڷ��������Լ���������Ӫ�����𣬻�����ȭͷ������Ť���ڵ��ϡ��κ�ˤ�����˶����⵽������˼�ϵ�һ�ٿ��ߡ�ֱ��������������Щʩ���ߣ������߲Ż���������������������������Ź�����Ⱥ�С�����ɧ���𽥼��������������ʶ������Ĵ��ڣ��������̿�ʼ���ӣ�����֮ǰ��Ұ��������ȫû������һ������ҡ��ҡͷ��ѯ������Ϊ�κ�Ȼ�������ֻ�����ʼ磬��ȫû�����ܻ����𾿾�������ʲô���������һ�α����Ա�֤û���κ����͵�������Ȼ�������֯��һ��������Ժͣ����һ���ල���������������ٴη������Ⲣ������Ϊ��������ֻ��һ��������������ˣ���ȫ����Ҫ���ǡ�}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Ӧ��ֻ��һ�����Ƶ�����, �ɣ�",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (this.Math.rand(1, 100) <= 33)
					{
						bro.improveMood(0.5, "Had a good brawl");

						if (bro.getMoodState() > this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
					}

					if (this.Math.rand(1, 100) <= 33)
					{
						bro.addLightInjury();
						this.List.push({
							id = 10,
							icon = "ui/icons/days_wounded.png",
							text = bro.getName() + " suffers light wounds"
						});
					}
				}
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.Const.DLC.Unhold)
		{
			return;
		}

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 10)
		{
			return;
		}

		this.m.Score = 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});


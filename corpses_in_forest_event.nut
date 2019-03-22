this.corpses_in_forest_event <- this.inherit("scripts/events/event", {
	m = {
		BeastSlayer = null,
		Killer = null
	},
	function create()
	{
		this.m.ID = "event.corpses_in_forest";
		this.m.Title = "һ·��...";
		this.m.Cooldown = 100.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_132.png[/img]{�������н���������ʱ��ע�⵽��������һ�ѱ��ս���ʬ�壬���ǽ����ر���һ����ֻʣ����һ��Ť���ĺ�ɫ������һ�ſɲ�������������������ա��������������ƿ������ζ�����һ�δɢȥ��Ȼ��������ȫ����û�С� %randombrother% ������Ƭ���������˵�ͷ��%SPEECH_ON%�������﷢����ʲô���µ����顣%SPEECH_OFF%��Ҳ���˵�ͷ��ȷʵ��������}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Ҳ�����ǻ����������ҵ�ʲô���õĶ�����",
					function getResult( _event )
					{
						if (_event.m.BeastSlayer != null && this.Math.rand(1, 100) <= 75)
						{
							return "D";
						}
						else if (_event.m.Killer != null && this.Math.rand(1, 100) <= 75)
						{
							return "E";
						}
						else
						{
							return this.Math.rand(1, 100) <= 50 ? "B" : "C";
						}
					}

				},
				{
					Text = "�˵ز��˾�����",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_132.png[/img]{Ӷ���ǿ��ʬ�塣�󲿷ֵ�ʬ�嶼�����ĸ��ı�������һ�𣬷·���Ǹ����ѵļ�����ʬ��ճ����һ����Ҫ��һЩ�������ܰ����Ƿֿ������������ͼ��ô��ʱ���ս���ʬ��Ҳ����֮��˺�ѣ�һЩ���ս��ĺ�ͯʬ�壬��������һ������ƽ�����ǵ����ű��ʿ�����ֱֱ�����ڰ�ա�����ʬ�嵫�ǲ�û���ҵ�ʲô���õ����ʣ����Ҳֻ�Ƿ�����һЩǮ�� %randombrother% ���ҵ���һ�����ι������ߡ��㲻����ȫȷ���⵽����ʲô����������������֤������߲���ҧ�ˣ�Ҳ��δ���ͻ������˷������ļ�ֵ�ɡ�}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "������·�ɡ�",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local item = this.new("scripts/items/misc/petrified_scream_item");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + _event.getArticle(item.getName()) + item.getName()
				});
				local money = this.Math.rand(10, 100);
				this.World.Assets.addMoney(money);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + money + "[/color] Crowns"
				});
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_132.png[/img]{%randombrother% �����ڱ��ս���ʬ�����Աߣ�ҡ��ҡͷ��%SPEECH_ON%���٣��������Ĳ���Ϊ����߻����κζ�����%SPEECH_OFF%û�����Ӧ������Ȼһֻ��̿����ִ�ʬ��������������ץ�������Ľ����ϡ��ֵ�����վ�����������ʼ�ƶ���һ���¶����ܺ��ߴ����ȵ�ʬɽ�����˳���������������һ��������ѹ���ս���ʬ�壬�����Ŷ����������ֱ�Ҳ��̶ã������촽�Ѿ�����û�ˣ�ͬʱ����Ҳ���ڿգ������۾�����ֻʣ���������ն��Ŀڡ� �������Ʒ·�ʯ�����޵���צ������Ӷ��������Ӵ�ʱ����ֻ�ǳ��԰��ս�������������ߡ�����ʬ�ѿ�ʼ������һЩʬ��Ӷ��Ϲ������������ǵ���֫������һ����Ӳ�����������������Ȼ��ֻ�Ƕ�����գ���һ����������ʬɽ�Ľ�̿�˽�ͷײ�����ϣ����ǿ�����ͷ­��һ���ֻ����˺�ɫ�ķ۳��������������ţ��Ҵ����ǿ����ź�ˮ��������ѡ���˰γ������������ǵĺ��������������ǵ�ʹ�ࡣ %randombrother% ��ֻ�ܳ�����Щ�ɿݵ���ָ�������Լ��ĽŰ��������������˱���Ƭ����������𺳵��ˡ�}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "���Ǽ�����·�ɡ�",
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
					if (!bro.getBackground().isOffendedByViolence() || bro.getLevel() >= 7)
					{
						continue;
					}

					bro.worsenMood(0.75, "Shaken by a gruesome scene");

					if (bro.getMoodState() < this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_132.png[/img]{%beastslayer% �������֡�%SPEECH_ON%���ǲ��Ǳ�ıɱ�ģ����Ǳ��������ġ�%SPEECH_OFF%������ʬ�ѵı�Ե��̧��һֻ�ս����ֱۣ���ֻ�ܴ��ⲿ��̧�������ת��һ���ֱۣ����ҳ��԰�ѹ��һ��������ɫ��ŧ֭��Ѫ�������˳�����һ��һ�ε������˵��ϡ�%beastslayer% �ó���һ��Сƿ�ӣ��ռ������������ռ����Ķ�����%SPEECH_ON%��Щ�������Ǳ�ĳ�ֲ�����Ⱦ�ˣ���Щ�����������ܽ����ٵķ�ʽɱ������Ⱦ�ߣ�������ʱ������ָż�������ǻ����������ܡ�ʹŨ��ë����ë�����ֱ��ϳ�������ָ�����Ա䳤�����ιǿ�ʼ��ʹ���ӱ���ͻ������������ʮ�ֹ��죬Ȼ�󣬲����ṥ�����ǵ����񾭣��������ǳ��׷��%SPEECH_OFF%�����ʵ���Щʬ���Ƿ񶼱���Ⱦ�ˡ�%beastslayer% ҡ��ҡͷ��%SPEECH_ON%���ʬ�����Ǵ����ļ�����жϳ�������Ⱦ�ģ�ʣ����Щ���ҾͲ�̫����ˡ�������Ϯ��һ����ׯ֮ʱ��Ҳ��˭���ܲ��ˣ��ܿ���һ��Ϊ�����Ĵ�Ⱦ��������������ֻ��������ʼ��������һƬ�������Ļ𻨰��ˡ�%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "���ǻ��Ǽ�����·�ɡ�",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.BeastSlayer.getImagePath());
				local item = this.new("scripts/items/accessory/spider_poison_item");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + _event.getArticle(item.getName()) + item.getName()
				});
			}

		});
		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/event_132.png[/img]{%killer% ��������ʬ��ѣ����Ÿ裬�����˵�ͷ���������һ����ĭ���ֵ��˵�ͷ�� ��ָ��ָ���ʬ�塣%SPEECH_ON%�������ַ�̫�б��ˣ�����Ĳ���Ϊ�����ڸ���������֮���ܻ���ȥ��%SPEECH_OFF%��ѯ�����ľ�����˼, �����������һ����ָ��������������֡���������߹���һ��һ������ֱ����ͣ���˽Ų���%SPEECH_ON%������Ĳ�ࡣ%SPEECH_OFF%������ǰȥ��������һ���������ϵ���ɱ���ˡ�����ָ���Ƿ��ڣ����ϻ�����һЩ�ҽ�������������һ���������������н�����һ�ݱʼǣ��ϱ�д��ȫ�ǵ�Ǹ�Ļ�����û���������ľ�������ʲô����Ϊʲô������ʬ��֮�£��ڷ������Ŀ�����������������Ҳ���Ǹ����塣��������Σ��������ϵ���ʬ�壬��������ϴ��һ�ա�}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "�߰ɡ�",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Killer.getImagePath());
				local item = this.new("scripts/items/weapons/morning_star");
				item.setCondition(this.Math.rand(5, 30) * 1.0);
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + _event.getArticle(item.getName()) + item.getName()
				});
				item = this.new("scripts/items/armor/basic_mail_shirt");
				item.setCondition(this.Math.rand(25, 60) * 1.0);
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + _event.getArticle(item.getName()) + item.getName()
				});
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

		local currentTile = this.World.State.getPlayer().getTile();

		if (currentTile.Type != this.Const.World.TerrainType.Forest && currentTile.Type != this.Const.World.TerrainType.LeaveForest && currentTile.Type != this.Const.World.TerrainType.AutumnForest)
		{
			return;
		}

		if (!currentTile.HasRoad)
		{
			return;
		}

		local myTile = this.World.State.getPlayer().getTile();

		foreach( s in this.World.EntityManager.getSettlements() )
		{
			local d = s.getTile().getDistanceTo(myTile);

			if (d <= 6)
			{
				return;
			}
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_beastslayer = [];
		local candidates_killer = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.beast_hunter")
			{
				candidates_beastslayer.push(bro);
			}
			else if (bro.getBackground().getID() == "background.killer_on_the_run")
			{
				candidates_killer.push(bro);
			}
		}

		if (candidates_beastslayer.len() != 0)
		{
			this.m.BeastSlayer = candidates_beastslayer[this.Math.rand(0, candidates_beastslayer.len() - 1)];
		}

		if (candidates_killer.len() != 0)
		{
			this.m.Killer = candidates_killer[this.Math.rand(0, candidates_killer.len() - 1)];
		}

		this.m.Score = 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"beastslayer",
			this.m.BeastSlayer != null ? this.m.BeastSlayer.getNameOnly() : ""
		]);
		_vars.push([
			"killer",
			this.m.Killer != null ? this.m.Killer.getNameOnly() : ""
		]);
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
		this.m.BeastSlayer = null;
		this.m.Killer = null;
	}

});


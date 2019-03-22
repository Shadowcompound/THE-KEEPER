this.collector_wants_trophy_event <- this.inherit("scripts/events/event", {
	m = {
		Peddler = null,
		Reward = 0,
		Item = null,
		Town = null
	},
	function create()
	{
		this.m.ID = "event.collector_wants_trophy";
		this.m.Title = "�� %townname%";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_01.png[/img]{���㻹�ڳ�������ʱ��һ������˿������˳������˹�����������װ������ʮ��Ư��������ÿ����ָ�϶����Ž�������Ľ�ָ�� | ���㻹�ڼ�����������ȥʱ��һ��İ���˳������˹����������β��Ϲ���һЩװ����ֵ�Һ���С���⣬������һ����ֵ�ľͷȡ�������Ĵ󲿷ֵ����ݡ� | ˵ʵ����û����ֵ��˵���飬����ô���ܽ���һ�������ļ���֮���أ���һ������һ�����������ˣ����������һ���޴�Ĳ��޼У��������պܸߣ������˻����ѷ·���Ǹ����̼ܡ�������ò����һ�߲�̸������ʱ�����Ĵ�����Ϊ�Ͽ����������Ǹ���Ǯ֮�ˡ�}%SPEECH_ON%{����Ӷ�����������ƺ�����һЩ����Ȥ�����⡣ �����㽫 %trophy% �����ң������۰ɣ�%reward% ����? | ���ƺ���һ������������Ķ�����������, ��� %trophy%����ϣ���� %reward% ��������������ƽ����û��ô����׬����ô��Ǯ�ɣ� | Ӵ�룬�㿴����Ӧ���Ǹ�ð�ռҡ�������������� %trophy% �Ļ�����Ӧ�û�����һЩ�����İɡ�������������һЩ������������Ը�⿪ %reward% ����������������Ʒ��}%SPEECH_OFF% ��˼����һ��������˵����顣",
			Image = "",
			List = [],
			Options = [
				{
					Text = "�����ɽ���",
					function getResult( _event )
					{
						if (_event.m.Peddler != null)
						{
							return "Peddler";
						}
						else
						{
							this.World.Assets.addMoney(_event.m.Reward);
							local stash = this.World.Assets.getStash().getItems();

							foreach( i, item in stash )
							{
								if (item != null && item.getID() == _event.m.Item.getID())
								{
									stash[i] = null;
									break;
								}
							}

							return 0;
						}
					}

				},
				{
					Text = "�������ɽ���",
					function getResult( _event )
					{
						if (_event.m.Peddler != null)
						{
							return "Peddler";
						}
						else
						{
							return 0;
						}
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "Peddler",
			Text = "[img]gfx/ui/events/event_01.png[/img]{%peddler% ����ǰ���������˻������о�������Ͳ���ʲôվ�ų���������������У����Ҿ���һֻ�֣����Ҳ���Ի�Ӧ���������ֻ�����ڻ����ͣ������ٶ����֮�죬ֻ��һ˲���������־��Ѿ������˳�����Ҳ������һ�����԰ɡ�һ���ӹ���%peddler% �����ˡ�%SPEECH_ON%������������������Ը�⸶ %reward% �����ʡ��ҵ����ˣ��һ���ȥ�������͹��ӣ�ף����ˡ�%SPEECH_OFF%����������ļ������뿪�ˡ�}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "�����ɽ���",
					function getResult( _event )
					{
						this.World.Assets.addMoney(_event.m.Reward);
						local stash = this.World.Assets.getStash().getItems();

						foreach( i, item in stash )
						{
							if (item != null && item.getID() == _event.m.Item.getID())
							{
								stash[i] = null;
								break;
							}
						}

						return 0;
					}

				},
				{
					Text = "�������ɽ���",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Peddler.getImagePath());
				_event.m.Reward = this.Math.floor(_event.m.Reward * 1.33);
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		local towns = this.World.EntityManager.getSettlements();
		local nearTown = false;
		local town;
		local playerTile = this.World.State.getPlayer().getTile();

		foreach( t in towns )
		{
			if (t.getTile().getDistanceTo(playerTile) <= 4 && t.isAlliedWithPlayer())
			{
				nearTown = true;
				town = t;
				break;
			}
		}

		if (!nearTown)
		{
			return;
		}

		local stash = this.World.Assets.getStash().getItems();
		local candidates_items = [];

		foreach( item in stash )
		{
			if (item != null && item.isItemType(this.Const.Items.ItemType.Crafting) && item.getValue() >= 300)
			{
				candidates_items.push(item);
			}
		}

		if (candidates_items.len() == 0)
		{
			return;
		}

		this.m.Item = candidates_items[this.Math.rand(0, candidates_items.len() - 1)];
		this.m.Reward = this.m.Item.getValue();
		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 3)
		{
			return;
		}

		local candidates_peddler = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.peddler")
			{
				candidates_peddler.push(bro);
			}
		}

		if (candidates_peddler.len() != 0)
		{
			this.m.Peddler = candidates_peddler[this.Math.rand(0, candidates_peddler.len() - 1)];
		}

		this.m.Town = town;
		this.m.Score = 15;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"peddler",
			this.m.Peddler != null ? this.m.Peddler.getName() : ""
		]);
		_vars.push([
			"reward",
			this.m.Reward
		]);
		_vars.push([
			"trophy",
			this.m.Item.getName()
		]);
		_vars.push([
			"townname",
			this.m.Town.getName()
		]);
	}

	function onClear()
	{
		this.m.Peddler = null;
		this.m.Reward = 0;
		this.m.Item = null;
		this.m.Town = null;
	}

});


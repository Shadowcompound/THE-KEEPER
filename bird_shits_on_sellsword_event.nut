this.bird_shits_on_sellsword_event <- this.inherit("scripts/events/event", {
	m = {
		Victim = null,
		Superstitious = null,
		Archer = null,
		Historian = null
	},
	function create()
	{
		this.m.ID = "event.bird_shits_on_sellsword";
		this.m.Title = "һ·��...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "%terrainImage%{����һ����Ĵ�����ʱ��%birdbro%ȴ�⵽����������������ྫ׼���������������������ҽ��������Ŀ����ϡ�%SPEECH_ON%����������������������%SPEECH_OFF% ��������Щ����ץ������գ��ֱ��缦��һ����������� %SPEECH_ON%�ݣ��漪����ù! %SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "���ˣ��������������ˣ����ǻ�Ҫ��·�ء�",
					function getResult( _event )
					{
						if (_event.m.Historian == null)
						{
							return "Continue";
						}
						else
						{
							return "Historian";
						}
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Victim.getImagePath());

				if (_event.m.Superstitious != null)
				{
					this.Options.push({
						Text = "���Ѳ�����ʲôԤ�ף�",
						function getResult( _event )
						{
							return "Superstitious";
						}

					});
				}

				if (_event.m.Archer != null)
				{
					this.Options.push({
						Text = "���˸��Ҹ㶨���������ë���ﷸ����",
						function getResult( _event )
						{
							return "Archer";
						}

					});
				}
			}

		});
		this.m.Screens.push({
			ID = "Continue",
			Text = "%terrainImage%{%birdbro% ���˵�ͷ.��� %SPEECH_ON%׷����ȥ�����õ�һ�����ô�����׻ٵ��ˡ�%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "�����аɡ���",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Victim.getImagePath());
				_event.m.Victim.worsenMood(0.5, "Got shit on by a bird");

				if (_event.m.Victim.getMoodState() <= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Victim.getMoodState()],
						text = _event.m.Victim.getName() + this.Const.MoodStateEvent[_event.m.Victim.getMoodState()]
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "Superstitious",
			Text = "%terrainImage%{�е����ŵ� %superstitious% �ÿ����鱦��һ�������������������ࡣ�������죬���˵�ͷ��һ������ĸ��������һ�β���Ľ��͡���˵��%SPEECH_ON%���Ǽ����°���%SPEECH_OFF%������˼��䲻���εı��飬���侲�ؽ��͵�������������Ǽ����������µ�Ԥ�ס�һ���ֵĹ�Ӷ���ƺ�����˵���ˡ��ܱ�һֻ��Ψ��ѡ��ȥ��һ�ݣ��о�ȷʵ��һ��ʮ����������顣����˵�ͷ����ʾ %birdbro% ������������Ӧ�þ����������죬�Ի�ö���ĺ��ˡ�}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "���˵ļһ",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Victim.getImagePath());
				this.Characters.push(_event.m.Superstitious.getImagePath());
				_event.m.Victim.improveMood(1.0, "Got shit on by a bird for good luck");

				if (_event.m.Victim.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Victim.getMoodState()],
						text = _event.m.Victim.getName() + this.Const.MoodStateEvent[_event.m.Victim.getMoodState()]
					});
				}

				_event.m.Superstitious.improveMood(0.5, "Witnessed " + _event.m.Victim.getName() + " being shat on by a bird");

				if (_event.m.Superstitious.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Superstitious.getMoodState()],
						text = _event.m.Superstitious.getName() + this.Const.MoodStateEvent[_event.m.Superstitious.getMoodState()]
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "Archer",
			Text = "[img]gfx/ui/events/event_10.png[/img]{%archer% ̧����ͷ��˫��Ϊ�۾��ڱ������⣬��ϸ�۲��š����������ϵ��񲢵��˵�ͷ�����������ָ�⣬�����ڰ���У�������ֵ��˵�ͷ��������Ц�ŴӼ������ó��������ҡ�%SPEECH_ON% �ﷸ�����ܵ��ͷ� %SPEECH_OFF%��Ӷ���ǵ�����Ц�����ĵ����ۣ��������������侲�����Һܿ������һ������ֻ�ǿ��ż�ʸ���ٵ���ʧ���˿��в�������Ӱ�����㿴�������Ȼʧ�⣬����׹���ء�������Ц�ŵ��˵�ͷ����������Լ���ս�ѣ�%SPEECH_ON%������Ц��%SPEECH_OFF%����ֻӭ���˸���س�Ц���������������ַ������ƻ��Ľ����������Ŷ��е���Ҫ�ԣ�����Ϊ��Щǰ����ܺͺ������֮���ṩ��һ���Ѻõı��ۡ��������Щ�ˣ���������Ҫ���۳�һ�����������Ҫ��ս���ϱ��ֲ��ܽ����𰸡�}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "�ɵ�Ư����",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Victim.getImagePath());
				this.Characters.push(_event.m.Archer.getImagePath());
				_event.m.Victim.improveMood(0.5, "Got revenge on a bird that shat on him");

				if (_event.m.Victim.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Victim.getMoodState()],
						text = _event.m.Victim.getName() + this.Const.MoodStateEvent[_event.m.Victim.getMoodState()]
					});
				}

				_event.m.Archer.improveMood(1.0, "Exacted revenge on a bird that shat on " + _event.m.Victim.getName() + " with pinpoint accuracy");

				if (_event.m.Archer.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Archer.getMoodState()],
						text = _event.m.Archer.getName() + this.Const.MoodStateEvent[_event.m.Archer.getMoodState()]
					});
				}

				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getID() == _event.m.Archer.getID() || bro.getID() == _event.m.Victim.getID())
					{
						continue;
					}

					if (this.Math.rand(1, 100) <= 25)
					{
						bro.improveMood(1.0, "Witnessed " + _event.m.Archer.getName() + "\'s fine display of archery");

						if (bro.getMoodState() >= this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
					}
				}
			}

		});
		this.m.Screens.push({
			ID = "Historian",
			Text = "%terrainImage%{����� %birdbro% ������ֻ�������һ�������Ҫ�󲿶Ӽ�����·����ǫ��� %historian% ��ǰ��ʾ��λ��Ӷ��û��Ҫ���ھ��������Щ��й���λ��ѧ�����ǿ��˿���࣬�������������ֻ��%SPEECH_ON%û��û��...���ϵ���ֻ�񣡾����Ǹ���������%SPEECH_OFF%���̧ͷ������������·������������Ĵ�Ա���ִ�½��һ����%historian% ָ��ָ %birdbro%��%SPEECH_ON%�㱻һֻ������ȸ�������ˣ��ұ����˵����ģ����Ѿ��ܾúܾ�û������ЩС�һ��ˣ�����˵�ľ�����ô�࣬�㡭������Լ��������ˡ�%SPEECH_OFF% ��Ҳ��Ц�������� %birdbro% ץ������λ������ѧ�ߣ����������Ӳ�������࣬��Ӷ������������������}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "�����������ˡ�",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Victim.getImagePath());
				this.Characters.push(_event.m.Historian.getImagePath());
				_event.m.Victim.worsenMood(0.5, "Got shit on by a bird");

				if (_event.m.Victim.getMoodState() <= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Victim.getMoodState()],
						text = _event.m.Victim.getName() + this.Const.MoodStateEvent[_event.m.Victim.getMoodState()]
					});
				}

				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getID() == _event.m.Victim.getID() || bro.getID() == _event.m.Historian.getID())
					{
						continue;
					}

					if (this.Math.rand(1, 100) <= 25)
					{
						bro.improveMood(1.0, "Felt entertained by " + _event.m.Historian.getName());

						if (bro.getMoodState() >= this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
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

		local currentTile = this.World.State.getPlayer().getTile();

		if (currentTile.Type == this.Const.World.TerrainType.Snow)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_victim = [];
		local candidates_archer = [];
		local candidates_super = [];
		local candidates_historian = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.historian")
			{
				candidates_historian.push(bro);
			}
			else if (bro.getSkills().hasSkill("trait.superstitious"))
			{
				candidates_super.push(bro);
			}
			else if (bro.getBackground().getID() == "background.hunter" || bro.getCurrentProperties().RangedSkill > 70)
			{
				candidates_archer.push(bro);
			}
			else if (!bro.getSkills().hasSkill("trait.lucky"))
			{
				candidates_victim.push(bro);
			}
		}

		if (candidates_victim.len() == 0)
		{
			return;
		}

		this.m.Victim = candidates_victim[this.Math.rand(0, candidates_victim.len() - 1)];

		if (candidates_historian.len() != 0)
		{
			this.m.Historian = candidates_historian[this.Math.rand(0, candidates_historian.len() - 1)];
		}

		if (candidates_archer.len() != 0)
		{
			this.m.Archer = candidates_archer[this.Math.rand(0, candidates_archer.len() - 1)];
		}

		if (candidates_super.len() != 0)
		{
			this.m.Superstitious = candidates_super[this.Math.rand(0, candidates_super.len() - 1)];
		}

		this.m.Score = 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"birdbro",
			this.m.Victim.getNameOnly()
		]);
		_vars.push([
			"superstitious",
			this.m.Superstitious != null ? this.m.Superstitious.getName() : ""
		]);
		_vars.push([
			"archer",
			this.m.Archer != null ? this.m.Archer.getName() : ""
		]);
		_vars.push([
			"historian",
			this.m.Historian != null ? this.m.Historian.getName() : ""
		]);
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
		this.m.Victim = null;
		this.m.Superstitious = null;
		this.m.Archer = null;
		this.m.Historian = null;
	}

});


package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();

		// 背景画像
		var background = new FlxSprite();
		background.loadGraphic("assets/images/background.png", false);
		add(background);

		// 単純なスプライトのロード例
		// widthとheightをちゃんと指定しないと、
		// 高さと幅で短い方で切れてしまうようだ。
		var sprite1 = new FlxSprite();
		sprite1.loadGraphic("assets/images/image.png", true, 176, 133);
		sprite1.x = 10;
		sprite1.y = FlxG.height - sprite1.height - 10;
		add(sprite1);

		// 座標を調べるためのバックグラウンド。
		// alphaプロパティを0.0～1.0の間で調整すれば透明度を操作できる。
		var sprite2Background = new FlxSprite();
		sprite2Background.makeGraphic(100, 100, FlxColor.BLACK);
		sprite2Background.alpha = 0.5;
		add(sprite2Background);

		// スケーリングの例
		// x, y 位置が左上起点になら無いように見える。要確認
		var sprite2 = new FlxSprite();
		sprite2.loadGraphic("assets/images/image.png", true, 25, 33);
		sprite2.scale.set(2.0, 2.0);
		sprite2.x = 100;
		sprite2.y = 100;
		add(sprite2);

		// アニメーションの例
		// loadGraphicで指定指定したサイズで分割し、
		// それに対してアニメーションをインデックス指定する。
		// これはWalkというモーション名で登録している。
		var sprite3 = new FlxSprite();
		sprite3.loadGraphic("assets/images/image.png", true, 25, 33);
		sprite3.x = 160;
		sprite3.y = 100;
		var animationFrameRate = 3; // 5fps.
		var isLoop = true;
		sprite3.animation.add("walk", [0, 1, 0, 2], animationFrameRate, isLoop);
		sprite3.animation.play("walk");
		add(sprite3);
		
		var sprite4 = new FlxSprite();
		sprite4.loadGraphic("assets/images/image.png", true, 25, 33);
		sprite4.x = 200;
		sprite4.y = 100;
		// loadGraphic()で指定したサイズで分割されたとき、
		// インデックスの並びは左上が0番で右に向かって0,1,2,...と歩進する。
		// 右端にたどり着いたら、次の行に移動して歩進する。
		// これはその例。
		sprite4.animation.add("walk", [7, 8, 7, 9], animationFrameRate, isLoop);
		sprite4.animation.play("walk");
		add(sprite4);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}

package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private static inline var INSET = 10;

	private static inline var MY_DEFAULT_FONT:String = "assets/font/mplus-1c-regular.ttf";

	override public function create():Void
	{
		super.create();
		var x:Int = INSET;
		var y:Int = INSET;
		var fieldWidth = FlxG.width - (INSET * 2);

		/**
		 * 基本的なFlxTextの使い方サンプル。
		 */
		var label1 = new FlxText(x, y, fieldWidth, "テキスト描画のサンプル。");
		label1.text = "テキスト描画のサンプル。";
		label1.font = MY_DEFAULT_FONT;
		label1.size = 24;
		add(label1);
		y += 40;

		/**
		 * systemFontプロパティはフォントが見つからなかった場合などに適用されるフォント。
		 */
		var label2 = new FlxText(x, y, fieldWidth);
		label2.text = "システムフォントを設定する場合にはsystemFontプロパティを設定する。。";
		label2.systemFont = MY_DEFAULT_FONT;
		label2.size = 12;
		add(label2);
		y += 20;

		/**
		 * FlxTextには色々な属性があるが、まとめて設定するにはsetFormat()を使うのが良い。
		 * setFormat()で設定できるパラメータは
		 * ・フォント(fontプロパティ)
		 * ・文字サイズ(sizeプロパティ)
		 * ・色(colorプロパティ)
		 * ・アライメント（alignmentプロパティ） 左寄せ(FlxTextAlign.LEFT)や中央寄せ(FlxTextAlign.CENTER)
		 * ・ボーダースタイル(borderStyleプロパティ)
		 * ・ボーダー色(borderColorプロパティ)
		 * ・組み込みフォントを使用するかどうか(embeddedプロパティ)
		 */
		var label3 = new FlxText(x, y, fieldWidth);
		label3.text = "setFormat()ではプロパティを一括で設定できる。";
		label3.setFormat(MY_DEFAULT_FONT, 18, FlxColor.GREEN);
		add(label3);
		y += 30;

		/**
		 * 改行コード(\n)を使うと複数行表示できる。
		 */
		var label4 = new FlxText(x, y, fieldWidth);
		label4.text = "改行コード(\\n)は\n有効。";
		label4.setFormat(MY_DEFAULT_FONT, 18, FlxColor.CYAN);
		add(label4);
		y += 50;

		var textFormat:FlxTextFormat = new FlxTextFormat(FlxColor.RED, true, true, FlxColor.WHITE);

		/**
		 * addFormat()で特定の部分にフォーマットを適用できる。
		 * 文字位置指定が必要になるので、mapplyMarkup()を使う方が良い。
		 */
		var label5 = new FlxText(x, y, fieldWidth);
		label5.text = "addFormat()を使えば一部だけ文字色を変えたりできる。";
		label5.systemFont = MY_DEFAULT_FONT;
		label5.size = 18;
		label5.addFormat(textFormat, 15, 17);
		add(label5);
		y += 30;

		/**
		 * applyMarkup()でまとめて設定できる。
		 */
		var label6 = new FlxText(x, y, fieldWidth);
		label6.font = MY_DEFAULT_FONT;
		label6.size = 18;
		label6.applyMarkup(
			"<red>applyMarkup()<red>を使う方が、文字列の変更に強くて、より汎用性が高い。",
			[ new FlxTextFormatMarkerPair(textFormat, "<red>")]);
		add(label6);
		y += 25;

		/**
		 * FlxSpriteに適用可能なものは全部設定できる。
		 */
		var label7 = new FlxText(x, y, fieldWidth);
		label7.text = "FlxTextはFlxSpriteの派生なので、\nangleを設定したりできるのだ。";
		label7.font = MY_DEFAULT_FONT;
		label7.size = 18;
		label7.angle = -15; // Degree
		label7.color = FlxColor.fromRGB(128, 128, 128, 128);
		add(label7);
		y += 130;

		/**
		 * FlxTextを重ね合わせてみる例
		 */
		var label8 = new FlxText(x, y, fieldWidth);
		label8.text = "これは文字列1";
		label8.setFormat(MY_DEFAULT_FONT, 18, FlxColor.fromRGB(128, 0, 255, 128));
		add(label8);
		y += 10;
		var label9 = new FlxText(x, y, fieldWidth);
		label9.text = "FlxTextが重なった時のサンプル";
		label9.setFormat(MY_DEFAULT_FONT, 18, FlxColor.fromRGB(0, 255, 0, 128));
		add(label9);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}

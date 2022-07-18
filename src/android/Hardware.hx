package android;

import lime.system.JNI;

/**
 * @author Saw (M.A. Jigsaw)
 */
class Hardware
{
	public static final ORIENTATION_UNSPECIFIED:Int = 0;
	public static final ORIENTATION_PORTRAIT:Int = 1;
	public static final ORIENTATION_LANDSCAPE:Int = 2;

	/**
	 * Makes the Phone vibrate, the time is in miliseconds btw.
	 */
	public static function vibrate(inputValue:Int):Void
	{
		var vibrate_jni:Dynamic = getStaticMethod("vibrate", "(I)V");
		vibrate_jni(inputValue);
	}

	/**
	 * The Name of the function says what it does.
	 */
	public static function wakeUp():Void
	{
		var wakeUp_jni:Dynamic = getStaticMethod("wakeUp", "()V");
		wakeUp_jni();
	}

	/**
	 * Sets the phone brightness, max is 1 and min is 0.
	 */
	public static function setBrightness(brightness:Float):Void
	{
		var setbrightness_set_brightness_jni:Dynamic = getStaticMethod("setBrightness", "(F)V");
		setbrightness_set_brightness_jni(brightness);
	}

	/**
	 * The Name of the function says what it does.
	 */
	public static function setScreenOrientation(screenOrientation:Int):Void
	{
		var setRequestedOrientationNative:Dynamic = getStaticMethod("setRequestedOrientation", "(I)V");
		setRequestedOrientationNative(screenOrientation);
	}

	/**
	 * Returns the full screen width.
	 */
	public static function getScreenWidth():Int
	{
		var get_screen_width_jni:Dynamic = getStaticMethod("getScreenWidth", "()I");
		return get_screen_width_jni();
	}

	/**
	 * Returns the full screen height.
	 */
	public static function getScreenHeight():Int
	{
		var get_screen_height_jni:Dynamic = getStaticMethod("getScreenHeight", "()I");
		return get_screen_height_jni();
	}

	private function getStaticMethod(memberName:String, signature:String):Dynamic
	{
		try
		{
			return JNI.createStaticMethod("android/haxe/extensions/Hardware", memberName, signature);
		}
		catch(e:Dynamic)
		{
			Application.current.window.alert("JNI Return Error: " + e, "Hardware from extension-androitools");
		}

		return null;
	}
}

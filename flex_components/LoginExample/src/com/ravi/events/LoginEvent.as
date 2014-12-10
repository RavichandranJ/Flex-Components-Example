package com.ravi.events {
	import flash.events.Event;

	public class LoginEvent extends Event {

		public static const LOG_IN:String="login";
		public static const LOG_OUT:String="logout";
		public static const ERROR:String="error";

		public var data:Object;

		public function LoginEvent(type:String, data:Object=null) {
			super(type, bubbles, cancelable);
			this.data=data;
		}

		override public function clone():Event {
			return new LoginEvent(type, this.data);
		}
	}
}

package com.ravi.model {

	[Bindable]
	public class LoginModelLocator {

		private static var instance:LoginModelLocator;
		private static var constructing:Boolean;

		public function LoginModelLocator() {
			if(!constructing) throw new Error("Error: This is Signgleton. Use getInstance() to create instance");
		}

		public static function getInstance():LoginModelLocator {
			if(instance==null) {
				constructing = true;
				instance = new LoginModelLocator();
				constructing = false;
			}
			return instance;			
		}
		
		/* Add common properites here*/
		public var currentState:String = "login";

	}
}

package com.ravi.component {
	
	import com.ravi.events.LoginEvent;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	
	import spark.components.Button;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;


	/* A component must identify the view states that its skin supports.
	Use the [SkinState] metadata tag to define the view states in the component class.
	[SkinState("normal")] */
	[SkinState("login")]
	[SkinState("logout")]
	
	/*Events*/
	[Event(name="login", type="com.ravi.events.LoginEvent")]
	[Event(name="logout", type="com.ravi.events.LoginEvent")]
	[Event(name="error", type="com.ravi.events.LoginEvent")]

	public class LoginComponent extends SkinnableComponent {
		/* To declare a skin part on a component, you use the [SkinPart] metadata.
		[SkinPart(required="true")] */
		[SkinPart(required="true")]
		public var username:TextInput;

		[SkinPart(required="true")]
		public var password:TextInput;

		[SkinPart(required="true")]
		public var loginBtn:Button;
		
		
		private var loginState:Boolean = true;

		public function LoginComponent() {
			//TODO: implement function
			super();
			setStyle("skinClass", LoginComponentSkin);
		}

		/* Implement the getCurrentSkinState() method to set the view state of the skin class. */
		override protected function getCurrentSkinState():String {
			var currentState:String = loginState ? 'login' : 'logout';
			return currentState;
		}

		/* Implement the partAdded() method to attach event handlers to a skin part,
		configure a skin part, or perform other actions when a skin part is added. */
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			if (instance == loginBtn) {
				loginBtn.addEventListener(MouseEvent.CLICK, loginClickHandler);
			}
		}

		/* Implement the partRemoved() method to remove the even handlers added in partAdded() */
		override protected function partRemoved(partName:String, instance:Object):void {
			super.partRemoved(partName, instance);
			if (instance == loginBtn) {
				loginBtn.removeEventListener(MouseEvent.CLICK, loginClickHandler);
			}
		}

		private function loginClickHandler(event:MouseEvent):void {
			if(loginState) {
				if(username.text.length<3 || password.text.length<3) {
					Alert.show("Username and password should have minimum 3 charecter!", "Login Failed");
					dispatchEvent(new LoginEvent(LoginEvent.ERROR));
					return;
				}
				loginState = false;
				dispatchEvent(new LoginEvent(LoginEvent.LOG_IN));
			}else {
				username.text = "";
				password.text = "";
				loginState = true;
				dispatchEvent(new LoginEvent(LoginEvent.LOG_OUT));
			}
			invalidateSkinState();
		}

	}
}
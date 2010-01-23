/*
Copyright (c) 2010 Heiko Dreyer, boxedfolder.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/


package com.boxedfolder.rtm
{
	import com.adobe.crypto.MD5;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.system.Security;

	/**
	 * <b>AbstractMilky</b>
	 * 
	 * <p>
	 * Abstract class which handles internal service calls.
	 * Concrete service methods should be declared in the concrete Milky class.
	 * </p> 
	 * 
	 * @author Heiko Dreyer
	 * 
	 */	
	public class AbstractMilky extends EventDispatcher
	{
		//-------------------------------------------------------------------------
		//
		// Constants
		//
		//-------------------------------------------------------------------------
		/**
		 * Base url 
		 * <i>http://api.rememberthemilk.com/services/rest/</i>
		 * 
		 */		
		protected static const BASE_URL:String = "http://api.rememberthemilk.com/services/rest/";
		
		//-------------------------------------------------------------------------
		//
		// Variables
		//
		//-------------------------------------------------------------------------
		/**
		 * @private 
		 */		
		protected var _apiKey:String;
		
		/**
		 * @private 
		 */		
		protected var _sharedSecret:String;
		
		/**
		 * @private 
		 */		
		protected var _service:URLLoader;
		
		/**
		 * @private 
		 */		
		protected var _request:URLRequest;
		
		/**
		 * @private 
		 */		
		protected var _isBusy:Boolean;
		
		/**
		 * @private 
		 */		
		protected var _lastResult:Object;
		
		/**
		 * @private 
		 */		
		protected var _lastApiMethod:String;
		
		/**
		 * @private 
		 */		
		protected var _dataFormat:String = MilkyConstants.ARRAY_FORMAT;
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		public function AbstractMilky(apiKey:String = "", sharedSecret:String = "")
		{				
			// Crossdomain policy
			Security.loadPolicyFile("http://api.rememberthemilk.com/crossdomain.xml");
			
			// Set API-Key
			_apiKey = apiKey
			_sharedSecret = sharedSecret;	
			
			// Setup Service	
			_service = new URLLoader();
			_request = new URLRequest();
			_isBusy = false;
			
			// Register EventHandlers
			_service.addEventListener(HTTPStatusEvent.HTTP_STATUS, handleHttpStatus);
			_service.addEventListener(IOErrorEvent.IO_ERROR, handleIOErrors);
			_service.addEventListener(Event.OPEN, handleOpen);
			_service.addEventListener(Event.COMPLETE, handleComplete);
			_service.addEventListener(ProgressEvent.PROGRESS, handleProgress);
			_service.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSecurityError);
		}
		
		//--------------------------------------------------------------------------
		//
		// Methods
		// 
		//--------------------------------------------------------------------------
		/**
		 * Sends requests to the rtm api.
		 * 
		 * @param apiMethod
		 * @param httpMethod
		 * @param arguments
		 * @private
		 */			
		protected function send(apiMethod:String = MilkyConstants.TEST_ECHO, arguments:URLVariables = null):void
		{
			// Store Method locally
			_lastApiMethod = apiMethod;
			
			// Setup Arguments
			if(arguments == null)
				arguments = new URLVariables();
			
			arguments.method = apiMethod;		
			arguments.api_key = apiKey;
			
			// The Loader always fetches new copies and avoids caching
			arguments.nocache = new Date().getTime();
			
			if(apiMethod != MilkyConstants.TEST_ECHO)
				arguments.api_sig = signRequest(arguments);
			
			// Setup Service
			_request.data = arguments;
			_request.method = URLRequestMethod.POST;
			_request.url = BASE_URL;
			
			// Send Request
			if(!_isBusy)
			{
				_service.load(_request);
				_isBusy = true;	
			}
		}
		
		/**
		 * <p>
		 * Sign the request.
		 * </p>
		 * <p> 
		 * Every api call (exept the test methods) must be signed in order to get some positive results.
		 * A signature is an md5 hash of the <i>api_key</i> + all parameters in an alphabetically sorted order without equal or other additional signs:
		 * </p>
		 * <p>
		 * Like <i>api_keyaparametervalueabparametervalueb</i>.
		 * </p>
		 *  
		 * @param args
		 * @return 
		 * 
		 */		
		protected function signRequest(args:URLVariables):String
		{
			var array:Array = [];
			var string:String;
			
			for(var arg:Object in args)		
				array.push(String(arg + args[arg]))							
			
			array.sort();	
			
			string = sharedSecret;
			
			for each(var item:String in array)
				string += item
			
			return MD5.hash(string);
		}
	
		//--------------------------------------------------------------------------
		//
		// Event-Handlers
		// 
		//--------------------------------------------------------------------------
		/**
		 * Abstract Event-Handler for
		 * <i>HTTPStatusEvent.HTTP_STATUS</i>.
		 *  
		 * @param e
		 * 
		 */		
		protected function handleHttpStatus(e:HTTPStatusEvent = null):void
		{
		}
		
		/**
		 * Event-Handler for
		 * <i>IOErrorEvent.IO_ERROR</i>.
		 *  
		 * @param e
		 * 
		 */		
		protected function handleIOErrors(e:IOErrorEvent = null):void
		{
			_isBusy = false;
		}
		
		/**
		 * Abstract Event-Handler for
		 * <i>Event.OPEN</i>.
		 *  
		 * @param e
		 * 
		 */		
		protected function handleOpen(e:Event = null):void
		{
		}
		
		/**
		 * Event-Handler for
		 * <i>Event.COMPLETE</i>.
		 *  
		 * @param e
		 * 
		 */		
		protected function handleComplete(e:Event = null):void
		{
			_isBusy = false;
		}
		
		/**
		 * Abstract Event-Handler for
		 * <i>ProgressEvent.PROGRESS</i>.
		 *  
		 * @param e
		 * 
		 */		
		protected function handleProgress(e:ProgressEvent = null):void
		{
		}
		
		/**
		 * Event-Handler for
		 * <i>SecurityErrorEvent.SECURITY_ERROR</i>.
		 *  
		 * @param e
		 * 
		 */		
		protected function handleSecurityError(e:SecurityErrorEvent = null):void
		{
			_isBusy = false;
		}		
		
		//--------------------------------------------------------------------------
		//
		// Getters / Setters
		// 
		//--------------------------------------------------------------------------	
		/**
		 * Your api key
		 *  
		 * @return 
		 * 
		 */		
		public function get apiKey():String
		{
			return _apiKey;
		}
		
		public function set apiKey(value:String):void
		{
			_apiKey = value;
		}
		
		/**
		 * Retrieves busy status of <code>URLLoader</code>.
		 *  
		 * @return 
		 * 
		 */		
		public function get isBusy():Boolean
		{
			return _isBusy;
		}
		
		/**
		 * Contains the last query result.
		 *  
		 * @return 
		 * 
		 */		
		public function get lastResult():Object
		{
			return _lastResult;
		}
		
		/**
		 * Possible data formats are "array" or "xml"
		 * 
		 * <p>
		 * "array" responds with an array of VO´s
		 * "xml" responds with raw xml
		 * </p>
		 * 
		 * Some methods however respond with booleans, strings or xml.
		 * 
		 * @return 
		 */	
		public function get dataFormat():String
		{
			return _dataFormat;
		}

		public function set dataFormat(value:String):void
		{
			_dataFormat = value;
		}
		
		/**
		 * The shared key you get when signing up for an api key. 
		 * 
		 * @return 
		 * 
		 */		
		public function get sharedSecret():String
		{
			return _sharedSecret;
		}

		public function set sharedSecret(value:String):void
		{
			_sharedSecret = value;
		}
		
		
		/**
		 * Returns the last called api method.
		 * 
		 * @return 
		 * 
		 */		
		public function get lastApiMethod():String
		{
			return _lastApiMethod;
		}
	}
}
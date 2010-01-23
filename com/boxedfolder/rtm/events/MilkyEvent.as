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

package com.boxedfolder.rtm.events
{
	import flash.events.Event;
	
	/**
	 * Event class for MilkyEvents.
	 * <p>
	 * Data property can handle objects of any type.
	 * </p>
	 * 
	 * @author Heiko Dreyer
	 * 
	 */	
	public class MilkyEvent extends Event
	{	
		//-------------------------------------------------------------------------
		//
		// Constants
		//
		//-------------------------------------------------------------------------
		/**
		 * Event gets dispatched if the API-Fails
		 * See errorcode for details.
		 *  
		 */		
		public static const API_FAIL:String = "api_fail";
		
		/**
		 * Event gets dispatched if method was called successfully
		 * 
		 */			
		public static const API_RESULT:String = "api_result";
		
		//-------------------------------------------------------------------------
		//
		// Variables
		//
		//-------------------------------------------------------------------------
		/**
		 * @private 
		 */		
		private var _data:Object;
		
		/**
		 * @private 
		 */		
		private var _apiMethod:String;
		
		/**
		 * @private 
		 */		
		private var _transactionId:Number;
		
		/**
		 * @private 
		 */		
		private var _undoable:Boolean;
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		public function MilkyEvent(type:String, apiMethod:String, data:Object, transactionId:Number = 0, undoable:Boolean = false)
		{
			super(type);
			
			_transactionId = transactionId;
			_undoable = undoable;
			_apiMethod = apiMethod;
			_data = data;
		}
		
		//--------------------------------------------------------------------------
		//
		// Getters / Setters
		// 
		//--------------------------------------------------------------------------	
		/**
		 * Data object 
		 *  
		 * @return 
		 * 
		 */		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
		}
		
		/**
		 * Api method 
		 *  
		 * @return 
		 * 
		 */		
		public function get apiMethod():String
		{
			return _apiMethod;
		}

		public function set apiMethod(value:String):void
		{
			_apiMethod = value;
		}		
		
		/**
		 * Transaction undoable or not
		 *  
		 * @param value
		 * 
		 */		
		public function get undoable():Boolean
		{
			return _undoable;
		}
		
		public function set undoable(value:Boolean):void
		{
			_undoable = value;
		}
			
		/**
		 * Id of transaction which invoked this event.
		 * (if available) 
		 * 
		 * @param value
		 * 
		 */	
		public function get transactionId():Number
		{
			return _transactionId;
		}	
		public function set transactionId(value:Number):void
		{
			_transactionId = value;
		}


	}
}
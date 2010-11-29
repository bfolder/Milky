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
	import com.boxedfolder.rtm.delegates.AbstractMilkyDelegate;
	import com.boxedfolder.rtm.delegates.MilkyAuthDelegate;
	import com.boxedfolder.rtm.delegates.MilkyContactsDelegate;
	import com.boxedfolder.rtm.delegates.MilkyGroupsDelegate;
	import com.boxedfolder.rtm.delegates.MilkyListsDelegate;
	import com.boxedfolder.rtm.delegates.MilkyLocationsDelegate;
	import com.boxedfolder.rtm.delegates.MilkyReflectionDelegate;
	import com.boxedfolder.rtm.delegates.MilkySettingsDelegate;
	import com.boxedfolder.rtm.delegates.MilkyTasksDelegate;
	import com.boxedfolder.rtm.delegates.MilkyTestDelegate;
	import com.boxedfolder.rtm.delegates.MilkyTimeDelegate;
	import com.boxedfolder.rtm.delegates.MilkyTimelineDelegate;
	import com.boxedfolder.rtm.delegates.MilkyTimezoneDelegate;
	import com.boxedfolder.rtm.delegates.MilkyTransactionsDelegate;
	import com.boxedfolder.rtm.events.MilkyEvent;
	import com.boxedfolder.rtm.vo.status.MilkyFailStatus;
	
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLVariables;
	
	[Event(name="api_fail", type="com.boxedfolder.rtm.events.MilkyEvent")]
	[Event(name="api_result", type="com.boxedfolder.rtm.events.MilkyEvent")]
	[Event(name="ioError", type="flash.events.IOErrorEvent")]
	[Event(name="progress", type="flash.events.ProgressEvent")]
	[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
	[Event(name="httpStatus", type="flash.events.HTTPStatusEvent")]
	[Event(name="open", type="flash.events.Event")]
	
	/**
	 * <b>Milky</b>
	 * 
	 * <p>
	 * RTM service class to use with rememberthemilk.com webservice. 
	 * For in-depth api documentation have a look at the official website:
	 * <a class="_blank" href="https://www.rememberthemilk.com/services/api/">https://www.rememberthemilk.com/services/api/</a>
	 * </p>
	 * <p>
	 * This is a subclass of <code>AbstractMilky</code>. <code>AbstractMilky</code> implements base
	 * methods to send requests to the rtm webservice.
	 * </p>
	 *  
	 * @author Heiko Dreyer
	 * @see https://www.rememberthemilk.com/services/api/
	 * 
	 */
	public class Milky extends AbstractMilky
	{
		//-------------------------------------------------------------------------
		//
		// Variables
		//
		//-------------------------------------------------------------------------
		
		/**
		 * @private 
		 */		
		private var _variables:URLVariables;
		
		/**
		 * @private 
		 */		
		private var _userName:String;
		
		/**
		 * @private 
		 */		
		private var _fullName:String;
		
		/**
		 * @private 
		 */		
		private var _userId:uint;
		
		/**
		 * @private 
		 */		
		private var _permission:String;
		
		/**
		 * @private 
		 */		
		private var _responseDelegate:AbstractMilkyDelegate;
		
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		public function Milky(apiKey:String, sharedSecret:String) 
		{
			super(apiKey, sharedSecret);
		}
		
		//--------------------------------------------------------------------------
		//
		// Methods
		// 
		//--------------------------------------------------------------------------	
		// test
		//--------------------------------------------------------------------------	
		/**
		 * Echo method for testing purposes
		 * <p>
		 * <i>Result type will be <code>xml</code>.</i>
		 * </p>
		 * 
		 */		
		public function testEcho():void
		{
			_responseDelegate = new MilkyTestDelegate(_lastApiMethod);
			
			send();
		}
		
		/**
		 * Login method for testing purposes
		 * <p>
		 * <i>Result type will be <code>xml</code>.</i>
		 * </p>
		 * 
		 */		
		public function testLogin(token:String):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			
			send(MilkyConstants.TEST_LOGIN, _variables);
			_responseDelegate = new MilkyTestDelegate(_lastApiMethod);
		}
		
		//--------------------------------------------------------------------------
		// reflection
		//--------------------------------------------------------------------------
		/**
		 * Retrives available methods
		 * <p>
		 * <i>Result type will be <code>xml</code>.</i>
		 * </p>
		 * 
		 */		
		public function getMethods():void
		{
			_responseDelegate = new MilkyReflectionDelegate(MilkyConstants.GET_METHODS);
			send(MilkyConstants.GET_METHODS);
		}
		
		/**
		 * Retrives method info
		 * <p>
		 * <i>Result type will be <code>xml</code>.</i>
		 * </p>
		 * 
		 */		
		public function getMethodInfo(name:String):void
		{
			_variables = new URLVariables();
			_variables.method_name = name;
			
			_responseDelegate = new MilkyReflectionDelegate(MilkyConstants.GET_METHOD_INFO);
			send(MilkyConstants.GET_METHOD_INFO, _variables);	
		}
		
		//--------------------------------------------------------------------------
		// auth
		//--------------------------------------------------------------------------
		/**
		 * Gets a frob 
		 * <p>
		 * <i>Result Type will be <code>String</code>.</i> 
		 * </p>
		 * 
		 */		
		public function getFrob():void
		{			
			_responseDelegate = new MilkyAuthDelegate(MilkyConstants.GET_FROB);
			send(MilkyConstants.GET_FROB);
		}
		
		/**
		 * Get a Token  
		 * <p>
		 * <i>Result Type Event will be <code>String</code>.</i>
		 * </p>
		 * 
		 * @param frob
		 * 
		 */		
		public function getToken(frob:String):void
		{
			_variables = new URLVariables();
			_variables.frob = frob;
			
			_responseDelegate = new MilkyAuthDelegate(MilkyConstants.GET_TOKEN);
			send(MilkyConstants.GET_TOKEN, _variables);
		}
		
		/**
		 * Checks if token is still valid
		 * <p>
		 * <i>Result Type will be <code>string</code>.</i>
		 * </p>
		 * 
		 * @param token
		 * 
		 */		
		public function checkToken(token:String):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyAuthDelegate(MilkyConstants.CHECK_TOKEN);
			send(MilkyConstants.CHECK_TOKEN, _variables);
		}
		
		//--------------------------------------------------------------------------
		// timeline
		//--------------------------------------------------------------------------
		/**
		 * Creates a new timeline. 
		 * Timeline will not expire and can be reused.
		 * <p>
		 * You´ll always need a timeline for almost every api method which can be undone. 
		 * Adding contacts, notes etc. 
		 * </p>
		 * <i>Result Type will be <code>uint</code>.</i>
		 * 
		 * @param token
		 * 
		 */		
		public function createTimeline(token:String):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTimelineDelegate(MilkyConstants.CREATE_TIMELINE);
			send(MilkyConstants.CREATE_TIMELINE, _variables);
		}
		
		//--------------------------------------------------------------------------
		// contacts
		//--------------------------------------------------------------------------
		/**
		 *  Gets the user´s contact list.
		 * 
		 * @param token
		 * 
		 */		
		public function getContactList(token:String):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyContactsDelegate(MilkyConstants.GET_CONTACT_LIST);
			send(MilkyConstants.GET_CONTACT_LIST, _variables);
		}
		
		/**
		 * Adds a contact with given <b>eMail</b> or <b>name</b> as <code>name</code> parameter.
		 * <p>
		 * <i>Result type will be <code>MilkyContact</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param contact
		 * 
		 */		
		public function addContact(timeline:uint, name:String, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.contact = name;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyContactsDelegate(MilkyConstants.ADD_CONTACT);
			send(MilkyConstants.ADD_CONTACT, _variables);
		}
		
		/**
		 * Deletes a contact
		 * <p>
		 * <i>Result type will be <code>Boolean</code>.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param contactId
		 * @param token
		 * 
		 */		
		public function deleteContact(timeline:uint, contactId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.contact_id = contactId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyContactsDelegate(MilkyConstants.DELETE_CONTACT);
			send(MilkyConstants.DELETE_CONTACT, _variables);
		}
		
		//--------------------------------------------------------------------------
		// groups
		//--------------------------------------------------------------------------
		/**
		 * Retrieves group list
		 * <p>
		 * <i>Result will be an array with <code>MilkyGroup</code>-Objects.</i>
		 * </p> 
		 * 
		 * @param token
		 * 
		 */		
		public function getGroupList(token:String):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyGroupsDelegate(MilkyConstants.GET_GROUP_LIST);
			send(MilkyConstants.GET_GROUP_LIST, _variables);
		}
		
		/**
		 * Adds a specific contact to a group with given id.
		 * <p>
		 * <i>Result will be of Type <code>Boolean</code>.</i>
		 * </p> 
		 * 
		 * @param timeline
		 * @param groupId
		 * @param contactId
		 * @param token
		 * 
		 */		
		public function addContactToGroup(timeline:uint, groupId:uint, contactId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.contact_id = contactId;
			_variables.group_id = groupId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyGroupsDelegate(MilkyConstants.ADD_CONTACT_TO_GROUP);
			send(MilkyConstants.ADD_CONTACT_TO_GROUP, _variables);
		}
		
		/**
		 * Removes a specific contact from a group with given id.
		 * <p>
		 * <i>Result will be of Type <code>Boolean</code>.</i>
		 * </p> 
		 * 
		 * @param timeline
		 * @param groupId
		 * @param contactId
		 * @param token
		 * 
		 */	
		public function removeContactFromGroup(timeline:uint, groupId:uint, contactId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.contact_id = contactId;
			_variables.group_id = groupId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyGroupsDelegate(MilkyConstants.REMOVE_CONTACT_FROM_GROUP);
			send(MilkyConstants.REMOVE_CONTACT_FROM_GROUP, _variables);
		}
		
		/**
		 * Deletes group with given id.
		 *  
		 * <p>
		 * <i>Result will be of Type <code>Boolean</code>.</i>
		 * </p> 
		 * 
		 * @param timeline
		 * @param groupId
		 * @param token
		 * 
		 */		
		public function deleteGroup(timeline:uint, groupId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.group_id = groupId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyGroupsDelegate(MilkyConstants.DELETE_GROUP);
			send(MilkyConstants.DELETE_GROUP, _variables);
		}
		
		/**
		 * Creates Group with given name
		 * 
		 * <p>
		 * <i>Result will be of Type <code>MilkyGroup</code>.</i>
		 * </p> 
		 * 
		 * @param timeline
		 * @param name
		 * @param token
		 * 
		 */		
		public function addGroup(timeline:uint, name:String, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.group = name;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyGroupsDelegate(MilkyConstants.ADD_GROUP);	
			send(MilkyConstants.ADD_GROUP, _variables);	
		}
		
		//--------------------------------------------------------------------------
		// settings
		//--------------------------------------------------------------------------
		/**
		 * Retrieves user settings
		 * <p>
		 * <i>Result will be of type <code>MilkySettings</code>.</i>
		 * </p>
		 * @param token
		 * 
		 */		
		public function getSettings(token:String):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			
			_responseDelegate = new MilkySettingsDelegate(MilkyConstants.GET_SETTINGS);
			send(MilkyConstants.GET_SETTINGS, _variables);
		}
		
		//--------------------------------------------------------------------------
		// timezones
		//--------------------------------------------------------------------------
		/**
		 * Gets available timezones
		 * <p>
		 * If result type is "array", result will be a vo of type <code>MilkySettings</code> 
		 * </p>
		 * <i>Result Type will be an array with a list of <code>MilkyTimezone</code>-Objects.</i>
		 * 
		 */		
		public function getTimezones():void
		{
			_responseDelegate = new MilkyTimezoneDelegate(MilkyConstants.GET_TIMEZONES);
			send(MilkyConstants.GET_TIMEZONES);
		}
		
		//--------------------------------------------------------------------------
		// time
		//--------------------------------------------------------------------------	
		/**
		 * <p>
		 * Converts time from one timezone to another.
		 * When just passing the <code>toTimezone</code> and/or the <code>fromTimezone</code> arguments, time default value is <i>now</i>
		 * Timezones can be retrieved via the <code>getTimezones</code> method.
		 * Both <code>toTimezone</code> and <code>fromTimezon</code> accept valid timezone names (e.g. "Australia/Sydney")
		 * <code>time</code> parameter should be in ISO 8601 format.
		 *  </p>
		 * 
		 * <i>Result will be of type <code>MilkyTime</code>.</i>
		 * 
		 * @param toTimezone
		 * @param fromTimezone
		 * @param time
		 * 
		 */		
		public function convertTime(toTimezone:String, fromTimezone:String = "", time:String = ""):void
		{
			_variables = new URLVariables();
			_variables.to_timezone = toTimezone;
			
			if(fromTimezone != "")
				_variables.from_timezone = fromTimezone;
			
			if(time != "")
				_variables.time = time;
			
			_responseDelegate = new MilkyTimeDelegate(MilkyConstants.CONVERT_TIME);
			send(MilkyConstants.CONVERT_TIME, _variables);
		}
		
		/**
		 * Given text gets parsed.
		 * 
		 * <p>
		 * Dateformat: A value of 0 indicates an European date format (14/02/2006).A value of 1 indicates an American date format (02/14/2006). 
		 * This value is used in case a date is ambiguous. Defaults to 1.
		 * </p>
		 * See <code>getTimezones</code> for available timezones.
		 * <p> 
		 * <i>Result will be of type <code>MilkyTime</code>.</i>
		 * </p>
		 * 
		 * @param text
		 * @param timezone
		 * @param dateformat
		 * 
		 */		
		public function parseTime(text:String, timezone:String = "", dateformat:uint = 1):void
		{
			_variables = new URLVariables();
			_variables.text = text;
			_variables.dateformat = dateformat;
			
			if(timezone != "")
				_variables.timezone = timezone;	
			
			_responseDelegate = new MilkyTimeDelegate(MilkyConstants.PARSE_TIME);
			send(MilkyConstants.PARSE_TIME, _variables);
		}
		
		//--------------------------------------------------------------------------
		// locations
		//--------------------------------------------------------------------------		
		/**
		 * Retrieves a list of locations.
		 * 
		 * <p> 
		 * <i>Result will be an array with a list of <code>MilkyLocation</code> objects.</i>
		 * </p>
		 * 
		 * @param token
		 * 
		 */		
		public function getLocations(token:String):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyLocationsDelegate(MilkyConstants.GET_LOCATIONS);
			send(MilkyConstants.GET_LOCATIONS, _variables);
		}	
		//--------------------------------------------------------------------------
		// transactions
		//--------------------------------------------------------------------------	
		/**
		 * Perform an undo operation on given transaction id
		 * 
		 * <p> 
		 * <i>Result will be of type <code>Boolean</code>.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param transactionId
		 * @param token
		 * 
		 */		
		public function undoTransaction(timeline:uint, transactionId:Number, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.transaction_id = transactionId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTransactionsDelegate(MilkyConstants.UNDO_TRANSACTION);
			send(MilkyConstants.UNDO_TRANSACTION, _variables);
		}
		
		//--------------------------------------------------------------------------
		// lists
		//--------------------------------------------------------------------------
		/**
		 * Retrieves a lists of lists 
		 * 
		 * <p> 
		 * <i>Result will be an array with a list of <code>MilkyList</code> objects.</i>
		 * </p>
		 * 
		 * @param token
		 * 
		 */		
		public function getLists(token:String):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyListsDelegate(MilkyConstants.GET_LISTS);
			send(MilkyConstants.GET_LISTS, _variables);	
		}
		
		/**
		 * Adds a list with given name,timeline and filter
		 * <p>
		 * Filter value is a string with parameter and brackets.
		 * Here is a list of available values: <br />
		 * <a href="http://www.rememberthemilk.com/help/answers/search/advanced.rtm" target="_blank">http://www.rememberthemilk.com/help/answers/search/advanced.rtm</a>
		 * </p>
		 * <p>
		 * Values can be connected using the keyward "and" like in this example:<br />
		 * <code>(status:incomplete and name:super)</code>
		 * </p>
		 * <p>
		 * Parameter <code>name</code> should not be <b>Inbox</b> or <b>Sent</b>
		 * </p>
		 * <p> 
		 * <i>Result will be a <code>MilkyList</code> objects.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param name
		 * @param token
		 * @param filter
		 * @see http://www.rememberthemilk.com/help/answers/search/advanced.rtm
		 * 
		 */		
		public function addList(timeline:uint, name:String, token:String, filter:String = ""):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			_variables.timeline = timeline;
			_variables.filter = filter;
			
			if(name == "Inbox" || name == "Sent")
				_variables.name = new Date().toTimeString();
			else
				_variables.name = name;
			
			_responseDelegate = new MilkyListsDelegate(MilkyConstants.ADD_LIST);
			send(MilkyConstants.ADD_LIST, _variables);
		}
		
		/**
		 * Deletes a list with given id
		 *  
		 * <p> 
		 * <i>Result will be a <code>MilkyList</code> objects.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param token
		 * 
		 */		
		public function deleteList(timeline:uint, listId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.auth_token = token;
			_variables.list_id = listId;
			_variables.timeline = timeline;
			
			_responseDelegate = new MilkyListsDelegate(MilkyConstants.DELETE_LIST);
			send(MilkyConstants.DELETE_LIST, _variables);
		}
		
		/**
		 * Archives list with given id
		 *
		 * <p> 
		 * <i>Result will be a <code>MilkyList</code> objects.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param token
		 * 
		 */		
		public function archiveList(timeline:uint, listId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyListsDelegate(MilkyConstants.ARCHIVE_LIST);
			send(MilkyConstants.ARCHIVE_LIST, _variables);
		}
		
		/**
		 * Unarchives list with given id
		 *
		 * <p> 
		 * <i>Result will be a <code>MilkyList</code> objects.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param token
		 * 
		 */	
		public function unArchiveList(timeline:uint, listId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyListsDelegate(MilkyConstants.UNARCHIVE_LIST);
			send(MilkyConstants.UNARCHIVE_LIST, _variables);
		}		
		
		/**
		 * Sets the name of the list with given id
		 * <p>
		 * Parameter <code>name</code> should not be <b>Inbox</b> or <b>Sent</b>
		 * </p>
		 * 
		 * <p> 
		 * <i>Result will be a <code>MilkyList</code> objects.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param listId
		 * @param name
		 * @param token
		 * 
		 */		
		public function setListName(timeline:uint, listId:uint, name:String, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			
			if(name == "Inbox" || name == "Sent")
				_variables.name = new Date().toTimeString();
			else
				_variables.name = name;
			
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyListsDelegate(MilkyConstants.SET_LIST_NAME);
			send(MilkyConstants.SET_LIST_NAME, _variables);
		}
		
		/**
		 * Sets list with given id as default list
		 *  
		 * <p> 
		 * <i>Result will be of type <code>Boolean</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param token
		 * 
		 */		
		public function setDefaultList(timeline:uint, listId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyListsDelegate(MilkyConstants.SET_DEFAULT_LIST);
			send(MilkyConstants.SET_DEFAULT_LIST, _variables);
		}
		
		//--------------------------------------------------------------------------
		// tasks
		//--------------------------------------------------------------------------
		/**
		 * Gets a list with Taskseries/Tasks 
		 * 
		 * <p> 
		 * <i>Result will be an array with objects of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 *  
		 * @param token
		 * @param listId
		 * @param lastSync
		 * @param filter
		 * 
		 */		
		public function getTaskList(token:String, listId:uint = 0, lastSync:String = "", filter:String = ""):void
		{
			_variables = new URLVariables();
			_variables.last_sync = lastSync;
			_variables.filter = filter;
			_variables.auth_token = token;
			
			if(listId != 0)
				_variables.list_id = listId;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.GET_TASK_LIST);
			send(MilkyConstants.GET_TASK_LIST, _variables);
		}
		
		/**
		 * Adds a task to the list with given id
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * <p>
		 * <code>parse</code> is a paremter which supports Smart Add ability:
		 * </p>
		 * <a href="http://www.rememberthemilk.com/services/smartadd/" target="_blank">http://www.rememberthemilk.com/services/smartadd/</a>
		 *  
		 * @param timeline
		 * @param listId
		 * @param name
		 * @param parse
		 * @see http://www.rememberthemilk.com/services/smartadd/
		 * 
		 */		
		public function addTask(timeline:uint, name:String, token:String, listId:uint = 0, parse:String = ""):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.parse = parse;
			_variables.name = name;
			_variables.auth_token = token;
			
			if(listId != 0)
				_variables.list_id = listId;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.ADD_TASK);
			send(MilkyConstants.ADD_TASK, _variables);
		}
		
		/**
		 * Deletes a task
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * <p>
		 * <code>parse</code> is a paremter which supports Smart Add ability:
		 * </p>
		 * <a href="http://www.rememberthemilk.com/services/smartadd/" target="_blank">http://www.rememberthemilk.com/services/smartadd/</a>
		 *  
		 * @param timeline
		 * @param listId
		 * @param name
		 * @param parse
		 * @see http://www.rememberthemilk.com/services/smartadd/
		 * 
		 */		
		public function deleteTask(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;
	
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.DELETE_TASK);	
			send(MilkyConstants.DELETE_TASK, _variables);				
		}
		
		/**
		 * Adds tags to a specific task.
		 * <p>
		 * Tags are specified as Array of Strings.
		 * </p>
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param tags
		 * @param token
		 * 
		 */		
		public function addTaskTags(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, tags:Array, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.tags = tags.toString();
			_variables.auth_token = token;
			_variables.list_id = listId;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.ADD_TASK_TAGS);	
			send(MilkyConstants.ADD_TASK_TAGS, _variables);				
		}
		
		/**
		 * Sets tags of a specific task.
		 * <p>
		 * Tags are specified as Array of Strings. Pass an empty array to clear tags.
		 * </p>
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param tags
		 * @param token
		 * 
		 */		
		public function setTaskTags(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, tags:Array, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			
			if(tags.length != 0)
				_variables.tags = tags.toString();
			
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_TAGS);	
			send(MilkyConstants.SET_TASK_TAGS, _variables);				
		}
		
		/**
		 * Remove tags of a specific task.
		 * 
		 * <p>
		 * Tags are specified as Array of Strings.
		 * </p>
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param tags
		 * @param token
		 * 
		 */		
		public function removeTaskTags(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, tags:Array, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.tags = tags.toString();
			_variables.auth_token = token;
			_variables.list_id = listId;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.REMOVE_TAGS);		
			send(MilkyConstants.REMOVE_TAGS, _variables);	
		}
		
		/**
		 * Mark a task as complete
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * 
		 */		
		public function setTaskCompleted(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_COMPLETE);
			send(MilkyConstants.SET_TASK_COMPLETE, _variables);					
		}
		
		/**
		 * Mark a task as uncomplete
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * 
		 */		
		public function setTaskUncomplete(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_UNCOMPLETE);
			send(MilkyConstants.SET_TASK_UNCOMPLETE, _variables);
		}
		
		/**
		 * Postpones a task
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * 
		 */		
		public function postponeTask(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.POSTPONE_TASK);
			send(MilkyConstants.POSTPONE_TASK, _variables);
		}
		
		/**
		 * Moves Priority of a specific task
		 * 
		 * <p>
		 * Use contants <code>MilkyConsts.PRIORITY_UP</code> and <code>MilkyConsts.PRIORITY_DOWN</code>.
		 * </p>
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * @param direction
		 * 
		 */		
		public function movePriority(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String, direction:String = MilkyConstants.PRIORITY_UP):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.direction = direction;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.MOVE_TASK_PRIORITY);
			send(MilkyConstants.MOVE_TASK_PRIORITY, _variables);
		}
		
		/**
		 * Moves a task to a specific list 
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param fromListId
		 * @param toListId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * 
		 */		
		public function moveTaskToList(timeline:uint, fromListId:uint, toListId:uint, taskseriesId:uint, taskId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;			
			_variables.from_list_id = fromListId;
			_variables.to_list_id = toListId;			
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.MOVE_TASK_TO_LIST);
			send(MilkyConstants.MOVE_TASK_TO_LIST, _variables);
		}
		
		/**
		 * Sets due date of a task
		 * <p>
		 * If empty, due date will be unset.
		 * </p>
		 * <p>
		 * If parse is set to true, date will be parsed as per rtm.time.parse.rtm
		 * </p>
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * @param due
		 * @param hasDueTime
		 * @param parse
		 * 
		 */		
		public function setTaskDueDate(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String, due:String = "", hasDueTime:Boolean = false, parse:Boolean = false):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;		
			_variables.list_id = listId;			
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;
			
			if(due != "")
				_variables.due = due;
			
			if(hasDueTime)
				_variables.has_due_time = 1;
			else
				_variables.has_due_time = 0;
			
			if(parse)
				_variables.parse = 1;
			else
				_variables.parse = 0;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_DUE_DATE);
			send(MilkyConstants.SET_TASK_DUE_DATE, _variables);
		}
		
		/**
		 * Sets the task estimate time
		 * <p>
		 * Should provide value of <b>day</b>,<b>hours</b> or <b>minutes</b>.
		 * </p>
		 *  <p>
		 * If empty, estimate will be unset.
		 * </p>
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * @param estimate
		 * 
		 */		
		public function setTaskEstimate(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String, estimate:String = ""):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;		
			_variables.list_id = listId;			
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;
			_variables.estimate = estimate;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_ESTIMATE);
			send(MilkyConstants.SET_TASK_ESTIMATE, _variables);
		}
		
		/**
		 * Sets the task location
		 * 
		 * <p>
		 * If 0, location will be unset.
		 * </p>
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * @param location_id
		 * 
		 */		
		public function setTaskLocation(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String, locationId:uint = 0):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;		
			_variables.list_id = listId;			
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;
			
			if(locationId != 0)
				_variables.location_id = locationId;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_LOCATION);
			send(MilkyConstants.SET_TASK_LOCATION, _variables);
		}
		
		/**
		 * Sets the task name
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param name
		 * @param token
		 * 
		 */		
		public function setTaskName(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, name:String, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;		
			_variables.list_id = listId;			
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.name = name;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_NAME);
			send(MilkyConstants.SET_TASK_NAME, _variables);
		}
		
		/**
		 * Sets priority of a task
		 * 
		 * <p>
		 * Valid values are 1, 2 and 3. If priority is not specified or is an invalid value, the task is marked as having no priority.
		 * </p>
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 *  
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * @param priority
		 * 
		 */		
		public function setTaskPriority(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String, priority:uint = 0):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;		
			_variables.list_id = listId;			
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;	
			_variables.priority = priority;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_PRIORITY);
			send(MilkyConstants.SET_TASK_PRIORITY, _variables);
		}
		
		/**
		 * Sets a reurrence pattern for a task
		 * <p>
		 * Valid values of repeat are detailed <a href="http://www.rememberthemilk.com/help/answers/basics/repeatformat.rtm" target="_blank">here</a>.
		 * </p>
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * @param repeat
		 * @see http://www.rememberthemilk.com/help/answers/basics/repeatformat.rtm
		 * 
		 */		
		public function setTaskRecurrence(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String, repeat:String = ""):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;		
			_variables.list_id = listId;			
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;	
			_variables.repeat = repeat;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_RECURRENCE);
			send(MilkyConstants.SET_TASK_RECURRENCE, _variables);
		}
		
		/**
		 * Sets url for a task
		 * <p>
		 * If left empty, url will be unset.
		 * </p>
		 *  <p> 
		 * <i>Result will be of type <code>MilkyTaskSeries</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param token
		 * @param url
		 * 
		 */		
		public function setTaskURL(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, token:String, url:String = ""):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;		
			_variables.list_id = listId;			
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.auth_token = token;	
			
			if(url != "")
				_variables.url = url;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.SET_TASK_URL);
			send(MilkyConstants.SET_TASK_URL, _variables);
		}
		
		//--------------------------------------------------------------------------
		// notes
		//--------------------------------------------------------------------------
		/**
		 * Adds a new note with given properties
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyNote</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param listId
		 * @param taskseriesId
		 * @param taskId
		 * @param title
		 * @param body
		 * @param token
		 * 
		 */		
		public function addNote(timeline:uint, listId:uint, taskseriesId:uint, taskId:uint, title:String, body:String, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.list_id = listId;
			_variables.taskseries_id = taskseriesId;
			_variables.task_id = taskId;
			_variables.taskseries_id = taskseriesId;
			_variables.note_text = body;
			_variables.note_title = title;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.ADD_NOTE);
			send(MilkyConstants.ADD_NOTE, _variables);
		}
		
		/**
		 * Deletes a note with given id
		 * 
		 * <p> 
		 * <i>Result will be of type <code>Boolean</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param noteId
		 * @param token
		 * 
		 */		
		public function deleteNote(timeline:uint, noteId:uint, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.note_id = noteId;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.DELETE_NOTE);
			send(MilkyConstants.DELETE_NOTE, _variables);
		}
		
		/**
		 * Edits a note with given id
		 * 
		 * <p> 
		 * <i>Result will be of type <code>MilkyNote</code>.</i>
		 * </p>
		 * 
		 * @param timeline
		 * @param noteId
		 * @param title
		 * @param body
		 * @param token
		 * 
		 */		
		public function editNote(timeline:uint, noteId:uint, title:String, body:String, token:String):void
		{
			_variables = new URLVariables();
			_variables.timeline = timeline;
			_variables.note_id = noteId;
			_variables.note_title = title;
			_variables.note_text = body;
			_variables.auth_token = token;
			
			_responseDelegate = new MilkyTasksDelegate(MilkyConstants.EDIT_NOTE);
			send(MilkyConstants.EDIT_NOTE, _variables);
		}
		
		//--------------------------------------------------------------------------
		// utils
		//--------------------------------------------------------------------------	
		/**
		 * Use this method to generate an auth-url string 
		 * 
		 *  
		 * @param frob
		 * @param permission
		 * @return 
		 * 
		 */		
		public function generateAuthUrl(frob:String, permission:String = MilkyConstants.PERMISSION_DELETE):String
		{
			var apiSig:String;
			_variables= new URLVariables();
			
			_variables.api_key = _apiKey;
			_variables.frob = frob;
			_variables.perms = permission;	
			
			apiSig = signRequest(_variables);
			
			return "http://www.rememberthemilk.com/services/auth/?api_key=" + apiKey + "&perms=" + permission + "&frob=" + frob + "&api_sig=" + apiSig;
		}
		
		//--------------------------------------------------------------------------
		//
		// Event-Handlers
		// 
		//--------------------------------------------------------------------------
		/**
		 * Event forwarding for
		 * <i>HTTPStatusEvent.HTTP_STATUS</i>.
		 *  
		 * @param e
		 * 
		 */		
		override protected function handleHttpStatus(e:HTTPStatusEvent = null):void
		{
			dispatchEvent(e);
		}
		
		/**
		 * Event forwarding for
		 * <i>IOErrorEvent.IO_ERROR</i>.
		 *  
		 * @param e
		 * 
		 */		
		override protected function handleIOErrors(e:IOErrorEvent = null):void
		{
			super.handleIOErrors();
			
			// Reset response Delegate
			_responseDelegate = null;
			
			dispatchEvent(e);
		}
		
		/**
		 * Event forwarding for
		 * <i>Event.OPEN</i>.
		 *  
		 * @param e
		 * 
		 */		
		override protected function handleOpen(e:Event = null):void
		{
			dispatchEvent(e);
		}
		
		/**
		 * Event handling for
		 * <i>Event.COMPLETE</i>.
		 *  
		 * @param e
		 * 
		 */		
		override protected function handleComplete(e:Event = null):void
		{		
			super.handleComplete();
			
			var event:MilkyEvent;		
			_lastResult = XML(_service.data);	

			// Check if request failed
			if(_lastResult.@stat == "fail")
				event = new MilkyEvent(MilkyEvent.API_FAIL, _lastApiMethod, new MilkyFailStatus(uint(_lastResult.err.@code), _lastResult.err.@msg));
			else	
			{		
				event = new MilkyEvent(MilkyEvent.API_RESULT, _lastApiMethod, _lastResult);
				
				// Handle special case of GET_TOKEN and CHECK_TOKEN
				// Get the userid, username, fullname and permission out of the result
				if(_lastApiMethod == MilkyConstants.GET_TOKEN || _lastApiMethod == MilkyConstants.CHECK_TOKEN)
				{
					_userName = _lastResult.auth.user.@username;
					_fullName = _lastResult.auth.user.@fullname;
					_userId = _lastResult.auth.user.@id;
					_permission = _lastResult.auth.perms;				
				}
				
				// Delegate positive response
				if(_dataFormat == MilkyConstants.ARRAY_FORMAT && _responseDelegate != null)
					event.data = _responseDelegate.handleDataParsing(XML(_lastResult));
			}
						
			// Add transaction data if available
			if(_lastResult.transaction.attribute("id").length() != 0)
			{
				event.transactionId = _lastResult.transaction.@id;
				event.undoable = Boolean(uint(_lastResult.transaction.@undoable));
			}
			
			// Reset response Delegate
			_responseDelegate = null;
			
			dispatchEvent(event);
		}
		
		/**
		 * Event forwarding for
		 * <i>ProgressEvent.PROGRESS</i>.
		 *  
		 * @param e
		 * 
		 */		
		override protected function handleProgress(e:ProgressEvent = null):void
		{
			dispatchEvent(e);
		}
		
		/**
		 * Event forwarding for
		 * <i>SecurityErrorEvent.SECURITY_ERROR</i>.
		 *  
		 * @param e
		 * 
		 */		
		override protected function handleSecurityError(e:SecurityErrorEvent = null):void
		{
			super.handleSecurityError();
			
			// Reset response Delegate
			_responseDelegate = null;
			
			dispatchEvent(e);
		}		
		
		//--------------------------------------------------------------------------
		//
		// Getters / Setters
		// 
		//--------------------------------------------------------------------------
		/**
		 * If token valid, returns the username. 
		 * 
		 * @return 
		 * 
		 */		
		public function get userName():String
		{
			return _userName;
		}
		
		/**
		 * If token valid, returns the fullname. 
		 * 
		 * @return 
		 * 
		 */		
		public function get fullName():String
		{
			return _fullName;
		}
		
		/**
		 * If token valid, returns the userId.
		 * 
		 * @return 
		 * 
		 */		
		public function get userId():uint
		{
			return _userId;
		}
		
		/**
		 * If token valid, returns the permission status.  
		 * @return 
		 * 
		 */		
		public function get permission():String
		{
			return _permission;
		}		
	}
}
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

package com.boxedfolder.rtm.delegates
{
	import com.boxedfolder.rtm.MilkyConstants;
	import com.boxedfolder.rtm.utils.Serializer;

	/**
	 * Delegates task request responses
	 * 
	 * @author Heiko Dreyer
	 * 
	 */	
	public class MilkyTasksDelegate extends AbstractMilkyDelegate
	{
		public function MilkyTasksDelegate(lastApiMethod:String)
		{
			super(lastApiMethod);
		}
		
		/**
		 * Handles data parsing
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		override public function handleDataParsing(data:XML):Object
		{
			if(_lastApiMethod == MilkyConstants.GET_TASK_LIST)
				return Serializer.taskSeriesListXmlToVo(data);
			
			if(_lastApiMethod == MilkyConstants.ADD_NOTE || _lastApiMethod == MilkyConstants.EDIT_NOTE)
				return Serializer.nestedNoteXmlToVo(XML(data));
			
			if(_lastApiMethod == MilkyConstants.DELETE_NOTE)
				return true;
			
			return Serializer.taskSeriesXmlToVo(data);
		}
	}
}
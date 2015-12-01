<!-- created by Yewon Kim -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form role="form">
  <div class="form-group">
    <label for="eventType">EventType:</label>
    <select class="form-control" id="eventType">
	  <option value="Lunch">Lunch</option>
	  <option value="Dinner">Dinner</option>
	  <option value="Sport">Sport</option>
	  <option value="Study">Study</option>
	  <option value="Party">Party</option>
	</select>
  </div>
  <div class="form-group">
    <label for="eventPlace">EventPlace:</label>
    <input type="text" class="form-control" id="eventPlace">
  </div>
  <div class="form-group">
    <label for="eventTime">EventDate:</label>
    <input type="text" class="form-control" id="eventPlace">
    <div class="container">
	    <div class="row">
	        <div class='col-sm-6'>
	            <div class="form-group">
	                <div class='input-group date' id='datetimepicker1'>
	                    <input type='text' class="form-control" />
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
    
  </div>
  <div class="form-group">
    <label for="eventPlace">EventDescription:</label>
    <textarea class="form-control" rows="5" id="eventPlace"></textarea>
  </div>
  <div class="form-group">
    <label for="eventPlace">Friends or group:</label>
    <input type="text" class="form-control" id="eventPlace">
  </div>
</form>

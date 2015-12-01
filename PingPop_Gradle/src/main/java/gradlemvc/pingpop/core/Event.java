/**
 * create by Yewon Kim*
 * */
package gradlemvc.pingpop.core;

public class Event {
	private String eventId;
	private String eventType;
	private EventState eventState;
	private String eventDate;
	private String eventPlace;
	private String eventDescription;
	private String eventHostUser;//Host UserID
	private String eventParticipantList;

	enum EventState {CREATED, CANCELED, FINISHED}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getEventType() {
		return eventType;
	}

	public void setEventType(String eventType) {
		this.eventType = eventType;
	}

	public EventState getEventState() {
		return eventState;
	}

	public void setEventState(EventState eventState) {
		this.eventState = eventState;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventPlace() {
		return eventPlace;
	}

	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	public String getEventHostUser() {
		return eventHostUser;
	}

	public void setEventHostUser(String eventHostUser) {
		this.eventHostUser = eventHostUser;
	}

	public String getEventParticipantList() {
		return eventParticipantList;
	}

	public void setEventParticipantList(String eventParticipantList) {
		this.eventParticipantList = eventParticipantList;
	}
}

package gradlemvc.pingpop.core;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.client.util.DateTime;

import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.calendar.model.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;

public class GoogleCalendar {
	/** Application name. */
    private static final String APPLICATION_NAME =
        "Google Calendar API Java Quickstart";

    /** Directory to store user credentials for this application. */
    private static final java.io.File DATA_STORE_DIR = new java.io.File(
        System.getProperty("user.home"), ".credentials/calendar-java-quickstart");

    /** Global instance of the {@link FileDataStoreFactory}. */
    private static FileDataStoreFactory DATA_STORE_FACTORY;

    /** Global instance of the JSON factory. */
    private static final JsonFactory JSON_FACTORY =
        JacksonFactory.getDefaultInstance();

    /** Global instance of the HTTP transport. */
    private static HttpTransport HTTP_TRANSPORT;

    /** Global instance of the scopes required by this quickstart. */
    private static final List<String> SCOPES =
        Arrays.asList(CalendarScopes.CALENDAR_READONLY);

    static {
        try {
            HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
            DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
        } catch (Throwable t) {
            t.printStackTrace();
            System.exit(1);
        }
    }

    /**
     * Creates an authorized Credential object.
     * @return an authorized Credential object.
     * @throws IOException
     */
    public static Credential authorize() throws IOException {
        // Load client secrets.
        InputStream in =
        		GoogleCalendar.class.getResourceAsStream("/client_secret.json");
        GoogleClientSecrets clientSecrets =
            GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow =
                new GoogleAuthorizationCodeFlow.Builder(
                        HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                .setDataStoreFactory(DATA_STORE_FACTORY)
                .setAccessType("offline")
                .build();
        Credential credential;
		try {
			credential = new AuthorizationCodeInstalledApp(
			    flow, new LocalServerReceiver()).authorize("user");
			System.out.println(
	                "Credentials saved to " + DATA_STORE_DIR.getAbsolutePath());
	        return credential;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }

    /**
     * Build and return an authorized Calendar client service.
     * @return an authorized Calendar client service
     * @throws IOException
     */
    public static com.google.api.services.calendar.Calendar
        getCalendarService() throws IOException {
        Credential credential = authorize();
        return new com.google.api.services.calendar.Calendar.Builder(
                HTTP_TRANSPORT, JSON_FACTORY, credential)
                .setApplicationName(APPLICATION_NAME)
                .build();
    }
    
    void deleteGoogleEvent(Event event){
    	try {
			com.google.api.services.calendar.Calendar service = getCalendarService();
			service.events().delete("primary", event.getEventId());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    void createEventOnGoogle(Event event){
    	try {
			com.google.api.services.calendar.Calendar service = getCalendarService();
			com.google.api.services.calendar.model.Event googleEvent = new com.google.api.services.calendar.model.Event();
			
			DateTime startDateTime = new DateTime(event.getEventDate());
			EventDateTime start = new EventDateTime()
					.setDateTime(startDateTime)
					.setTimeZone("Asia/Seoul");
			DateTime endDateTime = new DateTime(event.getEventDate());
			EventDateTime end = new EventDateTime()
					.setDateTime(endDateTime)
					.setTimeZone("Asia/Seoul");
			
			googleEvent.setSummary("Pinkpop"); //TODO what should be here?
			googleEvent.setLocation(event.getEventPlace());
			googleEvent.setDescription(event.getEventDescription());
			googleEvent.setStart(start);
			googleEvent.setEnd(end);			
			
			service.events().insert("primary", googleEvent).execute();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    boolean checkUserAvailiability(String startTime, String endTime){
    	com.google.api.services.calendar.Calendar service;
		try {
			service = getCalendarService();
			
	    	FreeBusyRequest req = new FreeBusyRequest();
	    	req.setTimeMin(new DateTime(startTime));
	    	req.setTimeMax(new DateTime(endTime));
	    	
			FreeBusyResponse response = service.freebusy().query(req).execute();
			return response.getCalendars().get("primary").getBusy().isEmpty();
	    	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return true;
    }
}

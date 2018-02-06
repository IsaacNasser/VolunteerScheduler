package io.github.xucsci260volunteerscheduler.domain;

import java.sql.Date;
import java.util.List;

public class Volunteer extends Person {

    private List<Date> availableTimes;

    public Volunteer(String first, String last, String email, String address, String city, String zip, Date birthday, String state, List<Date> availableTimes) {
        super(first, last, email, address, city, zip, birthday, state);

        this.availableTimes = availableTimes;
    }

    public List<Date> getAvailableTimes() {
        return availableTimes;
    }

    public void setAvailableTimes(List<Date> times) {
        availableTimes = times;
    }

    public Date addAvailableTime(Date time) {
        availableTimes.add(time);

        return time;
    }
}

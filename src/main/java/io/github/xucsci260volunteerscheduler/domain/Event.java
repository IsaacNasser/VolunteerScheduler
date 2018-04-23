package io.github.xucsci260volunteerscheduler.domain;

import java.sql.Date;
import java.util.Date;

/**
 *Created on 4/20
 * Event class
 */

public class Event {
    private String name, desc, email, phone, address, city, zip, state, startTime, endTime;
    private Date date;

    public Event(String name, String desc, String email, String phone, String address, String city, String zip, String state, String startTime, String endTime, Date date){
        State realState = State.valueOf(state);

        setVars(name, desc, email, phone, address, city, zip, state, startTime, endTime, date);
    }

    private void setVars(String name, String desc, String email, String phone, String address, String city, String zip, String state, String startTime, String endTime, Date date){
        this.name = name;
        this.desc = desc;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.city = city;
        this.zip = zip;
        this.state = state;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getDesc(){
        return desc;
    }

    public void setDesc(String desc){
        this.desc = desc;
    }

    public String getEmail(){
        return email;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public String getPhone(){
        return phone;
    }

    public void setPhone(String phone){
        this.phone = phone;
    }

    public String getAddress(){
        return address;
    }

    public void setAddress(String address){
        this.address = address;
    }

    public String getCity(){
        return city;
    }

    public void setCity(String city){
        this.city = city;
    }

    public String getZip(){
        return zip;
    }

    public void setZip(String zip){
        this.zip = zip;
    }

    public String getState(){
        return state;
    }

    public void setState(String state){
        this.state = state;
    }

    public void setStartTime(String startTime){
      this.startTime = startTime;
    }

    public void getStartTime(){
      return startTime;
    }

    public void setEndTime(String endTime){
      this.endTime = endTime;
    }

    public void getEndTime(){
      return endTime;
    }

    public void setDate(Date date){
      this.date = date;
    }

    public void getDate(){
      return date.getDate();
    }

}

package model.bean.users;

public class Person {
    private int id;
        private String namePerson;
        private String dateOfBirth;
        private String identityNumber;
        private String phoneNumber;
        private String email;

    public Person() {
    }

    public Person(int id, String namePerson, String dateOfBirth, String identityNumber, String phoneNumber, String email) {
        this.id = id;
        this.namePerson = namePerson;
        this.dateOfBirth = dateOfBirth;
        this.identityNumber = identityNumber;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }
    public Person( String namePerson, String dateOfBirth, String identityNumber, String phoneNumber, String email) {

        this.namePerson = namePerson;
        this.dateOfBirth = dateOfBirth;
        this.identityNumber = identityNumber;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamePerson() {
        return namePerson;
    }

    public void setNamePerson(String namePerson) {
        this.namePerson = namePerson;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getIdentityNumber() {
        return identityNumber;
    }

    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

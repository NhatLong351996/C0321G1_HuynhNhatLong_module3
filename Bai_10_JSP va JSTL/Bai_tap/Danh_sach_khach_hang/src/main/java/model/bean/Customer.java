package model.bean;

public class Customer {
    private String name;
    private String dayOfBirth;
    private String adress;
    private String image;

    public Customer(String name, String dayOfBirth, String adress, String image) {
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.adress = adress;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}

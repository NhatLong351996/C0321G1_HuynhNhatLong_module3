package model.bean.users;

public class Customer extends Person {
    private int typeCustomer;
    private String adress;

    public Customer() {
    }

    public Customer(int id, String namePerson, String dateOfBirth, String identityNumber, String phoneNumber, String email, String adress) {
        super(id, namePerson, dateOfBirth, identityNumber, phoneNumber, email);
        this.adress = adress;
    }

    public Customer(int id, String namePerson, String dateOfBirth, String identityNumber, String phoneNumber, String email, int typeCustomer, String adress) {
        super(id, namePerson, dateOfBirth, identityNumber, phoneNumber, email);
        this.typeCustomer = typeCustomer;
        this.adress = adress;
    }

    public Customer(String namePerson, String dateOfBirth, String identityNumber, String phoneNumber, String email, int typeCustomer, String adress) {
        super(namePerson, dateOfBirth, identityNumber, phoneNumber, email);
        this.typeCustomer = typeCustomer;
        this.adress = adress;
    }


    public int getTypeCustomer() {
        return typeCustomer;
    }

    public void setTypeCustomer(int typeCustomer) {
        this.typeCustomer = typeCustomer;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }
}

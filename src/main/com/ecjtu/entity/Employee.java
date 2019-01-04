package ecjtu.entity;

public class Employee {
    private int id;
    private String name;
    private String gender;
    private int age;
    private String birthday;
    private String address;
    private String department;

    public Employee() {
    }

    public Employee(int id, String name, String gender, int age, String birthday, String address, String department) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.birthday = birthday;
        this.address = address;
        this.department = department;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}

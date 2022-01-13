package kz.mun.decanat.model;

public class City {
    private long id;
    private String name;
    private String code;

    public City() {

    }

    public City(String name, String code) {
        this.name = name;
        this.code = code;
    }

    public City(long id, String name, String code) {
        this.id = id;
        this.name = name;
        this.code = code;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                '}';
    }
}

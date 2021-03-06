package kz.mun.decanat.model;

public class City {
    private Long id;
    private String name;
    private String code;
    private Long countryId;

    public City() {

    }

    public City(Long id, String name, String code, Long countryId) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.countryId = countryId;
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

    public Long getCountryId() {
        return countryId;
    }

    public void setCountryId(Long countryId) {
        this.countryId = countryId;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", countryId=" + countryId +
                '}';
    }
}

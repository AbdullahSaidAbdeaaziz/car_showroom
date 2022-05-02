package college.database.service;

import college.database.config.Producer;
import college.database.entities.Car;
import college.database.entities.SalesPerson;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;

import java.math.BigDecimal;
import java.util.List;

public class QueryService {

    // 1. not complete!
    public static Car findCarByModelAndManufacturer(String carModel, String manufacturer) {
        EntityManager manager = Producer.createEntityManager();
        try {
            return manager.createQuery("SELECT c FROM Car c WHERE c.manufacturer = :manufacturer AND c.model = :model", Car.class)
                    .setParameter("manufacturer", manufacturer)
                    .setParameter("model", carModel)
                    .getSingleResult();

        } finally {
            if (manager != null) {
                manager.close();
            }
        }
    }


    // 2
    public static List<Car> getCarsWithPriceBetween(BigDecimal minPrice, BigDecimal maxPrice) {
        EntityManager manager = Producer.createEntityManager();
        try {
            return manager.createQuery("SELECT c FROM Car c WHERE c.price BETWEEN :min AND :max", Car.class)
                    .setParameter("min", minPrice)
                    .setParameter("max", maxPrice)
                    .getResultList();
        } finally {
            if (manager != null) {
                manager.close();
            }
        }
    }


    // 3
    public static List<Object[]> getOrderedCarsModelWithPrice(double interest) {
        EntityManager manager = Producer.createEntityManager();
        try {
            List<Object[]> cars = manager
                    .createQuery("SELECT c.price * 1.07, c.model FROM Car c ORDER BY c.price DESC", Object[].class)
                    .getResultList();

            return cars;
        } finally {
            if (manager != null) {
                manager.close();
            }
        }
    }

    // 5.
    // TODO: get the price and options price with JPQL
    public static List<Car> getAllCars() {
        EntityManager manager = Producer.createEntityManager();
        try {
            return manager.createQuery("SELECT c FROM Car c LEFT JOIN FETCH c.options", Car.class)
                    .getResultList();
        } finally {
            if (manager != null) {
                manager.close();
            }
        }
    }


    public static List<SalesPerson> getSalesPersonWithNamePrefix(String prefix) {
        EntityManager manager = Producer.createEntityManager();
        try {
            return manager.createQuery("SELECT s FROM SalesPerson s WHERE s.name LIKE CONCAT(:pattern, '%')", SalesPerson.class)
                    .setParameter("pattern", prefix)
                    .getResultList();
        } finally {
            manager.close();
        }

    }

    // 7.
    public static List<String> getNamesOfSalesPeopleWithNoNumber() {
        EntityManager manager = Producer.createEntityManager();
        try {
            return manager.createQuery("SELECT s.name FROM SalesPerson s WHERE s.phone IS NULL", String.class)
                    .getResultList();
        } finally {
            if (manager != null) {
                manager.close();
            }
        }
    }

    // 9.
    public static List<Object[]> getSalesPeoplesSoldCarsNumberAndPrice() {
        EntityManager manager = Producer.createEntityManager();
        try {
            return manager.createQuery("SELECT s.name, count(sale.id), sum (sale.salePrice) FROM SalesPerson s LEFT JOIN Sale sale ON sale.id.salespersonId = s.id GROUP BY sale.id.salespersonId",
                            Object[].class)
                    .getResultList();
        } finally {
            if (manager != null) {
                manager.close();
            }
        }
    }


    public static Car getCheapestCar() {
        EntityManager manager = Producer.createEntityManager();
        try {
            return manager
                    .createQuery("SELECT c FROM Car c ORDER BY c.price ASC", Car.class)
                    .getResultList()
                    .get(0);
        } finally {
            if (manager != null) {
                manager.close();
            }
        }
    }
}

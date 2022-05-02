package college.database;

import college.database.entities.Car;
import college.database.service.QueryService;

// TODO: query 4 and 8 (views)
public class Test {
    public static void main(String[] args) {

        // Query 1
/*
        Car toyota = QueryService.findCarByModelAndManufacturer("Corolla", "Toyota");
        System.out.println(toyota.getPrice());
        System.out.println(toyota.getSerialNumber());
        System.out.println(toyota.getManufacturer());
        System.out.println(toyota.getModel());
*/


        // Query 2
/*
        List<Car> carsBetween = QueryService.getCarsWithPriceBetween(new BigDecimal(150000L), new BigDecimal(250000L));
        for (Car car : carsBetween) {
            System.out.println(car.getModel() + " with price: " + car.getPrice());
        }

*/

        // Query 3
/*
        List<Object[]> orderedCars = QueryService.getOrderedCarsModelWithPrice(0.7d);
        for (Object[] orderedModelPrice : orderedCars) {
            System.out.println(orderedModelPrice[0] + ", with price: " + orderedModelPrice[1]);
        }
*/


        // Query 5
/*
        List<Car> allCars = QueryService.getAllCars();
        for (Car car : allCars) {
            BigDecimal totalPrice = car.getOptions()
                    .stream()
                    .map(CarOption::getPrice)
                    .reduce(car.getPrice(), BigDecimal::add);
            System.out.println("Car model " + car.getModel() + " with total price: " + totalPrice);
        }
*/
        // Query 6
        /*
        List<SalesPerson> salesPersons = QueryService.getSalesPersonWithNamePrefix("S");
        for (SalesPerson salesPerson : salesPersons) {
            System.out.println(salesPerson.getId());
            System.out.println(salesPerson.getName());
            System.out.println(salesPerson.getPhone());
            System.out.println("=======================");
        }

         */

        // Query 7
        /*
        List<String> salesPeopleWithNoNumber = QueryService.getNamesOfSalesPeopleWithNoNumber();
        for(String salesPerson : salesPeopleWithNoNumber) {
            System.out.println(salesPerson);
        }
        */

        // Query 9
        /*
        List<Object[]> salesPeoplesSoldCarsNumberAndPrice = QueryService.getSalesPeoplesSoldCarsNumberAndPrice();
        for (Object[] obj : salesPeoplesSoldCarsNumberAndPrice) {
            String name = (String) obj[0];
            Long soldCars = (Long) obj[1];
            BigDecimal totalPrice = (BigDecimal) obj[2];
            System.out.printf("%s sold %d cars with total price: %s%n", name, soldCars, totalPrice.toString());
        }
        */

        // Query 10
        Car cheapestCar = QueryService.getCheapestCar();
        System.out.println("Cheapest car details");
        System.out.println("==================================");
        System.out.println("Manufacturer: " + cheapestCar.getManufacturer());
        System.out.println("Model: " + cheapestCar.getModel());
        System.out.println("Price: " + cheapestCar.getPrice());
        //... display the rest of the data
        System.out.println("==================================");
    }
}

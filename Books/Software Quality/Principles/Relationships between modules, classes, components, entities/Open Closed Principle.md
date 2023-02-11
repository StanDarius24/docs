#softwareQuality 

## Open-Closed Principle

##### Objects or entities should be open for extension but closed for modification.

Bad example:

```java
public class VehicleInfo {
	public double vehicleNumber(Vehicle vcl) {
		if (vcl instanceof Car) {
		} else if (vcl instanceof Bike) {
		}
	}
}
```

Good Example:

```java
public class VehicleInfo {
	public double vehicleNumber() {
	}
}
public class Car extends VehicleInfo {
	 public double vehicleNumber() {
	 }
}
public class Car extendsTruck {
	public double vehicleNumber() {
	}
}
```

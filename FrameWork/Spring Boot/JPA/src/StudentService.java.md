```java
package org.example.services;

import org.example.entity.Student;
import org.example.repository.StudentRepository;

import javax.inject.Inject;
import java.util.Arrays;

public class StudentService {

    @Inject
    private StudentRepository service;

    public void createStudent() {
        var student = new Student();
        student.setName("DaniB");
        student.setCourses(Arrays.asList("PDSS", "SO"));
        service.save(student);

    }

}
```

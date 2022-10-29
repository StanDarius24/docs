```java
package org.example.repository;

import org.apache.deltaspike.data.api.Repository;
import org.apache.deltaspike.data.api.EntityRepository;
import org.example.entity.Student;

@Repository
public interface StudentRepository extends EntityRepository<Student, Long>{
}
```

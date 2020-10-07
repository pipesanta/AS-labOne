package com.udea.entity;

import com.udea.entity.Student;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-06T22:49:47")
@StaticMetamodel(Course.class)
public class Course_ { 

    public static volatile SingularAttribute<Course, Integer> credits;
    public static volatile SingularAttribute<Course, String> cName;
    public static volatile ListAttribute<Course, Student> studentList;
    public static volatile SingularAttribute<Course, String> courseid;

}
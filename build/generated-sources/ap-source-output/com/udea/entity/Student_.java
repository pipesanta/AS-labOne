package com.udea.entity;

import com.udea.entity.Course;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-06T22:49:47")
@StaticMetamodel(Student.class)
public class Student_ { 

    public static volatile SingularAttribute<Student, String> password;
    public static volatile SingularAttribute<Student, String> photo;
    public static volatile ListAttribute<Student, Course> courseList;
    public static volatile SingularAttribute<Student, String> id;
    public static volatile SingularAttribute<Student, String> fullname;

}
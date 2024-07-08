ABSTRACT
 
 
 
Automated systems have many Advantages over manual systems like they have lower cost and high product quality, so the aim of this project we develop an automated smart system for validating and quality tracking for Pepsi cans on a conveyor belt using computer vision and image processing algorithms.

 this project consists of a conveyor belt which carry the products which is Pepsi cans in our project with a camera used capture images of the cans as they move along the conveyor belt and employs computer vision techniques via MATLAB to analyze these images and determine whether the cans are valid or invalid.  
 4-DOF arm robot to pick the can from the conveyor and place it into garbage if the can is invalid and move the can to a different position according to the specific allowed product quality.

thereby reducing waste and improving efficiency via providing information about cans every day. 
The project demonstrates the potential of computer vision and robotics in enhancing quality control processes in manufacturing and production environments.




Table of contents
Table of Contents
Abstract......................................................................................................................... 4
Table of content 2 ........................................................................................................5

Ch 1: Introduction 
                   1. Automated systems operations ................................................................6
                   2. Project summarized overview....................................................................7
                   3. Methodology and Expected outcomes.....................................................8
                   4.Team work

Ch 2: Hardware components and software tools 
                   1.Controllers 
                   2.Motors and drivers.......................................................................................9
                   3.Electronic devices .............................................................                        
                   4.Camera...................................................................................................
                   5.Software tools.........................................................................
                   6.Bill of materials.............................................................................................

Ch 3: Portable conveyor belt 
Hardware components and assembling
How it works
Circuit diagram
Code
    
Chapter 4 
Image Processing & Computer Vision Techniques
What is image processing?
Algorithms in image processing
Types of image processing algorithms 
Used algorithms.
Surf algorithm
Orb algorithm
Implementation
Code 

Ch 3: Four DOF robot arm
Introduction 
Hardware components 
How it works
Inverse kinematics
Hardware assembling
Wiring
Code

Conclusion

Appendix

Appendix A
Appendix B
Appendix C

Introduction

What Does Automated System Operations Mean?

Automated system operations (ASO) are the set of software and hardware that allows computer systems, network devices or machines to function without any manual intervention. ASOs allow computer systems to work without a human operator physically located at the site where the system is installed. Automated system operations are a part of the automatic system control where the processes are completely automated with the help of control loops and special logic.
Automated system operations are also known as lights-out operations.
Techopedia Explains Automated System Operations
Automated system operations are a combination of both software and hardware that is designed and programmed to work automatically without the need for a human operator to provide inputs and instructions for each operation.
Automated system operations are used in a wide range of applications like control and monitoring systems, data security applications, factory automation systems, automated message response systems and so on. These systems take several system and environmental events as input and perform operations based on conditional decision making and specific control logic.
Some of the benefits of automated system operations are:
Eliminates the risk of human errors.
Improves user productivity.
Provides standardized operations.
Provides better operations management and logging.
The use of automated system operations saves labor, time and cost while increasing the accuracy and precision of the job being carried out. It increases the availability, performance and reliability of the services delivered.
Automated system operations had their origins with the introduction of the OS/360 operating system by IBM. OS/360 allowed automated allocation of system resources and batch processing of jobs. The continuing need for complex operating systems, databases, communications, and other operations have paved the way for the development of more advanced automated technologies. Advancements in robotics and artificial intelligence have also given rise to more powerful and efficient automation systems.
Automated operations reduce the complexity of labor-intensive tasks. Some of the most widely used applications that incorporate ASO include scheduling, management of console messages, backup and recovery, printing services, performance tuning, network monitoring and bug detection.
Though the automated system operations can result in higher productivity and reduced costs, the initial cost of setting up an ASO is high and requires research and development efforts.
So, we decided to build an automated system and we will show how we build it in detail in this book.

Summarized overview

In today's highly automated manufacturing industry, ensuring product quality and efficiency is of utmost importance. The ability to accurately and efficiently analyze and classify products is crucial for maintaining high standards and reducing waste. In this project, a solution that combines computer vision techniques and robotics to achieve these objectives in the context of a conveyor belt system.
The project focuses on the transportation and analysis of Pepsi cans along a conveyor belt. A camera is utilized to capture images of the cans as they move along the belt. These images are then processed using computer vision techniques implemented in Matlab. The goal is to analyze the images and determine whether the cans are valid or invalid based on predefined criteria.
To further enhance the efficiency and automation of the system, a 4-DOF (Degree of Freedom) robotic arm is integrated into the project. This robotic arm is responsible for picking up the cans from the conveyor belt and placing them into the appropriate location based on their quality. If a can is determined to be invalid, the arm will move it to a designated garbage area. On the other hand, if the can meets the quality standards, the arm will move it to a different position according to the specific allowed product quality.

Additionally, the project aims to provide real-time feedback and indication about the process to increase efficiency. This feedback can include various metrics such as the number of valid and invalid cans detected, the overall throughput of the system, and any potential bottlenecks or issues that may arise during operation. By monitoring and analyzing this feedback, operators and supervisors can make informed decisions and take necessary actions to optimize the system's performance.

Overall, this project combines the fields of computer vision, robotics, and automation to create a conveyor belt system that can accurately analyze and classify Pepsi cans. By utilizing computer vision techniques and a robotic arm, the system can efficiently sort, and handle cans based on their quality. The integration of real-time feedback further enhances the system's efficiency and allows for continuous improvement in the manufacturing process.

Methodology 

The methodology for this project involves several stages, including:
Research: Conducting a thorough literature review of computer vision, image processing, and robotic control systems to identify the most suitable techniques for the project.
System Design: Designing the system architecture and selecting the appropriate hardware and software components.
Implementation: Developing and integrating computer vision algorithms, image processing techniques, and robotic control system.
Testing and Validation: Testing the system's functionality and performance and validating its accuracy and efficiency.


Expected Outcomes:

The expected outcomes of this graduation project include:
A fully functional automated system for validating Pepsi cans using computer vision and image processing techniques.
Increased production efficiency and reduced waste due to the automation of the inspection and sorting process.
Improved product quality and consistency, resulting in increased customer satisfaction.

   Teamwork

The project is divided into three stages the first is conveyer which have two engineers to work for the hardware assembling and code 
Second stage is computer vision which also have two engineers to work 
The third stage is the biggest which has four engineers the robot arm assembling and code writing, and the testing. 


# EventTrackerProject


## Outbound App
<details>
  <summary>Table of Contents</summary>
  <ul>
    <li>
      <a href="#about-the-project">About The Project</a>
  </ul>
      <ul>
        <li><a href="#technologies-used">Technologies Used</a></li>
      </ul>
    </li>
  <ul>
    <li><a href="#howitworks">How It Works</a></li>
  </ul>  
  <ul>
    <li><a href="#Lessons-I-Learned">Lessons Learned</a></li>
  </ul>
  <ul>
    <li><a href="#contact">Contact</a></li>
  </ul>

  <ul>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
    </ul>

</details>

## About The Project

<p>The Event Tracker Project is an application that lets a user create and keep track of a specific type of data</p>
<ol>
<li><strong><em>C</em></strong>reate - Create a new hunt in the database </li>
<br>
<li><strong><em>R</em></strong>ead - View the all or a single hunt in the database</li>
<br>
<li><strong><em>U</em></strong>pdate - Update Previously defined hunts in the database</li>
<br>
<li><strong><em>D</em></strong>elete - Delete a hunt that is currently in the database </li>
</ol>
<!--[![Product Name Screen Shot][product-screenshot]](https://example.com) -->

<p align="right">(<a href="#top">back to top</a>)</p>

### Technologies Used

-   [Spring Tools 4](https://spring.io/tools)
-   [Gradle Build Tool](https://gradle.org/install/)
-   [MAMP Free](https://www.mamp.info/en/mac/)
-   [Apache Tomcat v8.5](https://tomcat.apache.org/)
-   [MySQL](https://www.mysql.com/)
-   [Atom Text Editor](https://atom.io/)
-   [REST](https://restfulapi.net/)
-   [GITHUB](https://github.com/)

<p align="right">(<a href="#top">back to top</a>)</p>


## How It Works

<p>
The purpose of the Outbound app is to allow a user to create, read, update and delete hunts and keep track of them within a database. The application will grow into the ability of creating a user, gear list and hunt events.
</p>

| HTTP Verb | URI                  | Request Body | Response Body | Purpose |
|-----------|----------------------|--------------|---------------|---------|
| GET       | `/api/hunttrips`     |              | Collection of representations of all hunting trips  | **List** or **collection** endpoint |
| GET       | `/api/hunttrips/1`   |              | Representation of hunting trip `1` | **Retrieve** endpoint |
| GET       | `/api/hunttrips/search/elk`   |              | Representation of hunting trips with `elk` | **Retrieve** endpoint |
| POST      | `/api/hunttrips`     | Representation of a new hunting trip | Description of the result of the operation | **Create** endpoint |
| PUT       | `/api/hunttrips/1`   | Representation of a new hunting trip `1` | | **Replace** endpoint |
| DELETE    | `/api/hunttrips/1`   |              | | **Delete** route |



<p align="right">(<a href="#top">back to top</a>)</p>


## Lessons I Learned
<ol>
<li>
While creating the Event Track Project, it help fortify my knowledge of the REST api creation that we learned while in class. I had some trouble understanding the syntax's I
 needed to user to complete operations. After figuring out everything correctly, I tried to find a hunt by a specific species and by keyword, which gave me some issues while trying it and will need to request help as its giving me a casting error that doesn't make sense. Im hoping the more we do RESTful services I will start to understand this more.
</li>

<p align="right">(<a href="#top">back to top</a>)</p>


## Contact




<h4>Lucas Paladini</h4>
<ul>
<li><a href="https://www.linkedin.com/in/lucas-paladini/">LinkedIn</a></li>
<li><a href="https://github.com/Lpaladini90">Github</a></li>
<li> E-mail: LucasJPaladini@gmail.com</li>
</ul>


Project Link: [Event Tracker Project](https://github.com/Lpaladini90/EventTrackerProject)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

1.) What is HTML? What is CSS? What is Javascript?
    Answer: 
      These are front end client side languages.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
    
2.) What are the major parts of an HTTP request?
     Answer:
      An HTTP request consists of a method type, URL, parameters.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~       
      
3.) What are the major parts of an HTTP response?
      Answer: 
        HTTP response consists of a status code and a message.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~        
        
4.) How do you submit an HTTP POST request, with a "username" attribute set to "bob"? What if we wanted a GET request instead? 
      Answer:
        POST www.URLhere.com?username=bob
        GET  www.URLhere.com?username=bob
        
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     
5.) Why is it important for us, as web developers, to understand that HTTP is a "stateless" protocol? 
      Answer:
        In stateless protocols the server does not hang on to information between requests. So every request is treated as a brand new entity. This effect's an applications infromation.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         
        
6.) If the internet is just HTTP requests/responses, why do we only use browsers to interface with web applications? Are there any other options? 
      Answer:
        You can also use an HTTP tool for requests but the information returned is in raw form. a Browser allows us to see the dynamic content.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         
        
7.) What is MVC, and why is it important? 
      Answer:
        MVC is a diagram that shows us the controller/model/view. It is a pattern of organizing code. FYI in rails never put your ciew code in models.
 
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~        
Sinatra Questions
1.) At a high level, how are requests processed?
      requests are processed with status code. They are either rendered or redirected.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~       
    
2.) In the controller/action, what's the difference between rendering and redirecting? 
      Rendering returns a template which will display dynamic content 
      Redirecting will forward you to antoher URL Path which will render a template 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
      
3.) In the ERB view template, how do you show dynamic content?
      <%= %>, the equal sign shows code to display without an equal sign it is just interpreted as code. you can also incorporate helpers and instance variables.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
      
4.) Given what you know about ERB templates, when do you suppose the ERB template is turned into HTML?
      ERB becomes HTML when you render a webpage.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
      
5.) What's the role of instance variables in Sinatra? 
      Instance Variables keep track of the state of something like a button or a pop up window. They are how we set up variables in the view layer.
        
    
      

   
    
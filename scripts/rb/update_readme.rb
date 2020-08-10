# ./scripts/rb/update_readme.rb
require "json"
require "faraday"

# Get all posts
# Take a look how we obtain our secret key by using ENV[]
response = Faraday.get(
  "https://dev.to/api/articles/me/published",
  {},
  { "api-key": ENV["DEV_TO_API_KEY"] }
)

# Retrieve `title`, `url`, and `description` and
# wrap it to markdown syntax
posts = JSON.parse(response.body).map do |article|
  <<~EOF
  [#{article['title']}](#{article['url']})\n
  EOF
end

# Generate your own layout and paste posts in it
# Don't forget to change text and name =)
markdown = <<~EOF
  
<div align="center">
<img src="https://media1.tenor.com/images/9ea72ef078139ced289852e8a4ea0c5c/tenor.gif?itemid=7537923" align="center" height="200" width="200" />
</div>  
  

### <div align="center">I'm Omar ElKhatib, I write my first  🖥️ program when I was 12 years old</div>  
  

- 🌱 I’m currently learning DevOps and clean coding with refactoring.  
  

<br/>  


## My Skill Set  
<table><tr><td valign="top" width="33%">

### Frontend  
<div align="center">  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/react/react-original-wordmark.svg" alt="React" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/bootstrap/bootstrap-plain.svg" alt="Bootstrap" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/css3/css3-original-wordmark.svg" alt="CSS3" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/html5/html5-original-wordmark.svg" alt="HTML5" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/javascript/javascript-original.svg" alt="JavaScript" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/typescript/typescript-original.svg" alt="TypeScript" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/sass/sass-original.svg" alt="Sass" height="50" />  
</div></td><td valign="top" width="33%">

### Backend  
<div align="center">  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/django/django-original.svg" alt="Django" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/javascript/javascript-original.svg" alt="JavaScript" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/typescript/typescript-original.svg" alt="TypeScript" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/mongodb/mongodb-original-wordmark.svg" alt="MongoDB" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/nginx/nginx-original.svg" alt="Nginx" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/python/python-original.svg" alt="Python" height="50" />  
<img style="margin: 10px" src="https://www.vectorlogo.zone/logos/gnu_bash/gnu_bash-icon.svg" alt="Bash" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/nodejs/nodejs-original-wordmark.svg" alt="Node.js" height="50" />  
</div>  



### Others  
<div align="center">  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/csharp/csharp-original.svg" alt="C#" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/java/java-original-wordmark.svg" alt="Java" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/cplusplus/cplusplus-original.svg" alt="C++" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/c/c-original.svg" alt="C" height="50" />  
</div></td><td valign="top" width="33%">

### DevOps  
<div align="center">  
<img style="margin: 10px" src="https://www.vectorlogo.zone/logos/kubernetes/kubernetes-icon.svg" alt="Kubernetes" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/linux/linux-original.svg" alt="Linux" height="50" />  
<img style="margin: 10px" src="https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg" alt="Git" height="50" />  
<img style="margin: 10px" src="https://www.vectorlogo.zone/logos/gnu_bash/gnu_bash-icon.svg" alt="Bash" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="AWS" height="50" />  
<img style="margin: 10px" src="https://devicons.github.io/devicon/devicon.git/icons/docker/docker-original-wordmark.svg" alt="Docker" height="50" />  
</div></td></tr></table>  

<br/>  


## Connect with me  
<div align="center">
<a href="https://github.com/OmarElKhatibCS" target="_blank">
<img src=https://img.shields.io/badge/github-%2324292e.svg?&style=for-the-badge&logo=github&logoColor=white alt=github style="margin-bottom: 5px;" />
</a>
<a href="https://twitter.com/omarkhwarzmi" target="_blank">
<img src=https://img.shields.io/badge/twitter-%2300acee.svg?&style=for-the-badge&logo=twitter&logoColor=white alt=twitter style="margin-bottom: 5px;" />
</a>
<a href="https://dev.to/elkhatibomar" target="_blank">
<img src=https://img.shields.io/badge/dev.to-%2308090A.svg?&style=for-the-badge&logo=dev.to&logoColor=white alt=devto style="margin-bottom: 5px;" />
</a>
<a href="https://linkedin.com/in/elkhatibomar" target="_blank">
<img src=https://img.shields.io/badge/linkedin-%231E77B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white alt=linkedin style="margin-bottom: 5px;" />
</a>  
</div>  
  

<br/>  

<br/>  

<br/>  


<br />

----
<div align="center">Generated using <a href="https://profilinator.rishav.dev/" target="_blank">Github Profilinator</a></div>
My last publication:
\n
#{posts[0]}
EOF

# Write you markdown to README.MD
File.write("./README.md", markdown)

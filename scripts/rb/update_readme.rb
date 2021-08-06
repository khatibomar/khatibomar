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

quote_response = Faraday.get "http://quotes.stormconsultancy.co.uk/random.json"
quote = JSON.parse(quote_response.body)

# Generate your own layout and paste posts in it
# Don't forget to change text and name =)
markdown = <<~EOF

### <div align="center">I ✍️ my first  🖥️ program when I was 12 years old.</div>  
  
<br/>  

## My Skill Set  
<table><tr>


<td valign="top" width="25%">
<div align="center">  
  
  ### Frontend  
  
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/react/react-original.svg" alt="React" height="50" />  
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/javascript/javascript-original.svg" alt="JavaScript" height="50" />  
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/typescript/typescript-plain.svg" alt="TypeScript" height="50" />  
</div></td>

<td valign="top" width="25%">
<div align="center"> 
  
### Backend  
  
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/go/go-original.svg" alt="Go" height="50" /> 
</div>  

 
<td valign="top" width="25%">
<div align="center">  
  
  ### DevOps 
  
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/kubernetes/kubernetes-plain.svg" alt="Kubernetes" height="50" />  
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/git/git-original.svg" alt="Git" height="50" />  
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" alt="Bash" height="50" />  
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original.svg" alt="Docker" height="50" />  
</div></td>

<td valign="top" width="25%">
<div align="center">  
  
  ### Tools
  
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/linux/linux-original.svg" alt="Linux" height="50" /> 
<img style="margin: 10px" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/vim/vim-original.svg" alt="Vim" height="50" />  
<img style="margin: 10px" src="https://blog.jetbrains.com/wp-content/uploads/2019/01/goland_icon.svg" alt="Goland" height="50" />  
<img style="margin: 10px" src="https://sw.kovidgoyal.net/kitty/_static/kitty.svg" alt="Kitty" height="50" />  

</div></td>
    </tr>
  </table>  

<br/>  

## Connect with me  
<div align="center">
<a href="https://github.com/OmarElKhatibCS" target="_blank">
<img src=https://img.shields.io/badge/github-%2324292e.svg?&style=for-the-badge&logo=github&logoColor=white alt=github style="margin-bottom: 5px;" />
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
My last publication:
\n
#{posts[0]}
---
Quote of today :
    \n
  
#{quote['quote']}  - #{quote['author']}
  
---
<table><tbody><tr><td><a href="https://octo-ring.com/"><img src="https://octo-ring.com/static/img/widget/top.png" width="99%" alt="Octo Ring logo" align="top"></a><br><a href="https://octo-ring.com/p/OmarElKhatibCS/prev"><img src="https://octo-ring.com/static/img/widget/prev.png" width="33%" alt="previous" align="top" title="previous profile"></a><a href="https://octo-ring.com/p/OmarElKhatibCS/random"><img src="https://octo-ring.com/static/img/widget/random.png" width="33%" alt="random" align="top" title="random profile"></a><a href="https://octo-ring.com/p/OmarElKhatibCS/next"><img src="https://octo-ring.com/static/img/widget/next.png" width="33%" alt="next" align="top" title="next profile"></a><br><a href="https://octo-ring.com/"><img src="https://octo-ring.com/static/img/widget/bottom.png" width="99%" alt="check out other GitHub profiles in the Octo Ring" align="top"></a></td></tr></tbody></table>
EOF

# Write you markdown to README.MD
File.write("./README.md", markdown)

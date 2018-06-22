# robot-repository
Ruby on Rails repository that allows PDFs and Word documents to be indexed and searched. This application uses elastic search to search content. 

First off, I love robots. More to the point though, in the environment I work in, we produce a lot of digital content. Content in this reference means stories, editorials, ads, brochures and basically anything an agency produces for websites, print, copy and essentially all that combines words with images. Here presents the problem, after a project has been completed and the product goes into production, all is forgotten. Is that so bad? Well, everything is fine until someone in your group says, “didn’t we write a sorry about this person last year?” Taking into account employee churn, people storing files locally and other inter-office procedural-oddities, you find yourself and your team scrambling for a printout, an email or some shred of evidence like Sherlock Holmes solving a murder mystery. The goal of the application is to provide some automation or robotic like process to the archiving and indexing of these valuable documents.

## It Solves Problems
What if there was an enterprise-wide repository where employees could upload their completed collateral. During this process this web app would strip all the text from the PDF (portable document format), store the original creative material and automatically notify team members that an uploaded document is now indexed and available for search inside the repository.

## Infrastructure
More on the proof of concept side, this web application is designed to be spun-up privately on a rails server, individually. Employees could log in and get accounts and administrators could deny or delete users. All users would have access to their company’s documents. From a security perspective, this product does require a verified and confirmed login but beyond that, only administrators have the rights to delete any uploaded documents. Normal users can only delete their own uploaded materials.

![robot-dashboard](https://user-images.githubusercontent.com/24664863/41758193-f76a9cd8-759b-11e8-826f-9ad196d58015.jpg)

## Gem Dependencies
'sass-rails', '~> 5.0'
'uglifier', '>= 1.3.0'
'coffee-rails', '~> 4.1.0'
'jquery-rails'
'turbolinks'
'bootstrap-sass'
'figaro'
'devise'
'aws-sdk', '< 2.0'
'paperclip'
'docsplit-paperclip-processor', '0.2.2'
'paperclip-ghostscript'
'cocaine','0.5.3'
'searchkick'
'bonsai-elasticsearch-rails'
'kaminari'
'bootstrap-kaminari-views'

Development:
sqlite3
byebug
spring
shoulda

Production:
pg
rails_12factor

Keep in mind that this is only a proof of concept. Connections to AWS and mailservers need to be documented fully.

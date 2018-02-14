# laravel-favicon
A Laravel SH Script that generates a favicon across different devices, browsers, and operating systems. 

## This uses realfavicongenerator.net
No reason to reinvent the wheel, they already have this process down, with solid previews. 

## Step 1
Go to https://realfavicongenerator.net/ and follow there instructions. 
*Make sure you check html_code as indicated in the imag below*
<img src="https://github.com/pkeogan/laravel-favicon/master/blob/master/html_code_preview.png">

### Step 2
Get the laravel-favicon.sh
```sh
wget "https://raw.githubusercontent.com/pkeogan/laravel-favicon/master/laravel-favicon.sh"
```
### Step 3
Run The Install (See next step on where to get the link from)
```sh
bash laravel-favicon.sh
```

## Step 4 
Retreive the location to the package by right clicking on the download and clicking 
<img src="https://github.com/pkeogan/laravel-favicon/blob/master/copy_link.png">

## Step 5
Paste the link into your ssh
```sh
...
Where is the location of the favicon package? (ensure you included htlm_code)
https://realfavicongenerator.net/files/cf7db672134213421342134234bf6/favicon_package_v0.16.zip
...
```

Now your all installed and ready to use!

# Usage
## In blade.php files
to include your favicon html markup, simply use the below @include in your <head>
`@includeif('vendor.laravel-favicon.favicon')`
And your all done and ready to use!
  
  
# Update
If you need to change or update your favicons, simply rerun the install, as it will overwrite the old one. A helpful combination is to use verisoning that is built in with tehe favicon generator. 

# Future
In the future I will have this done by webpack, and will be ran each time by npm

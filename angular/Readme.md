# Angular 4 idiosyncrasies

* For using ```[(ngModel)]``` in Angular 2, 4 & 5, You need to import FormsModule from ```'@angular/forms'```
* Angular CLI, create components in different folders instead of the default ```src/app``` folder: ```ng generate component my-folder/hello-world```
* CDK is the short form of component dev kit. This signifies that these are general-purpose tools for building components that are not coupled to Material Design
* Create a new project with SASS with the following: ```ng new my-sassy-app --style=scss```
* Make a ```production build```: ```ng build --target=production```

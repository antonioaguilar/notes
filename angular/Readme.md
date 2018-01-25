# Angular 4 - Notes

### Angular idiosyncrasies
* For using ```[(ngModel)]``` in Angular 2, 4 & 5, You need to import FormsModule from ```'@angular/forms'```
* Angular CLI, create components in different folders instead of the default ```src/app``` folder: ```ng generate component my-folder/hello-world```
* CDK is the short form of component dev kit. This signifies that these are general-purpose tools for building components that are not coupled to Material Design
* Create a new project with SASS with the following: ```ng new my-sassy-app --style=scss```
* Make a ```production build```: ```ng build --target=production```
* Creating services, ```ng generate service random --module=app```, this will create the ```random``` service and include it automatically in the ```AppModule```
* Useful [blog post](https://coursetro.com/posts/code/59/Angular-4-Event-Binding) showing all the possible binding events in Angular
* The ```HttpClient``` in Angular 4 returns an observable instead of the a promise as in previous versions.

### Importing ```LoDash``` in Angular:

```bash
npm install --save lodash

# needed for the typings
npm install --save @types/lodash

# then in your component import LoDash
import * as _ from 'lodash';
```

### Importing ```jQuery``` in Angular:

```bash
npm install --save jquery

# needed for the typings
npm install --save @types/jquery

# then in your component import jQuery
import * as $ from 'jquery';
```

### Customizing Angular Material Themes

* Good intro [video](https://www.youtube.com/watch?v=kHbMm7psBag)
* Look inside the theming [folder](https://github.com/angular/material2/tree/master/src/lib/core/theming)

'use strict';

angular.module('composeUiApp')
  .filter('filterByName', function () {
    return function (projects, query) {

      var filteredProjects;

      if (query) {

        filteredProjects = _.chain(projects)
          .map(function (path, name) {
            return {
              name: name,
              path: path
            };
          })
          .filter(function (item) {
            return item.name.toLowerCase().indexOf(query.toLowerCase()) >= 0;
          })
          .map(function (item) {
            return [item.name, item.path];
          })
          .fromPairs()
          .value();

      } else {
        filteredProjects = projects;
      }

      return filteredProjects;
    };
  });